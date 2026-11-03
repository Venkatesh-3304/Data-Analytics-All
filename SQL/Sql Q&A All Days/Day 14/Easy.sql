







-- ============================================
-- DAY 14: LAG() / LEAD() Questions Only
-- ============================================
-- Total: 31 Questions (17 Conceptual + 14 Practical)
-- Database: RetailMart (PostgreSQL 16)
-- ============================================

-- =====================
-- CONCEPTUAL QUESTIONS
-- =====================

-- Q1.  RetailMart's analytics intern is confused about LAG() function. They want to understand what value LAG() returns when there is no previous row available in the partition.

-- Q2.  RetailMart's data analyst asks: "If I use LEAD(rating, 2) on product reviews ordered by date, what exactly am I trying to access?"

-- Q3.  RetailMart's reporting intern wants to understand: When using LAG() with a default value like LAG(amount, 1, 0), when exactly is the default value used?

-- Q4.  RetailMart's junior analyst is puzzled: "Can I use LAG() and LEAD() in the same query on the same column but with different purposes?"

-- Q5.  RetailMart's reporting team wants to know: When comparing today's orders with yesterday's using LAG(), what column should typically go in the ORDER BY clause?

-- Q6.  RetailMart's business analyst asks: "If I want to see the difference between current row value and the next row value, which function should I use - LAG() or LEAD()?"

-- Q7.  RetailMart's analytics intern asks: "What's the result of LEAD(amount, 1) for the very last row in a partition?"

-- Q8.  RetailMart's finance analyst asks: "When calculating week-over-week growth, should I use LAG() with offset 7 or group by week first?"

-- Q9.  RetailMart's reporting intern is curious: "Can I use expressions inside LAG() like LAG(quantity * unit_price)?"

-- Q10. RetailMart's BI team asks: "Can I reference the result of a LAG() function in the WHERE clause of the same query?"

-- Q11. RetailMart's data intern questions: "Can I use LEAD() with a negative offset to look at previous rows instead of next rows?"

-- Q12. RetailMart's analytics team wonders: "What happens to the window frame calculation if there are NULL values in the ORDER BY column?"

-- Q13. RetailMart's reporting analyst asks: "Is there a maximum limit to the offset value I can use in LAG() or LEAD()?"

-- Q14. RetailMart's business team wants to know: "When calculating month-over-month comparison, should the LAG() offset be 1 if data is aggregated monthly?"

-- Q15. RetailMart's reporting team questions: "If my data has gaps in dates, how does LAG() with offset 1 behave - does it get the previous row or the previous date?"

-- Q16. RetailMart's data team asks: "Can I use aggregate functions inside LAG() or LEAD(), like LAG(SUM(amount))?"

-- Q17. RetailMart's analytics intern asks: "If I want to calculate percentage change from previous row, which functions do I need to combine?"


-- =====================
-- PRACTICAL QUESTIONS
-- =====================

-- Q18. RetailMart's sales team wants to see each order along with the previous order's amount for the same customer, to track spending patterns.

-- Q19. RetailMart's analytics team needs to display each product's daily rating alongside the next day's rating to spot trends.

-- Q20. RetailMart's risk team needs to display each transaction amount with the previous transaction amount to detect unusual spikes.

-- Q21. RetailMart's revenue team wants to see each order's total amount along with the order amount from 7 orders ago for comparison.

-- Q22. RetailMart's customer success team needs to show each review's rating along with the customer's previous review rating.

-- Q23. RetailMart's logistics team needs to calculate the difference in days between current shipment date and previous shipment date for each store.

-- Q24. RetailMart's HR team wants to show each employee's salary along with the next employee's salary ordered by emp_id.

-- Q25. RetailMart's supply chain team needs the difference between current stock quantity and previous stock quantity for each product across stores.

-- Q26. RetailMart's finance team wants to show each payment's amount alongside what the next payment amount was globally.

-- Q27. RetailMart's data team needs to display each day's total order amount alongside the previous day's total order amount.

-- Q28. RetailMart's operations team needs to calculate the gap in days between current and previous order for each store.

-- Q29. RetailMart's analytics team wants to show each shipment's shipped_date alongside the previous shipment's shipped_date for the same courier.

-- Q30. RetailMart's delivery team needs the difference in days between current and next shipped_date for each store.

-- Q31. RetailMart's sales team needs to show each order's total_amount alongside the average total_amount of the previous 3 orders for the same customer.


-- ============================================
-- END OF LAG() / LEAD() QUESTIONS
-- ============================================
-- Conceptual : Q1  - Q17 (17 Questions)
-- Practical  : Q18 - Q31 (14 Questions)
-- Total      : 31 Questions
-- ============================================


-- =====================
-- ANSWERS
-- =====================

-- Q18. RetailMart's sales team wants to see each order along with the previous 
-- order's amount for the same customer, to track spending patterns.
-- Table: sales.orders | Columns: order_id, cust_id, total_amount, order_date

