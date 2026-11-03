-- ============================================================
-- SQL PRACTICE — TOPIC 1: BASICS
-- Dataset: RetailMart (PostgreSQL)
-- Concepts: SELECT, WHERE, ORDER BY, DISTINCT, NULL,
--            LIKE, ILIKE, Regex, EXTRACT, LENGTH, Subqueries
-- ============================================================


-- Q1. Find all customers whose name starts with a vowel (case-insensitive)

-- Method 1: ILIKE with OR
SELECT full_name
FROM customers.customers
WHERE full_name ILIKE 'A%' OR full_name ILIKE 'E%'
   OR full_name ILIKE 'I%' OR full_name ILIKE 'O%'
   OR full_name ILIKE 'U%';

-- Method 2: Regex (cleaner)
SELECT full_name
FROM customers.customers
WHERE full_name ~* '^[aeiou]';

-- NOTE:
-- ILIKE = case-insensitive LIKE (PostgreSQL specific)
-- ~*    = case-insensitive regex match
-- ^     = start of string anchor
-- [aeiou] = character class — matches any ONE of these letters


-- ---------------------------------------------------------------

-- Q2. List all orders placed in the last 90 days (from max date),
--     with total_amount between 500 and 5000, sorted by amount DESC

SELECT *
FROM sales.orders
WHERE order_date >= (SELECT MAX(order_date) FROM sales.orders) - INTERVAL '90 days'
  AND total_amount BETWEEN 500 AND 5000
ORDER BY total_amount DESC;

-- NOTE:
-- Historical datasets have no "today" — use MAX(order_date) as reference
-- INTERVAL '90 days' subtracts days from a date in PostgreSQL
-- BETWEEN is inclusive on both ends (500 and 5000 included)


-- ---------------------------------------------------------------

-- Q3. Find all products where the product name contains a number anywhere

SELECT prod_name
FROM products.products
WHERE prod_name ~ '[0-9]';

-- NOTE:
-- ~  = case-sensitive regex match (digits have no case, so ~ is enough)
-- ~* = case-insensitive regex match (also works here, no difference for digits)
-- [0-9] = character class matching any single digit
-- No ^ anchor used — we want the digit ANYWHERE in the name, not just at start


-- ---------------------------------------------------------------

-- Q4. SKIPPED — phone and email columns do not exist in RetailMart dataset


-- ---------------------------------------------------------------

-- Q5. Find the 5th and 6th highest-priced products
--     (without LIMIT/OFFSET or window functions — using correlated subquery)

SELECT prod_name, price
FROM products.products p1
WHERE (
    SELECT COUNT(DISTINCT price)
    FROM products.products p2
    WHERE p2.price > p1.price
) IN (4, 5);

-- NOTE:
-- For each row (p1), the subquery counts how many DISTINCT prices are greater
-- If count = 0 → rank 1 (highest price)
-- If count = 1 → rank 2
-- If count = 4 → rank 5  ← we want this
-- If count = 5 → rank 6  ← and this
-- DISTINCT used to handle duplicate prices correctly


-- ---------------------------------------------------------------

-- Q6. Get all orders where the order_date falls on a weekend (Sat or Sun)

SELECT *
FROM sales.orders
WHERE EXTRACT(ISODOW FROM order_date) IN (6, 7);

-- NOTE:
-- EXTRACT(DOW FROM date)   → Sunday=0, Monday=1 ... Saturday=6
-- EXTRACT(ISODOW FROM date)→ Monday=1, Tuesday=2 ... Saturday=6, Sunday=7
-- ISODOW preferred — ISO standard, Sunday=7 instead of 0 (less confusing)
-- No subquery needed — EXTRACT works directly on the column in WHERE


-- ---------------------------------------------------------------

-- Q7. Find all customers whose city name has exactly 6 characters

SELECT full_name
FROM customers.customers
WHERE LENGTH(city) = 6;

-- NOTE:
-- LENGTH() = PostgreSQL function to count characters in a string
-- SQL Server/Excel equivalent: LEN()
-- Can be used directly in WHERE without subquery


-- ---------------------------------------------------------------

-- Q8. List all products that have "Pro" OR "Max" in name but NOT both (XOR logic)

SELECT prod_name
FROM products.products
WHERE (prod_name ILIKE '%pro%' AND prod_name NOT ILIKE '%max%')
   OR (prod_name ILIKE '%max%' AND prod_name NOT ILIKE '%pro%');

-- NOTE:
-- XOR = one OR the other, but NOT both
-- Parentheses are critical here — AND evaluates before OR
-- Without parentheses, logic breaks due to operator precedence
-- '%pro%' = contains "pro" anywhere (% on both sides)


-- ---------------------------------------------------------------

-- Q9. List orders from the first half of the month (days 1-15)
--     where total_amount is above the overall average

SELECT *,
       (SELECT AVG(total_amount) FROM sales.orders) AS avg_total_amount
FROM sales.orders
WHERE EXTRACT(DAY FROM order_date) <= 15
  AND total_amount > (SELECT AVG(total_amount) FROM sales.orders);

-- NOTE:
-- EXTRACT(DAY FROM date) pulls the day number (1-31) from a date
-- AVG() subquery returns a single value — valid for comparison in WHERE
-- Added avg as a column in SELECT so you can compare each row against it


-- ---------------------------------------------------------------

-- Q10. Find customers whose full_name has more than 2 words
--      (i.e., contains at least 2 spaces) — using pattern matching only

SELECT full_name
FROM customers.customers
WHERE full_name LIKE '% % %';

-- NOTE:
-- '% % %' pattern = anything + space + anything + space + anything
-- This guarantees at least 2 spaces → at least 3 words
-- LIKE used (not ILIKE) since spaces have no case
-- No string split functions used — pure pattern matching


-- ============================================================
-- TOPIC 1 COMPLETE
-- Key concepts covered:
-- ✅ ILIKE for case-insensitive pattern matching
-- ✅ Regex operators: ~ (case-sensitive), ~* (case-insensitive)
-- ✅ Regex anchors: ^ (start), character classes [aeiou] [0-9]
-- ✅ MAX() in subquery as historical "today" substitute
-- ✅ INTERVAL for date arithmetic
-- ✅ BETWEEN for range filtering
-- ✅ Correlated subquery for Nth highest value (without window functions)
-- ✅ EXTRACT(ISODOW/DAY FROM date) for date part filtering
-- ✅ LENGTH() for string length filtering
-- ✅ XOR logic using AND/OR with proper parentheses
-- ✅ LIKE pattern matching for word count detection
-- ============================================================


