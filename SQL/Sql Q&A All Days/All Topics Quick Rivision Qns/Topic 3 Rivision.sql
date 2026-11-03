-- ============================================================
-- SQL PRACTICE — TOPIC 3: JOINS
-- Dataset: RetailMart (PostgreSQL)
-- Concepts: INNER JOIN, LEFT JOIN, SELF JOIN, Multi-table Joins,
--            Correlated Subqueries, COALESCE, RANK with PARTITION BY
-- ============================================================


-- Q1. Find all customers who have never placed an order

SELECT c.full_name,
       a.city
FROM customers.customers c
JOIN customers.addresses a ON c.cust_id = a.cust_id
LEFT JOIN sales.orders o ON c.cust_id = o.cust_id
WHERE o.cust_id IS NULL;

-- NOTE:
-- INNER JOIN to addresses (every customer has an address — no NULLs expected)
-- LEFT JOIN to orders keeps ALL customers including those with no orders
-- WHERE o.cust_id IS NULL filters only customers with no matching order
-- Pattern: LEFT JOIN + IS NULL = "not exists in that table"


-- ---------------------------------------------------------------

-- Q2. Find products that have never been ordered

SELECT p.prod_name,
       p.category
FROM products.products p
LEFT JOIN sales.order_items i ON p.prod_id = i.prod_id
WHERE i.prod_id IS NULL;

-- NOTE:
-- Same LEFT JOIN + IS NULL pattern as Q1
-- order_items is the bridge — if a product has no entry there, it was never ordered
-- Check IS NULL on the joined table's column, not the base table


-- ---------------------------------------------------------------

-- Q3. For each order, display customer name, product name, quantity, total amount
--     4-table join: customers → orders → order_items → products

SELECT c.full_name,
       p.prod_name,
       i.quantity,
       o.total_amount
FROM customers.customers c
JOIN sales.orders o ON c.cust_id = o.cust_id
JOIN sales.order_items i ON o.order_id = i.order_id
JOIN products.products p ON i.prod_id = p.prod_id;

-- NOTE:
-- Join chain: customers → orders → order_items → products
-- order_items is the bridge between orders and products
-- Each join reduces/matches rows based on the ON condition
-- INNER JOIN used throughout — only show orders that have all 4 parts


-- ---------------------------------------------------------------

-- Q4. Find customers who have ordered products from every category

SELECT c.full_name,
       COUNT(DISTINCT p.category) AS category_count
FROM customers.customers c
JOIN sales.orders o ON c.cust_id = o.cust_id
JOIN sales.order_items i ON o.order_id = i.order_id
JOIN products.products p ON i.prod_id = p.prod_id
GROUP BY c.cust_id, c.full_name
HAVING COUNT(DISTINCT p.category) = (SELECT COUNT(DISTINCT category) FROM products.products);

-- NOTE:
-- Same logic as "ordered in every month" from Topic 2
-- COUNT(DISTINCT p.category) per customer must equal total categories in system
-- Subquery gets dynamic category count — never hardcode the number
-- GROUP BY both cust_id and full_name (full_name is non-aggregated in SELECT)


-- ---------------------------------------------------------------

-- Q5. Find pairs of customers who live in the same city (Self Join)

SELECT cu1.full_name AS customer1,
       cu2.full_name AS customer2,
       c.city
FROM customers.addresses c
JOIN customers.addresses c1 ON c.city = c1.city
JOIN customers.customers cu1 ON c.cust_id = cu1.cust_id
JOIN customers.customers cu2 ON c1.cust_id = cu2.cust_id
WHERE c.cust_id < c1.cust_id;

-- NOTE:
-- Self join = joining a table to itself using two different aliases
-- SELF JOIN is not a keyword — implemented as regular JOIN with two aliases
-- JOIN condition: c.city = c1.city (same city)
-- WHERE c.cust_id < c1.cust_id avoids:
--   1. Self-pairs (customer paired with themselves)
--   2. Duplicate pairs (A,B and B,A showing twice)
-- Use < not <> — <> avoids self-pairs but still shows both A,B and B,A


-- ---------------------------------------------------------------

-- Q6. All products with total quantity sold — show 0 for never sold products

SELECT p.prod_id,
       COALESCE(SUM(i.quantity), 0) AS total_qty
FROM products.products p
LEFT JOIN sales.order_items i ON p.prod_id = i.prod_id
GROUP BY p.prod_id;