SELECT order_id,
       cust_id,
       total_amount,
       LAG(total_amount, 1, 0) OVER (
           PARTITION BY cust_id
           ORDER BY order_date
       ) AS prev_order_amount
FROM sales.orders;


-- Q19. RetailMart's analytics team needs to display each product's daily rating 
-- alongside the next day's rating to spot trends.
-- Table: customers.reviews | Columns: prod_id, review_date, rating

SELECT prod_id,
       review_date,
       rating,
       LEAD(rating, 1, NULL) OVER (
           PARTITION BY prod_id
           ORDER BY review_date
       ) AS next_day_rating
FROM customers.reviews;


-- Q20. RetailMart's risk team needs to display each transaction amount with the 
-- previous transaction amount to detect unusual spikes.
-- Table: sales.payments | Columns: payment_id, amount, payment_date

SELECT payment_id,
       amount,
       LAG(amount, 1, 0) OVER (
           ORDER BY payment_date
       ) AS prev_transaction_amount
FROM sales.payments;


-- Q21. RetailMart's revenue team wants to see each order's total amount along with 
-- the order amount from 7 orders ago for comparison.
-- Table: sales.orders | Columns: order_id, total_amount, order_date

SELECT order_id,
       total_amount,
       order_date,
       LAG(total_amount, 7, 0) OVER (
           ORDER BY order_date
       ) AS sales_comparison_by_week
FROM sales.orders;


-- Q22. RetailMart's customer success team needs to show each review's rating along 
-- with the customer's previous review rating.
-- Table: customers.reviews | Columns: cust_id, review_id, rating, review_date

SELECT cust_id,
       review_id,
       review_date,
       rating,
       LAG(rating, 1, NULL) OVER (
           PARTITION BY cust_id
           ORDER BY review_date
       ) AS prev_review_rating
FROM customers.reviews;


-- Q23. RetailMart's logistics team needs to calculate the difference in days 
-- between current shipment date and previous shipment date for each store.
-- Table: sales.shipments | Columns: shipment_id, store_id, shipped_date

SELECT shipment_id,
       store_id,
       shipped_date,
       shipped_date - LAG(shipped_date, 1, NULL) OVER (
           PARTITION BY store_id
           ORDER BY shipped_date
       ) AS days_difference
FROM sales.shipments;


-- Q24. RetailMart's HR team wants to show each employee's salary along with 
-- the next employee's salary ordered by emp_id.
-- Table: stores.employees | Columns: emp_id, emp_name, salary

SELECT emp_id,
       emp_name,
       salary,
       LEAD(salary, 1, NULL) OVER (
           ORDER BY emp_id
       ) AS next_emp_salary
FROM stores.employees;


-- Q25. RetailMart's supply chain team needs the difference between current stock 
-- quantity and previous stock quantity for each product across stores.
-- Table: products.inventory | Columns: prod_id, store_id, stock_qty, last_updated

SELECT prod_id,
       store_id,
       stock_qty,
       stock_qty - LAG(stock_qty, 1, NULL) OVER (
           PARTITION BY prod_id
           ORDER BY last_updated
       ) AS stock_diff
FROM products.inventory;


-- Q26. RetailMart's finance team wants to show each payment's amount alongside 
-- what the next payment amount was globally.
-- Table: sales.payments | Columns: payment_id, amount, payment_date

SELECT payment_id,
       amount,
       LEAD(amount, 1, NULL) OVER (
           ORDER BY payment_date
       ) AS next_payment_amount
FROM sales.payments;


-- Q27. RetailMart's data team needs to display each day's total order amount 
-- alongside the previous day's total order amount.
-- Table: sales.orders | Columns: order_date, total_amount

WITH daily_sales AS (
    SELECT order_date,
           SUM(total_amount) AS daily_total
    FROM sales.orders
    GROUP BY order_date
)
SELECT order_date,
       daily_total,
       LAG(daily_total, 1, 0) OVER (
           ORDER BY order_date
       ) AS prev_day_total
FROM daily_sales;


-- Q28. RetailMart's operations team needs to calculate the gap in days 
-- between current and previous order for each store.
-- Table: sales.orders | Columns: order_id, store_id, order_date

SELECT order_id,
       store_id,
       order_date,
       order_date - LAG(order_date, 1, NULL) OVER (
           PARTITION BY store_id
           ORDER BY order_date
       ) AS days_since_prev_order
FROM sales.orders;


-- Q29. RetailMart's analytics team wants to show each shipment's shipped_date 
-- alongside the previous shipment's shipped_date for the same courier.
-- Table: sales.shipments | Columns: shipment_id, courier_name, shipped_date

SELECT shipment_id,
       courier_name,
       shipped_date,
       LAG(shipped_date, 1, NULL) OVER (
           PARTITION BY courier_name
           ORDER BY shipped_date
       ) AS prev_shipment_date
FROM sales.shipments;


