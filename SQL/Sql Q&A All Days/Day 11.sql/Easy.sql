-- ===========================================
-- SECTION B: PRACTICAL QUESTIONS (Q51-Q100)
-- ===========================================

-- Q51. Flipkart's inventory manager needs to find all products whose price is higher than the average price across all products. Help them identify these premium products.

-- Q52. Zomato's customer success team wants to find customers who have placed at least one order. They need a list of customer names who exist in the orders table.

-- Q53. BigBasket's category manager needs to identify products that belong to the same category as product ID 101. Find all such products.

-- Q54. Myntra's sales analyst wants to find the most expensive product in the entire catalog. Display its name and price.

-- Q55. PhonePe's operations team needs to find all stores located in the same city as store ID 1. List these stores.

-- Q56. Ola's HR department wants to identify employees who earn more than the average salary in the company.

-- Q57. Amazon India's fulfillment team needs to find orders that were placed on the same date as order ID 1001. Show the order details.

-- Q58. Swiggy's analytics team wants to find all customers who have never placed any order. These are potential targets for re-engagement campaigns.

-- Q59. IRCTC's revenue team needs to find the order with the highest total amount. Display all details of this order.

-- Q60. Reliance Retail wants to find products supplied by the same supplier as product ID 50. List the product names.

-- Q61. Paytm Mall's team needs to identify all products that have never been ordered. Find products with no matching entries in order_items.

-- Q62. Flipkart's promotion team wants to find products whose price is below the minimum price of products in the 'Electronics' category.

-- Q63. Zomato's regional manager needs to find stores that are in the 'North' region, using the stores table only (not joining with any dimension table).

-- Q64. BigBasket's analyst wants to find customers who joined before the earliest order date in the system.

-- Q65. Myntra's merchandising team needs to find the total number of products that are priced above the average price.

-- Q66. PhonePe's audit team wants to list all payments that are for amounts greater than the average payment amount.

-- Q67. Ola's HR needs to find departments that have at least one employee. List department names.

-- Q68. Amazon's warehouse team wants to find products that have inventory in more than one store (just identify the product IDs).

-- Q69. Swiggy's customer team needs to find customers from the same state as customer ID 100.

-- Q70. IRCTC's finance team wants to identify stores that have recorded expenses. List store IDs that exist in the expenses table.

-- Q71. Reliance Digital's analyst needs to find the product with the lowest price in the 'Clothing' category.

-- Q72. Paytm's marketing team wants to find campaigns that have ads_spend records. List campaign names that appear in the ads_spend table.

-- Q73. Flipkart's returns department needs to find orders that have at least one return recorded. List order IDs.

-- Q74. Zomato's operations wants to find the total revenue from orders placed in the same city as the store with the highest total sales.

-- Q75. BigBasket's inventory team needs to count how many products have stock quantity above the average stock quantity.

-- Q76. Myntra's HR team wants to find employees who work in stores that are located in 'Mumbai'.

-- Q77. PhonePe's analyst needs to find the order ID that has the maximum number of items (based on count of order_items).

-- Q78. Ola's finance team wants to list all expense categories that have been used by at least one store.


-- Q79. Amazon's category team needs to find all products in categories that have more than 10 products.

-- Q80. Swiggy's customer support needs to find customers who have written at least one review.

-- Q81. IRCTC's shipping team wants to find orders that have not been shipped yet (no entry in shipments table).

-- Q82. Reliance Retail's HR needs to find the highest paid employee in each department (showing employee name and department).

-- Q83. Paytm's analyst wants to find products whose price matches the maximum price among all products from the same brand.

-- Q84. Flipkart's regional team needs to list all regions that have at least one store operating.

-- Q85. Zomato's campaign manager wants to find emails sent to customers who have placed more than 5 orders.

-- Q86. BigBasket's pricing team needs to find products that are priced exactly at the average price (rounded to 2 decimals).

-- Q87. Myntra's analytics wants to display each product name along with the overall average product price as a separate column.

-- Q88. PhonePe's operations needs to find customers whose total order value exceeds the average total order value per customer.

-- Q89. Ola's HR team wants to find employees who have never been marked absent (no 'Absent' status in attendance).

-- Q90. Amazon's vendor team needs to find suppliers who supply products in more than one category.

-- Q91. Swiggy's loyalty team wants to find customers whose loyalty points are above the average loyalty points.

