-- ============================================================
-- SQL PRACTICE — TOPIC 2: AGGREGATION
-- Dataset: RetailMart (PostgreSQL)
-- Concepts: COUNT, SUM, AVG, MIN, MAX, GROUP BY,
--            HAVING vs WHERE, TO_CHAR, EXTRACT, CTEs with LAG
-- ============================================================


-- Q1. Total revenue and average order value per city
--     Show only cities where total revenue is above overall average

SELECT c.city,
       SUM(o.total_amount) AS ttl_revenue,
       AVG(o.total_amount) AS avg_order_value
FROM customers.customers c
JOIN sales.orders o ON o.cust_id = c.cust_id
GROUP BY c.city
HAVING SUM(o.total_amount) > (SELECT AVG(total_amount) FROM sales.orders);

-- NOTE:
-- HAVING uses full expression SUM(o.total_amount), not alias ttl_revenue
-- Aliases defined in SELECT are not available in HAVING (processed before SELECT)
-- Subquery inside HAVING must reference table directly, not outer query alias
-- AVG in subquery = average revenue per ORDER, not per city


-- ---------------------------------------------------------------

-- Q2. Find the month with the highest number of orders placed
--     Display month name not number

SELECT TO_CHAR(order_date, 'Month') AS month_name,
       COUNT(*) AS order_count
FROM sales.orders
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY order_count DESC
LIMIT 1;

-- NOTE:
-- TO_CHAR(date, 'Month') converts date to full month name text
-- TO_CHAR(date, 'Mon')   → abbreviated: Jan, Feb
-- TO_CHAR(date, 'MM')    → number: 01, 02
-- GROUP BY must repeat the full TO_CHAR expression (alias not allowed in GROUP BY)
-- ORDER BY can use alias (order_count) since it runs after SELECT
-- SQL execution order: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT


-- ---------------------------------------------------------------

-- Q3. Top 3 customers by total amount spent
--     Exclude individual orders below 500

SELECT c.full_name,
       SUM(o.total_amount) AS ttl_spent
FROM customers.customers c
JOIN sales.orders o ON c.cust_id = o.cust_id
WHERE o.total_amount >= 500
GROUP BY c.cust_id, c.full_name
ORDER BY ttl_spent DESC
LIMIT 3;

-- NOTE:
-- WHERE filters individual rows BEFORE grouping (row level)
-- HAVING filters groups AFTER grouping (group level)
-- Here: exclude orders < 500 first (WHERE), then sum the rest
-- If HAVING used instead: ₹400 order would be included in sum first — wrong logic
-- GROUP BY must include all non-aggregated SELECT columns (cust_id + full_name)


-- ---------------------------------------------------------------

-- Q4. Categories where avg price > 1000 AND product count >= 5

SELECT category
FROM products.products
GROUP BY category
HAVING AVG(price) > 1000 AND COUNT(prod_id) >= 5;

-- NOTE:
-- Both conditions are group-level → both go in HAVING
-- COUNT(prod_id) preferred over COUNT(*) — counts only non-null prod_ids
-- No JOIN needed — category and price both in products table


-- ---------------------------------------------------------------

-- Q5. Day of week with highest total revenue
--     Display day name not number

SELECT TO_CHAR(order_date, 'Day') AS day_name,
       SUM(total_amount) AS total_revenue
FROM sales.orders
GROUP BY TO_CHAR(order_date, 'Day')
ORDER BY total_revenue DESC
LIMIT 1;

-- NOTE:
-- TO_CHAR(date, 'Day') → full day name: Monday, Tuesday etc.
-- TO_CHAR(date, 'Dy')  → abbreviated: Mon, Tue etc.
-- Same pattern as Q2 but 'Day' instead of 'Month'


-- ---------------------------------------------------------------

-- Q6. Per customer: first order date, last order date, total orders
--     Show only customers with more than 3 orders

SELECT cust_id,
       MIN(order_date) AS first_order_date,
       MAX(order_date) AS last_order_date,
       COUNT(order_id) AS total_orders
FROM sales.orders
GROUP BY cust_id
HAVING COUNT(order_id) > 3;

-- NOTE:
-- MIN(order_date) = earliest/first order date
-- MAX(order_date) = latest/last order date
-- HAVING COUNT(order_id) > 3 is group-level filter → correct placement
-- No JOIN needed if customer name not required


-- ---------------------------------------------------------------