-- Q30. RetailMart's delivery team needs the difference in days between 
-- current and next shipped_date for each store.
-- Table: sales.shipments | Columns: shipment_id, store_id, shipped_date

SELECT shipment_id,
       store_id,
       shipped_date,
       LEAD(shipped_date, 1, NULL) OVER (
           PARTITION BY store_id
           ORDER BY shipped_date
       ) - shipped_date AS days_to_next_shipment
FROM sales.shipments;


-- Q31. RetailMart's sales team needs to show each order's total_amount alongside 
-- the average total_amount of the previous 3 orders for the same customer.
-- Table: sales.orders | Columns: order_id, cust_id, total_amount, order_date

SELECT cust_id,
       order_id,
       order_date,
       total_amount,
       AVG(total_amount) OVER (
           PARTITION BY cust_id
           ORDER BY order_date
           ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING
       ) AS prev_3_avg
FROM sales.orders;


-- ============================================
-- END OF LAG() / LEAD() ANSWERS
-- ============================================
-- Answered : Q18 - Q31 (14 Practical Questions)
-- ============================================



-- ============================================
-- DAY 14: Remaining Questions (Excluding LAG/LEAD)
-- ============================================
-- Total: 69 Questions (33 Conceptual + 36 Practical)
-- Concepts: FIRST_VALUE(), LAST_VALUE(), NTH_VALUE(),
--           SUM() OVER, AVG() OVER, ROWS/RANGE BETWEEN,
--           NTILE(), PERCENT_RANK(), CUME_DIST()
-- Database: RetailMart (PostgreSQL 16)
-- ============================================

-- =====================
-- CONCEPTUAL QUESTIONS
-- =====================

-- Q1.  RetailMart's reporting team wants to understand the difference between ROWS BETWEEN and RANGE BETWEEN in window frames. When would the results differ?

-- Q2.  RetailMart's finance analyst is calculating running totals using SUM() OVER. They notice ORDER BY is mandatory inside OVER clause for this. Why is that?

-- Q3.  RetailMart's business intelligence team is debating: "What's the default window frame when we specify ORDER BY inside OVER clause but don't explicitly define ROWS BETWEEN?"

-- Q4.  RetailMart's data team wants to know: If NTILE(4) is applied to 10 rows, how will the rows be distributed across the 4 buckets?

-- Q5.  RetailMart's analytics intern asks their mentor: "What's the difference between PERCENT_RANK() and CUME_DIST() when calculating percentiles?"

-- Q6.  RetailMart's analytics team is confused about FIRST_VALUE() behavior. Does it respect the window frame or always return the first value of the entire partition?

-- Q7.  RetailMart's sales analyst asks: "If I use LAST_VALUE() without specifying a frame clause, why might I get unexpected results?"

-- Q8.  RetailMart's data scientist is calculating moving averages. They want to know: What does AVG() OVER (ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) calculate?

-- Q9.  RetailMart's team lead explains window frames. What does ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW mean in simple terms?

-- Q10. RetailMart's inventory analyst wants to understand: What happens if I use NTH_VALUE(column, 3) but my partition has only 2 rows?

-- Q11. RetailMart's BI team asks: "What's the practical difference between using ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING versus a 3-row moving average?"

-- Q12. RetailMart's data intern is learning about CUME_DIST(). If a value has CUME_DIST() = 0.75, what does this tell us about the value's position?

-- Q13. RetailMart's reporting analyst queries: "Can I combine PARTITION BY and ORDER BY when using running totals with SUM() OVER?"

-- Q14. RetailMart's revenue team is calculating cumulative sales. What's the purpose of UNBOUNDED PRECEDING in the window frame?

-- Q15. RetailMart's operations analyst wonders: "Can NTILE() create unequal bucket sizes? If yes, which buckets get the extra rows?"

-- Q16. RetailMart's analytics team debates: "Does PERCENT_RANK() ever return exactly 1.0? If yes, for which row?"

-- Q17. RetailMart's data scientist explains: "What does ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING calculate when used with SUM()?"

-- Q18. RetailMart's BI team wants clarity: "If I use FIRST_VALUE() with PARTITION BY category ORDER BY price, what value do I get for each row?"

-- Q19. RetailMart's data team questions: "What's the difference between AVG(amount) and AVG(amount) OVER() without any partition or order?"

-- Q20. RetailMart's analytics analyst wants to know: "If RANGE BETWEEN is used with ORDER BY on a column with duplicate values, how does it behave differently from ROWS BETWEEN?"

-- Q21. RetailMart's junior analyst wonders: "What is the starting value of PERCENT_RANK() - is it 0 or some other value?"

-- Q22. RetailMart's team lead explains: "When might you prefer LAST_VALUE() over simply ordering descending and taking the first row?"

-- Q23. RetailMart's finance analyst asks: "If I partition sales data by region and calculate running totals, does the running total reset for each region?"