-- NOTE:
-- LEFT JOIN keeps all products including unsold ones
-- SUM(i.quantity) returns NULL for unsold products (no matching rows)
-- COALESCE(value, 0) replaces NULL with 0
-- COALESCE takes 2+ arguments: first non-null value wins
-- Without COALESCE, unsold products would show NULL instead of 0


-- ---------------------------------------------------------------

-- Q7. Customers whose total spending is higher than average spending in their city
--     (Correlated subquery)

SELECT c.cust_id,
       c.full_name,
       SUM(o.total_amount) AS ttl_spending
FROM customers.customers c
JOIN sales.orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.full_name
HAVING SUM(o.total_amount) > (
    SELECT AVG(o2.total_amount)
    FROM sales.orders o2
    JOIN customers.customers c2 ON o2.cust_id = c2.cust_id
    WHERE c2.city = c.city
);

-- NOTE:
-- Correlated subquery: inner query references c.city from outer query
-- Recalculates average for each customer's city separately
-- Compare against city average, not overall average
-- Without correlation (WHERE c2.city = c.city), it would compare against overall average


-- ---------------------------------------------------------------

-- Q8. Orders where customer is from "Mumbai" and ordered "Electronics"

SELECT c.cust_id,
       c.full_name,
       c.city,
       p.category
FROM customers.customers c
JOIN sales.orders o ON c.cust_id = o.cust_id
JOIN sales.order_items i ON o.order_id = i.order_id
JOIN products.products p ON i.prod_id = p.prod_id
WHERE c.city ILIKE 'mumbai' AND p.category ILIKE 'electronics';

-- NOTE:
-- ILIKE used instead of = for case-insensitive matching
-- Real-world data often has inconsistent casing — ILIKE is safer
-- 4-table join needed to connect city (customers) with category (products)


-- ---------------------------------------------------------------

-- Q9. Top spending customer per city (CTE + RANK)

WITH cte AS (
    SELECT c.cust_id,
           c.full_name,
           c.city,
           SUM(o.total_amount) AS ttl_spend,
           RANK() OVER (PARTITION BY c.city ORDER BY SUM(o.total_amount) DESC) AS rnk
    FROM customers.customers c
    JOIN sales.orders o ON c.cust_id = o.cust_id
    GROUP BY c.cust_id, c.full_name, c.city
)
SELECT cust_id,
       full_name,
       city,
       ttl_spend,
       rnk
FROM cte
WHERE rnk = 1;

-- NOTE:
-- PARTITION BY c.city → rank resets for each city
-- PARTITION BY c.cust_id → wrong, gives every customer rank 1
-- ORDER BY SUM(o.total_amount) DESC → highest spender gets rank 1
-- Window functions can't be used in WHERE → CTE wraps it first
-- RANK() allows ties — if two customers spend equally they both get rank 1
-- Use ROW_NUMBER() if you want exactly one per city even with ties


-- ---------------------------------------------------------------

-- Q10. Products ordered by more than 50% of all customers

SELECT p.prod_id,
       p.prod_name
FROM products.products p
JOIN sales.order_items i ON p.prod_id = i.prod_id
JOIN sales.orders o ON i.order_id = o.order_id
GROUP BY p.prod_id, p.prod_name
HAVING COUNT(DISTINCT o.cust_id) > (SELECT COUNT(DISTINCT cust_id) FROM customers.customers) * 0.5;

-- NOTE:
-- cust_id lives in orders, not order_items or products
-- Join chain: products → order_items → orders to reach cust_id
-- COUNT(DISTINCT o.cust_id) counts unique customers per product
-- Subquery gets total customer count dynamically
-- * 0.5 = 50% threshold (use 0.5 not 50 — it's a ratio not percentage)
-- joining customers table not needed since cust_id already in orders


-- ============================================================
-- TOPIC 3 COMPLETE
-- Key concepts covered:
-- ✅ INNER JOIN — only matching rows from both tables
-- ✅ LEFT JOIN — all rows from left, NULL for no match on right
-- ✅ LEFT JOIN + IS NULL — find rows that don't exist in another table
-- ✅ SELF JOIN — join table to itself with two aliases
-- ✅ Multi-table joins (4 tables) — customers→orders→order_items→products
-- ✅ COALESCE — replace NULL with default value
-- ✅ Correlated subquery in HAVING — references outer query column
-- ✅ ILIKE for case-insensitive string matching
-- ✅ RANK() with PARTITION BY for per-group ranking
-- ✅ COUNT(DISTINCT ...) for unique value counting across joins
-- ✅ 50% threshold using subquery * 0.5
-- ============================================================