-- Q7. Percentage contribution of each category to total revenue

SELECT p.category,
       ROUND(SUM(o.total_amount) * 100.0 / (SELECT SUM(total_amount) FROM sales.orders), 2) AS contribution
FROM products.products p
JOIN sales.order_items oi ON p.prod_id = oi.prod_id
JOIN sales.orders o ON oi.order_id = o.order_id
GROUP BY p.category;

-- NOTE:
-- Three table join: products → order_items → orders
-- order_items is the bridge table linking products to orders
-- * 100.0 forces float division (not integer division)
-- Subquery in SELECT returns single value = total revenue across all orders
-- ROUND(..., 2) = 2 decimal places


-- ---------------------------------------------------------------

-- Q8. Months where total revenue dropped vs previous month
--     Using CTE + LAG window function

WITH cte AS (
    SELECT
        EXTRACT(MONTH FROM order_date) AS month_num,
        TO_CHAR(order_date, 'Month') AS month_name,
        SUM(total_amount) AS total_revenue
    FROM sales.orders
    GROUP BY EXTRACT(MONTH FROM order_date), TO_CHAR(order_date, 'Month')
),
cte2 AS (
    SELECT
        month_name,
        total_revenue,
        LAG(total_revenue) OVER (ORDER BY month_num) AS prev_revenue
    FROM cte
)
SELECT month_name,
       total_revenue,
       prev_revenue
FROM cte2
WHERE total_revenue < prev_revenue;

-- NOTE:
-- Two CTEs needed because window functions cannot be used in WHERE directly
-- cte  → calculates monthly revenue (needs month_num for correct chronological order)
-- cte2 → applies LAG to get previous month revenue
-- Final SELECT filters from cte2 where revenue dropped
-- LAG(total_revenue) OVER (ORDER BY month_num) → previous row's revenue in month order
-- No PARTITION BY → single continuous sequence of months
-- month_num used for ordering (not month_name — text sorts alphabetically not chronologically)
-- Once a column is in CTE2, no need to join back to CTE1 to retrieve it


-- ---------------------------------------------------------------

-- Q9. Customers who placed orders in every month of 2023

SELECT c.cust_id,
       c.full_name,
       COUNT(o.order_id) AS total_orders
FROM sales.orders o
JOIN customers.customers c ON c.cust_id = o.cust_id
WHERE EXTRACT(YEAR FROM o.order_date) = 2023
GROUP BY c.cust_id, c.full_name
HAVING COUNT(DISTINCT EXTRACT(MONTH FROM o.order_date)) = 12;

-- NOTE:
-- WHERE filters year = 2023 at row level before grouping
-- COUNT(DISTINCT EXTRACT(MONTH FROM order_date)) counts unique months per customer
-- HAVING = 12 means customer has at least one order in all 12 months
-- GROUP BY both cust_id and full_name (full_name is non-aggregated in SELECT)


-- ---------------------------------------------------------------

-- Q10. Product with highest average order quantity
--      Must have been ordered at least 10 times

SELECT prod_id,
       AVG(quantity) AS avg_qty
FROM sales.order_items
GROUP BY prod_id
HAVING COUNT(order_id) >= 10
ORDER BY avg_qty DESC
LIMIT 1;

-- NOTE:
-- AVG(quantity) → average quantity per order for each product
-- HAVING COUNT(order_id) >= 10 → exclude rarely ordered products
-- ORDER BY avg_qty DESC LIMIT 1 → pick the single highest
-- order_items used (not orders) since quantity lives there


-- ============================================================
-- TOPIC 2 COMPLETE
-- Key concepts covered:
-- ✅ SUM, AVG, COUNT, MIN, MAX aggregate functions
-- ✅ GROUP BY single and multiple columns
-- ✅ HAVING vs WHERE — group level vs row level filtering
-- ✅ TO_CHAR for month/day name formatting
-- ✅ EXTRACT for year/month/day number extraction
-- ✅ Subquery inside HAVING and SELECT for single value comparison
-- ✅ Multi-table joins (3 tables) for cross-schema aggregation
-- ✅ Two CTEs + LAG for month-over-month comparison
-- ✅ COUNT(DISTINCT ...) for unique value counting
-- ✅ Percentage contribution using subquery total
-- ✅ SQL execution order: FROM→WHERE→GROUP BY→HAVING→SELECT→ORDER BY→LIMIT
-- ============================================================