-- Q92. IRCTC's sales team needs to find the second highest total_amount among all orders (using subqueries, not LIMIT with OFFSET).

-- Q93. Reliance Digital's inventory team needs to identify stores that don't have any inventory records.

-- Q94. Paytm's marketing wants to find all campaigns that have not received any clicks (conversions = 0 or no ads_spend records).

-- Q95. Flipkart's analyst needs to list products along with a column showing if their price is 'Above Average' or 'Below Average'.

-- Q96. Zomato's HR needs to find employees whose salary is between the minimum and average salary of their department.

-- Q97. BigBasket's delivery team needs to find orders shipped by couriers that have delivered more than 100 orders.

-- Q98. Myntra's finance team needs to find stores whose total expenses exceed the average store expenses.

-- Q99. PhonePe's analyst wants to find customers who have ordered products from every category (using EXISTS).

-- Q100. Ola's strategy team needs to find the store with the highest number of employees and display its details.

-- ============================================
-- END OF DAY 11 EASY QUESTIONS
-- ============================================





-- Q51. retailmart's inventory manager needs to find all products whose price is higher than the average price across all products. Help them identify these premium products.

select prod_name,
		prod_id,
		price
FROM products.products
	where price > ( select round(avg(price),2)
from products.products);

-- Q52. Retailmart's customer success team wants to find customers who have placed at least one order. They need a list of customer names who exist in the orders table.

select * from sales.orders;

select full_name
		from customers.customers c
where exists (
		SELECT 1 from sales.orders o
		where c.cust_id = o.cust_id
);

-- Q53. Retail Mart's category manager needs to identify products that belong to the same category as product ID 101. Find all such products.

SELECT * from products.products

sELECT *
FROM products.products
WHERE category = (
    SELECT category
    FROM products.products
    WHERE prod_id = 101
);

-- Q54. Retailmart's sales analyst wants to find the most expensive product in the entire catalog. Display its name and price.

SELECT * from products.products

SELECT prod_name,
		price
from products.products
where price = (select max(price)
from products.products);

-- Q55. Retailmart's operations team needs to find all stores located in the same city as store ID 1. List these stores.

SELECT * from stores.stores

select * from stores.stores
WHERE city = (
	select city
	from stores.stores
	where store_id = 1
);


-- Q56. Retailmarts's HR department wants to identify employees who earn more than the average salary in the company.

select * FROM stores.employees

SELECT emp_name,
		emp_id,
		salary
from stores.employees
	where 
	salary > ( select round(avg(salary),2)
	from stores.employees);
	
-- Q57. Retailmart's fulfillment team needs to find orders that were placed on the same date as order ID 1001. Show the order details.
SELECT * from sales.orders

SELECT * from sales.orders 
where order_date = (
	select order_date
	from sales.orders
	where order_id = 1001);

-- Q58. Retailmart's analytics team wants to find all customers who have never placed any order. These are potential targets for re-engagement campaigns.

SELECT * FROM customers.customers

SELECT c.full_name
FROM customers.customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM sales.orders o
    WHERE o.cust_id = c.cust_id
);

-- Q59. Retailmart's revenue team needs to find the order with the highest total amount. Display all details of this order.

SELECT * FROM sales.orders

select * from sales.orders
where total_amount = (select max(total_amount)
	from sales.orders);

-- Q60. Reliance Retail wants to find products supplied by the same supplier as product ID 50. List the product names.

select * from products.products

select prod_name
from products.products
where supplier_id = ( select  supplier_id
	from products.products
	where prod_id = 50);
	
-- Q61. Retailmart Mall's team needs to identify all products that have never been ordered. Find products with no matching entries in order_items.

SELECT * from sales.order_items

SELECT
    p.prod_id,
    p.prod_name
FROM products.products p
WHERE NOT EXISTS (
    SELECT 1
    FROM sales.order_items o
    WHERE o.prod_id = p.prod_id
);



-- Q62. Retailmart's promotion team wants to find products whose price is below the minimum price of products in the 'Electronics' category.


SELECT prod_name, category, price
FROM products.products
ORDER BY price ASC;			--- To Check all products prices in ascending order

SELECT MIN(price)
FROM products.products
WHERE category = 'Electronics';  ---  To Check min priced Electronic products 


select prod_name,
		category,
		price