-- Q24. RetailMart's BI intern wants clarity: "When using NTH_VALUE(column, 1), is it equivalent to FIRST_VALUE(column)?"

-- Q25. RetailMart's data team questions: "Can I use multiple window functions with different PARTITION BY clauses in the same SELECT?"

-- Q26. RetailMart's reporting analyst asks: "What's the difference between ROWS 3 PRECEDING and ROWS BETWEEN 3 PRECEDING AND CURRENT ROW?"

-- Q27. RetailMart's operations analyst is curious: "Does CUME_DIST() include the current row in its calculation or only rows before it?"

-- Q28. RetailMart's BI team asks: "If I use NTILE(10) to create deciles, what does being in NTILE = 1 mean about that row's value?"

-- Q29. RetailMart's analytics intern wonders: "Can I specify a window frame for RANK() or ROW_NUMBER() functions?"

-- Q30. RetailMart's data scientist asks: "What's the relationship between PERCENT_RANK() and the formula (rank - 1) / (total rows - 1)?"

-- Q31. RetailMart's sales analyst wants clarity: "When using LAST_VALUE() with ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING, do I get the actual last value of the partition?"

-- Q32. RetailMart's BI analyst wonders: "What value does PERCENT_RANK() return for a single-row partition?"

-- Q33. RetailMart's data lead explains: "What's the purpose of the IGNORE NULLS option in FIRST_VALUE() and LAST_VALUE()?"


-- =====================
-- PRACTICAL QUESTIONS
-- =====================

-- Q34. RetailMart's operations manager wants a running total of daily expenses for each store throughout 2024.

-- Q35. RetailMart's finance team needs to calculate the cumulative sum of payments received, ordered by payment date.

-- Q36. RetailMart's marketing team wants to see each customer's purchase amount along with their first-ever purchase amount for comparison.

-- Q37. RetailMart's HR team wants to divide all delivery staff into 4 performance quartiles based on their total deliveries completed.

-- Q38. RetailMart's operations team needs a 3-day moving average of order counts for each store.

-- Q39. RetailMart's HR team wants to show each employee's salary alongside the department's highest salary using FIRST_VALUE().

-- Q40. RetailMart's analytics team needs to calculate the percentage rank of each store based on their total transaction volume.

-- Q41. RetailMart's inventory team wants running totals of stock quantities replenished for each product throughout the year.

-- Q42. RetailMart's finance team wants cumulative revenue by month for the entire company.

-- Q43. RetailMart's product team wants to divide all products into 10 price deciles within each category.

-- Q44. RetailMart's business team needs a 7-day moving average of daily transaction amounts.

-- Q45. RetailMart's finance team needs cumulative sum of discount amounts given by month.

-- Q46. RetailMart's operations team wants to display each store's order count alongside the store's last recorded order count using LAST_VALUE().

-- Q47. RetailMart's sales team needs to show each transaction's amount as a percentile rank within its store.

-- Q48. RetailMart's reporting team wants to see each customer's latest transaction amount alongside their first transaction amount using FIRST_VALUE().

-- Q49. RetailMart's marketing team needs to divide customers into 5 spending tiers based on their total order value.

-- Q50. RetailMart's marketing team wants a running sum of ad spend for each marketing campaign.

-- Q51. RetailMart's customer team wants cumulative count of reviews posted by each customer over time.

-- Q52. RetailMart's analytics team needs to show each product's price along with the category's minimum price using FIRST_VALUE().

-- Q53. RetailMart's operations team wants to identify the relative position (percent rank) of each store's daily sales.

-- Q54. RetailMart's analytics team needs a 5-order moving average of order amounts for each customer.

-- Q55. RetailMart's revenue team needs to calculate cumulative percentage of total annual revenue by month.

-- Q56. RetailMart's operations team wants to divide stores into 3 tiers based on monthly revenue using NTILE.

-- Q57. RetailMart's warehouse team wants a running count of returns processed for each product category.

-- Q58. RetailMart's category team needs to show each product's sales alongside the category's highest sales using FIRST_VALUE().

-- Q59. RetailMart's HR team wants cumulative count of employees joined per department over time.

-- Q60. RetailMart's loyalty team wants to divide loyalty point holders into quartiles for targeted campaigns.

-- Q61. RetailMart's compliance team needs a 30-day rolling sum of transaction amounts per store.

-- Q62. RetailMart's finance team needs cumulative sum of order amounts by salesperson, ordered by order date.

-- Q63. RetailMart's customer team wants to calculate the percent rank of each customer based on total orders placed.

-- Q64. RetailMart's category team needs to show each product's sales alongside the category's last product's sales using LAST_VALUE().

-- Q65. RetailMart's marketing team wants to display campaign performance with running ROI calculations.

-- Q66. RetailMart's operations team wants to divide orders into 100 percentile buckets for detailed analysis using NTILE.

-- Q67. RetailMart's finance team needs cumulative expenses by expense category for budget tracking.