from products.products
where price <(
	select min(price)
from products.products
where category = 'Electronics'		--- Main Solution
);



	
-- Q63. Retailmart's regional manager needs to find stores that are in the 'North' region, using the stores table only (not joining with any dimension table).

select store_name,
		store_id,
		region
from stores.stores
where region = 'North';
	
-- Q64. BigBasket's analyst wants to find customers who joined before the earliest order date in the system.

select full_name,
		cust_id,
		join_date
from customers.customers
where join_date < ( select min(order_date)
		from sales.orders)
	SELECT * from sales.orders
order by order_date asc

-- Q65. Retailmart's merchandising team needs to find the total number of products that are priced above the average price.\

select count(*) as prod_abov_the_avg
from products.products
where price > (select  round(avg(price),2)
	from products.products);


-- Q66. Retailmart's audit team wants to list all payments that are for amounts greater than the average payment amount.
select * from sales.payments

select *
from sales.payments
where amount > (select  round(avg(amount),2)
	from sales.payments);

-- Q67. Retailmart's HR needs to find departments that have at least one employee. List department names.
select * from stores.employees
select * from stores.departments

select dept_name
from stores.departments d
where exists (select 1 
	from stores.employees e
	where d.dept_id = e.dept_id);

-- Q68. Retailmart's warehouse team wants to find products that have inventory in more than one store (just identify the product IDs).

SELECT prod_id
FROM (
    SELECT
        prod_id,
        COUNT(DISTINCT store_id) AS store_cnt
    FROM products.inventory
    GROUP BY prod_id
) t
WHERE store_cnt > 1;

-- Q69. Retailmart's customer team needs to find customers from the same state as customer ID 100.

select full_name,
		state
from customers.customers
where state = (select state
	from customers.customers
	where cust_id = 100);

-- Q70. Retailmart's finance team wants to identify stores that have recorded expenses. List store IDs that exist in the expenses table.

SELECT s.store_id
FROM stores.stores s
WHERE EXISTS (
    SELECT 1
    FROM finance.expenses e
    WHERE e.store_id = s.store_id
);

-- Q71. Retailmart's analyst needs to find the product with the lowest price in the 'Clothing' category.

select * from products.products

SELECT
    prod_name,
    price,
    category
FROM products.products
WHERE category = 'Fashion'
  AND price = (
      SELECT MIN(price)
      FROM products.products
      WHERE category = 'Fashion'
  );

-- Q72. Retailmart's marketing team wants to find campaigns that have ads_spend records. List campaign names that appear in the ads_spend table.

select * from marketing.ads_spend
SELECT * from marketing.campaigns

select distinct
	c.campaign_name,
		c.campaign_id,
		a.spend_id
from  marketing.campaigns c
join marketing.ads_spend a
	on c.campaign_id = a.campaign_id

-- Q73. Retailmart's returns department needs to find orders that have at least one return recorded. List order IDs.
select * from sales.returns

select order_id
from sales.orders o
where exists  (
		select 7
from sales.returns r
where o.order_id = r.order_id);

-- Q74. Retailmart's operations wants to find the total revenue from orders placed in the same city as the store with the highest total sales.

select * from sales.orders

SELECT 
    SUM(o.total_amount) AS total_revenue        -- Final output: total revenue from the target city
FROM sales.orders o
JOIN stores.stores s
    ON o.store_id = s.store_id                  -- Join orders to stores to get city information
WHERE s.city = (                                -- Filter orders to only one specific city
    SELECT s2.city                              -- Step 2: get the city of the top-selling store
    FROM stores.stores s2
    WHERE s2.store_id = (                       -- Match only the top-selling store
        SELECT o2.store_id                      -- Step 1: identify which store sold the most
        FROM sales.orders o2
        GROUP BY o2.store_id                    -- Calculate total sales per store
        ORDER BY SUM(o2.total_amount) DESC      -- Rank stores by total sales (highest first)
        LIMIT 1                                 -- Pick only the top store
    )
);

-- Q75. Retailmart's inventory team needs to count how many products have stock quantity above the average stock quantity.
select * from products.products
select * from products.inventory

SELECT 
    COUNT(*) AS prod_above_avg_stock
FROM products.inventory i
WHERE i.stock_qty > (
    SELECT AVG(stock_qty)
    FROM products.inventory
);


-- Q76. Retailmart's HR team wants to find employees who work in stores that are located in 'Mumbai'.

select * from stores.employees
select * from stores.stores

select emp_id,
		emp_name,
		city
from stores.employees e
join stores.stores s
	on e.store_id = s.store_id
where s.city = 'Mumbai';

-- Q77. Retailmart's analyst needs to find the order ID that has the maximum number of items (based on count of order_items).

select * from sales.orders
select * from sales.order_items

SELECT order_id
FROM sales.order_items
GROUP BY order_id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q78. Retaimart's finance team wants to list all expense categories that have been used by at least one store.

select * from stores.expenses

SELECT DISTINCT 
	S.EXPENSE_TYPE
FROM STORES.expenses S;

-- Q79. Retailmart's category team needs to find all products in categories that have more than 10 products.

Select *
from products.products
where category in (
select category
from products.products
group by category
having count(*) > 10
)

-- Q80. Retailmart's customer support needs to find customers who have written at least one review.

SELECT DISTINCT 
	r.cust_id
FROM customers.reviews r;

-- Q81. Retailmart's shipping team wants to find orders that have not been shipped yet (no entry in shipments table).

select * from
sales.orders
where order_id not in(						-- using not in approach	
	select order_id
	from sales.shipments
)

SELECT *
FROM sales.orders o
WHERE NOT EXISTS (						--- Using not exists
    SELECT 1
    FROM sales.shipments s
    WHERE s.order_id = o.order_id
);

-- Q82. Retailmarts Retail's HR needs to find the highest paid employee in each department (showing employee name and department).

SELECT 
		e1.emp_id,
		e1.dept_id,
		e1.salary
from stores.employees e1
WHERE e1.salary = (
	select max(salary)
	from stores.employees e2
where 
	e1.dept_id = e2.dept_id 

);

-- Q83. Retailmart's analyst wants to find products whose price matches the maximum price among all products from the same brand.

select p1.prod_name,
		p1.price,
		p1.brand
from products.products p1
where p1.price = (
	SELECT max(price)
    from products.products p2
where 
	p1.brand = p2.brand
);

-- Q84. Retailmart's regional team needs to list all regions that have at least one store operating.

SELECT DISTINCT state
FROM stores.stores;

-- Q85. Retailmart's campaign manager wants to find emails sent to customers who have placed more than 5 orders.


select e.*
from marketing.email_clicks e
WHEre e.cust_id in (
	select cust_id
	from sales.orders
	group by cust_id
	having count(*) > 5
);

-- Q86. Retailmart's pricing team needs to find products that are priced exactly at the average price (rounded to 2 decimals).

SELECT
   p.prod_id,
   p.price
FROM products.products p         --- 0 products 
WHERE p.price = (
    SELECT ROUND(AVG(price), 2)
    FROM products.products
);

-- Q87. Retailmart's analytics wants to display each product name along with the overall average product price as a separate column.

select prod_name,
	avg(price) as avg_price
from products.products
GROUP by prod_name;

-- Q88. Retailmart's operations needs to find customers whose total order value exceeds the average total order value per customer.

select * from sales.orders

SELECT cust_id
FROM sales.orders
GROUP BY cust_id
HAVING SUM(total_amount) > (
    SELECT AVG(total_per_customer)
    FROM (
        SELECT SUM(total_amount) AS total_per_customer
        FROM sales.orders
        GROUP BY cust_id
    ) t
);

-- Q89. Retailmart's HR team wants to find employees who have never been marked absent (no 'Absent' status in attendance).

SELECT DISTINCT a.emp_id
FROM hr.attendance a
WHERE NOT EXISTS (
    SELECT 1
    FROM hr.attendance a2
    WHERE a2.emp_id = a.emp_id
      AND a2.status = 'A'
);

-- Q90. Retailmart's vendor team needs to find suppliers who supply products in more than one category.

select supplier_id
from products.products
group by supplier_id
having count(distinct category) >1;


-- Q91. Retailmart's loyalty team wants to find customers whose loyalty points are above the average loyalty points.

select cust_id 
from customers.loyalty_points l
where total_points > (
	select avg(total_points)
	from customers.loyalty_points
);

-- Q92. Retailmart's sales team needs to find the second highest total_amount among all orders (using subqueries, not LIMIT with OFFSET).

SELECT MAX(total_amount)
FROM sales.orders
WHERE total_amount < (
    SELECT MAX(total_amount)
    FROM sales.orders
);