-- Q68. RetailMart's returns team wants a running count of returns by return reason code.

-- Q69. RetailMart's analytics team wants cumulative distribution (CUME_DIST) of stores by total transaction count.


-- ============================================
-- END OF REMAINING QUESTIONS
-- ============================================
-- Conceptual : Q1  - Q33  (33 Questions)
-- Practical  : Q34 - Q69  (36 Questions)
-- Total      : 69 Questions
-- ============================================



SELECT store_id,
		expense_date,
		amount,
		sum(amount) over (
			partition by store_id
			ORDER by expense_date asc
			rows between unbounded preceding and current row 
		) as running_total
from stores.expenses


select * from stores.expenses


-- ============================================
-- DAY 14: Window Functions Practice Solutions
-- Database: RetailMart (PostgreSQL 16)
-- ============================================
-- Solved: 13 Questions
-- ============================================


-- =====================
-- SUM() OVER — Running Totals
-- =====================

-- Q34. Running total of daily expenses per store
SELECT store_id,
       expense_date,
       amount,
       SUM(amount) OVER (
           PARTITION BY store_id
           ORDER BY expense_date ASC
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_total
FROM stores.expenses;


-- Q35. Cumulative sum of payments globally
SELECT payment_id,
       payment_date,
       amount,
       SUM(amount) OVER (
           ORDER BY payment_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_pmt
FROM sales.payments;


-- Q41. Running total of stock quantities per product
SELECT prod_id,
       last_updated,
       stock_qty,
       SUM(stock_qty) OVER (
           PARTITION BY prod_id
           ORDER BY last_updated
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_qty
FROM products.inventory;


-- Q42. Cumulative revenue by month
WITH monthly_revenue AS (
    SELECT DATE_TRUNC('month', order_date) AS order_month,
           SUM(total_amount) AS monthly_revenue
    FROM sales.orders
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT order_month,
       monthly_revenue,
       SUM(monthly_revenue) OVER (
           ORDER BY order_month
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_revenue
FROM monthly_revenue;


-- Q45. Cumulative discounts by month (CTE + JOIN)
WITH monthly_discount AS (
    SELECT DATE_TRUNC('month', o.order_date) AS order_month,
           SUM(oi.discount) AS monthly_discount
    FROM sales.orders o
    JOIN sales.order_items oi ON o.order_id = oi.order_id
    GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT order_month,
       monthly_discount,
       SUM(monthly_discount) OVER (
           ORDER BY order_month
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_discount
FROM monthly_discount;


-- =====================
-- AVG() OVER — Moving Averages
-- =====================

-- Q38. 3-day moving average of order counts per store
WITH daily_orders AS (
    SELECT store_id,
           order_date,
           COUNT(order_id) AS daily_orders
    FROM sales.orders
    GROUP BY store_id, order_date
)
SELECT store_id,
       order_date,
       daily_orders,
       AVG(daily_orders) OVER (
           PARTITION BY store_id
           ORDER BY order_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg_3day
FROM daily_orders;


-- Q44. 7-day moving average of daily transaction amounts
WITH daily_transactions AS (
    SELECT payment_date,
           SUM(amount) AS daily_amount
    FROM sales.payments
    GROUP BY payment_date
)
SELECT payment_date,
       daily_amount,
       AVG(daily_amount) OVER (
           ORDER BY payment_date
           ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
       ) AS moving_avg_7day
FROM daily_transactions;


-- Q54. 5-order moving average per customer
SELECT cust_id,
       order_id,
       order_date,
       total_amount,
       AVG(total_amount) OVER (
           PARTITION BY cust_id
           ORDER BY order_date
           ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
       ) AS moving_avg_5order
FROM sales.orders;


-- =====================
-- FIRST_VALUE()
-- =====================

-- Q36. First purchase amount per customer
SELECT cust_id,
       order_id,
       order_date,
       total_amount,
       FIRST_VALUE(total_amount) OVER (
           PARTITION BY cust_id
           ORDER BY order_date ASC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS first_purchase_amount
FROM sales.orders;


-- Q39. Department's highest salary
SELECT emp_id,
       emp_name,
       dept_id,
       salary,
       FIRST_VALUE(salary) OVER (
           PARTITION BY dept_id
           ORDER BY salary DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS highest_salary
FROM stores.employees;


-- Q48. First transaction amount per customer (JOIN)
SELECT c.cust_id,
       p.payment_id,
       p.payment_date,
       p.amount,
       FIRST_VALUE(p.amount) OVER (
           PARTITION BY c.cust_id
           ORDER BY p.payment_date ASC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS first_transaction
FROM sales.payments p
JOIN sales.orders c ON p.order_id = c.order_id;


-- Q52. Category minimum price
SELECT prod_id,
       prod_name,
       category,
       price,
       FIRST_VALUE(price) OVER (
           PARTITION BY category
           ORDER BY price ASC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS min_category_price
FROM products.products;


-- Q58. Category highest sales (CTE + JOIN)
WITH cte AS (
    SELECT o.prod_id,
           c.category,
           SUM(quantity * unit_price) AS total_sales
    FROM sales.order_items o
    JOIN products.products c ON o.prod_id = c.prod_id
    GROUP BY o.prod_id, c.category
)
SELECT prod_id,
       category,
       total_sales,
       FIRST_VALUE(total_sales) OVER (
           PARTITION BY category
           ORDER BY total_sales DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS highest_category_sales
FROM cte;


-- ============================================
-- END OF SOLVED QUERIES
-- ============================================
-- SUM() OVER  : Q34, Q35, Q41, Q42, Q45
-- AVG() OVER  : Q38, Q44, Q54
-- FIRST_VALUE : Q36, Q39, Q48, Q52, Q58
-- Total       : 13 Queries
-- ============================================


-- ============================================
-- DAY 14: Window Functions Practice Solutions
-- Database: RetailMart (PostgreSQL 16)
-- ============================================
-- Total: 25 Questions Solved
-- ============================================
-- Concepts Covered:
--   SUM() OVER     : Q34, Q35, Q41, Q42, Q45
--   AVG() OVER     : Q38, Q44, Q54
--   FIRST_VALUE()  : Q36, Q39, Q48, Q52, Q58
--   LAST_VALUE()   : Q46, Q64
--   NTILE()        : Q43, Q49, Q56, Q60, Q66
--   PERCENT_RANK() : Q40, Q53
--   CUME_DIST()    : Q69
--   COUNT() OVER   : Q51
-- ============================================


-- =====================
-- SUM() OVER — Running Totals
-- =====================

-- Q34. RetailMart's operations manager wants a running total of daily expenses
-- for each store throughout 2024.
-- Table: stores.expenses | Columns: expense_id, store_id, expense_date, amount

SELECT store_id,
       expense_date,
       amount,
       SUM(amount) OVER (
           PARTITION BY store_id
           ORDER BY expense_date ASC
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_total
FROM stores.expenses;


-- Q35. RetailMart's finance team needs to calculate the cumulative sum of
-- payments received, ordered by payment date.
-- Table: sales.payments | Columns: payment_id, order_id, payment_date, amount

SELECT payment_id,
       payment_date,
       amount,
       SUM(amount) OVER (
           ORDER BY payment_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_pmt
FROM sales.payments;


-- Q41. RetailMart's inventory team wants running totals of stock quantities
-- replenished for each product throughout the year.
-- Table: products.inventory | Columns: inventory_id, prod_id, store_id, stock_qty, last_updated

SELECT prod_id,
       last_updated,
       stock_qty,
       SUM(stock_qty) OVER (
           PARTITION BY prod_id
           ORDER BY last_updated
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_qty
FROM products.inventory;


-- Q42. RetailMart's finance team wants cumulative revenue by month
-- for the entire company.
-- Table: sales.orders | Columns: order_id, store_id, order_date, total_amount

WITH monthly_revenue AS (
    SELECT DATE_TRUNC('month', order_date) AS order_month,
           SUM(total_amount) AS monthly_revenue
    FROM sales.orders
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT order_month,
       monthly_revenue,
       SUM(monthly_revenue) OVER (
           ORDER BY order_month
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_revenue
FROM monthly_revenue;


-- Q45. RetailMart's finance team needs cumulative sum of discount amounts
-- given by month.
-- Tables: sales.orders, sales.order_items
-- Columns: order_date, discount

WITH monthly_discount AS (
    SELECT DATE_TRUNC('month', o.order_date) AS order_month,
           SUM(oi.discount) AS monthly_discount
    FROM sales.orders o
    JOIN sales.order_items oi ON o.order_id = oi.order_id
    GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT order_month,
       monthly_discount,
       SUM(monthly_discount) OVER (
           ORDER BY order_month
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_discount
FROM monthly_discount;


-- =====================
-- AVG() OVER — Moving Averages
-- =====================

-- Q38. RetailMart's operations team needs a 3-day moving average of order
-- counts for each store.
-- Table: sales.orders | Columns: order_id, store_id, order_date

WITH daily_orders AS (
    SELECT store_id,
           order_date,
           COUNT(order_id) AS daily_orders
    FROM sales.orders
    GROUP BY store_id, order_date
)
SELECT store_id,
       order_date,
       daily_orders,
       AVG(daily_orders) OVER (
           PARTITION BY store_id
           ORDER BY order_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg_3day
FROM daily_orders;


-- Q44. RetailMart's business team needs a 7-day moving average of daily
-- transaction amounts.
-- Table: sales.payments | Columns: payment_id, payment_date, amount

WITH daily_transactions AS (
    SELECT payment_date,
           SUM(amount) AS daily_amount
    FROM sales.payments
    GROUP BY payment_date
)
SELECT payment_date,
       daily_amount,
       AVG(daily_amount) OVER (
           ORDER BY payment_date
           ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
       ) AS moving_avg_7day
FROM daily_transactions;


-- Q54. RetailMart's analytics team needs a 5-order moving average of order
-- amounts for each customer.
-- Table: sales.orders | Columns: order_id, cust_id, order_date, total_amount

SELECT cust_id,
       order_id,
       order_date,
       total_amount,
       AVG(total_amount) OVER (
           PARTITION BY cust_id
           ORDER BY order_date
           ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
       ) AS moving_avg_5order
FROM sales.orders;


-- =====================
-- FIRST_VALUE()
-- =====================

-- Q36. RetailMart's marketing team wants to see each customer's purchase amount
-- along with their first-ever purchase amount for comparison.
-- Table: sales.orders | Columns: order_id, cust_id, order_date, total_amount

SELECT cust_id,
       order_id,
       order_date,
       total_amount,
       FIRST_VALUE(total_amount) OVER (
           PARTITION BY cust_id
           ORDER BY order_date ASC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS first_purchase_amount
FROM sales.orders;


-- Q39. RetailMart's HR team wants to show each employee's salary alongside
-- the department's highest salary using FIRST_VALUE().
-- Table: stores.employees | Columns: emp_id, emp_name, dept_id, salary, hire_date

SELECT emp_id,
       emp_name,
       dept_id,
       salary,
       FIRST_VALUE(salary) OVER (
           PARTITION BY dept_id
           ORDER BY salary DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS highest_salary
FROM stores.employees;


-- Q48. RetailMart's reporting team wants to see each customer's latest
-- transaction amount alongside their first transaction amount using FIRST_VALUE().
-- Tables: sales.payments, sales.orders
-- Columns: payment_id, cust_id, payment_date, amount

SELECT c.cust_id,
       p.payment_id,
       p.payment_date,
       p.amount,
       FIRST_VALUE(p.amount) OVER (
           PARTITION BY c.cust_id
           ORDER BY p.payment_date ASC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS first_transaction
FROM sales.payments p
JOIN sales.orders c ON p.order_id = c.order_id;


-- Q52. RetailMart's analytics team needs to show each product's price along
-- with the category's minimum price using FIRST_VALUE().
-- Table: products.products | Columns: prod_id, prod_name, category, price

SELECT prod_id,
       prod_name,
       category,
       price,
       FIRST_VALUE(price) OVER (
           PARTITION BY category
           ORDER BY price ASC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS min_category_price
FROM products.products;


-- Q58. RetailMart's category team needs to show each product's sales alongside
-- the category's highest sales using FIRST_VALUE().
-- Tables: sales.order_items, products.products
-- Columns: prod_id, category, quantity, unit_price

WITH cte AS (
    SELECT o.prod_id,
           c.category,
           SUM(o.quantity * o.unit_price) AS total_sales
    FROM sales.order_items o
    JOIN products.products c ON o.prod_id = c.prod_id
    GROUP BY o.prod_id, c.category
)
SELECT prod_id,
       category,
       total_sales,
       FIRST_VALUE(total_sales) OVER (
           PARTITION BY category
           ORDER BY total_sales DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS highest_category_sales
FROM cte;


-- =====================
-- LAST_VALUE()
-- =====================

-- Q46. RetailMart's operations team wants to display each store's order count
-- alongside the store's last recorded order count using LAST_VALUE().
-- Table: sales.orders | Columns: order_id, store_id, order_date

WITH cte AS (
    SELECT store_id,
           order_date,
           COUNT(order_id) AS daily_orders
    FROM sales.orders
    GROUP BY store_id, order_date
)
SELECT store_id,
       order_date,
       daily_orders,
       LAST_VALUE(daily_orders) OVER (
           PARTITION BY store_id
           ORDER BY order_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS last_order_count
FROM cte;


-- Q64. RetailMart's category team needs to show each product's sales alongside
-- the category's last product's sales using LAST_VALUE().
-- Tables: sales.order_items, products.products
-- Columns: prod_id, category, quantity, unit_price

WITH cte AS (
    SELECT o.prod_id,
           p.category,
           SUM(o.quantity * o.unit_price) AS total_sales
    FROM sales.order_items o
    JOIN products.products p ON o.prod_id = p.prod_id
    GROUP BY o.prod_id, p.category
)
SELECT prod_id,
       category,
       total_sales,
       LAST_VALUE(total_sales) OVER (
           PARTITION BY category
           ORDER BY total_sales ASC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS last_category_sales
FROM cte;


-- =====================
-- NTILE()
-- =====================

-- Q43. RetailMart's product team wants to divide all products into 10 price
-- deciles within each category.
-- Table: products.products | Columns: prod_id, prod_name, category, price

SELECT prod_id,
       prod_name,
       category,
       price,
       NTILE(10) OVER (
           PARTITION BY category
           ORDER BY price
       ) AS price_decile
FROM products.products;


-- Q49. RetailMart's marketing team needs to divide customers into 5 spending
-- tiers based on their total order value.
-- Table: sales.orders | Columns: order_id, cust_id, total_amount

WITH cte AS (
    SELECT cust_id,
           SUM(total_amount) AS total_spent
    FROM sales.orders
    GROUP BY cust_id
)
SELECT cust_id,
       total_spent,
       NTILE(5) OVER (
           ORDER BY total_spent
       ) AS spending_tier
FROM cte;


-- Q56. RetailMart's operations team wants to divide stores into 3 tiers
-- based on monthly revenue using NTILE.
-- Table: sales.orders | Columns: order_id, store_id, order_date, total_amount

WITH cte AS (
    SELECT store_id,
           DATE_TRUNC('month', order_date) AS order_month,
           SUM(total_amount) AS monthly_revenue
    FROM sales.orders
    GROUP BY store_id, DATE_TRUNC('month', order_date)
)
SELECT store_id,
       order_month,
       monthly_revenue,
       NTILE(3) OVER (
           ORDER BY monthly_revenue
       ) AS store_tier
FROM cte;


-- Q60. RetailMart's loyalty team wants to divide loyalty point holders into
-- quartiles for targeted campaigns.
-- Tables: customers.customers, customers.loyalty_points
-- Columns: cust_id, full_name, total_points

SELECT c.cust_id,
       c.full_name,
       p.total_points,
       NTILE(4) OVER (
           ORDER BY p.total_points
       ) AS loyalty_quartile
FROM customers.customers c
JOIN customers.loyalty_points p ON c.cust_id = p.cust_id;


-- Q66. RetailMart's operations team wants to divide orders into 100 percentile
-- buckets for detailed analysis using NTILE.
-- Table: sales.orders | Columns: order_id, cust_id, total_amount

SELECT order_id,
       cust_id,
       total_amount,
       NTILE(100) OVER (
           ORDER BY total_amount
       ) AS order_percentile
FROM sales.orders;


-- =====================
-- PERCENT_RANK()
-- =====================

-- Q40. RetailMart's analytics team needs to calculate the percentage rank of
-- each store based on their total transaction volume.
-- Table: sales.orders | Columns: order_id, store_id, total_amount

WITH cte AS (
    SELECT store_id,
           SUM(total_amount) AS total_volume
    FROM sales.orders
    GROUP BY store_id
)
SELECT store_id,
       total_volume,
       PERCENT_RANK() OVER (
           ORDER BY total_volume
       ) AS store_percent_rank
FROM cte;


-- Q53. RetailMart's operations team wants to identify the relative position
-- (percent rank) of each store's daily sales.
-- Table: sales.orders | Columns: order_id, store_id, order_date, total_amount

WITH cte AS (
    SELECT store_id,
           order_date,
           SUM(total_amount) AS daily_sales
    FROM sales.orders
    GROUP BY store_id, order_date
)
SELECT store_id,
       order_date,
       daily_sales,
       PERCENT_RANK() OVER (
           PARTITION BY store_id
           ORDER BY daily_sales
       ) AS store_daily_sales_percent_rnk
FROM cte;


-- =====================
-- CUME_DIST()
-- =====================

-- Q69. RetailMart's analytics team wants cumulative distribution (CUME_DIST)
-- of stores by total transaction count.
-- Table: sales.orders | Columns: order_id, store_id

WITH cte AS (
    SELECT store_id,
           COUNT(order_id) AS total_transactions
    FROM sales.orders
    GROUP BY store_id
)
SELECT store_id,
       total_transactions,
       CUME_DIST() OVER (
           ORDER BY total_transactions
       ) AS cume_dist
FROM cte;


-- =====================
-- COUNT() OVER
-- =====================

-- Q51. RetailMart's customer team wants cumulative count of reviews posted
-- by each customer over time.
-- Table: customers.reviews | Columns: review_id, cust_id, prod_id, rating, review_date

SELECT cust_id,
       review_id,
       review_date,
       COUNT(review_id) OVER (
           PARTITION BY cust_id
           ORDER BY review_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_reviews
FROM customers.reviews;


-- ============================================
-- END OF ALL SOLVED QUERIES
-- ============================================
-- SUM() OVER     : Q34, Q35, Q41, Q42, Q45  (5 Queries)
-- AVG() OVER     : Q38, Q44, Q54            (3 Queries)
-- FIRST_VALUE()  : Q36, Q39, Q48, Q52, Q58  (5 Queries)
-- LAST_VALUE()   : Q46, Q64                 (2 Queries)
-- NTILE()        : Q43, Q49, Q56, Q60, Q66  (5 Queries)
-- PERCENT_RANK() : Q40, Q53                 (2 Queries)
-- CUME_DIST()    : Q69                      (1 Query)
-- COUNT() OVER   : Q51                      (1 Query)
-- ============================================
-- Total          : 25 Queries
-- ============================================
