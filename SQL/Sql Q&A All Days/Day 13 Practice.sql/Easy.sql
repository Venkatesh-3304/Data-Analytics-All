-- =====================
-- PRACTICAL QUESTIONS (Q51-Q100)
-- =====================

-- Q51. Flipkart's warehouse manager wants to assign a unique sequence number to 
-- each product in the products table, ordered by product name alphabetically. 
-- Help him create this simple numbered list.

-- Q52. Zomato's operations team needs to see all orders with a sequential number 
-- assigned based on order_date (oldest first). They just want order_id, order_date, 
-- and a sequence number.

-- Q53. BigBasket's inventory team wants to rank all products by their current price, 
-- with the most expensive product getting rank 1. Show prod_id, prod_name, price, and rank.

-- Q54. Myntra's fashion analytics team needs to number all customers in the order 
-- they joined (join_date), with the earliest customer as number 1. 
-- Display cust_id, full_name, join_date, and sequence number.

-- Q55. Amazon India's sales team wants to see all orders with their rank based on 
-- total_amount (highest first). They need order_id, total_amount, and the rank.

-- Q56. Swiggy's delivery analytics needs to number all stores by their store_id 
-- in ascending order. Show store_id, store_name, city, and row number.

-- Q57. PhonePe's reporting needs to rank all payments by amount, but they notice 
-- some payments have the same amount. Use RANK() to show payment_id, amount, and rank.

-- Q58. Ola's driver performance team wants to rank employees by salary using DENSE_RANK(). 
-- Show emp_id, emp_name, salary, and dense rank.

-- Q59. Paytm's analytics team needs to see the difference between RANK() and DENSE_RANK() 
-- for products ordered by price. Show prod_name, price, both RANK and DENSE_RANK side by side.

-- Q60. IRCTC's booking team wants to number all customers within each state separately. 
-- Each state should have numbering starting from 1 based on customer join_date.

-- Q61. Reliance Retail's regional manager wants to rank stores within each region 
-- by their store_id. Show store_name, region, and rank within that region.

-- Q62. Flipkart's HR team needs to rank employees within each department by salary 
-- (highest salary gets rank 1). Show emp_name, dept_id, salary, and rank.

-- Q63. Zomato's restaurant team wants to number orders for each customer separately, 
-- based on order_date. Show cust_id, order_id, order_date, and order sequence per customer.

-- Q64. BigBasket's supplier management needs to rank products within each supplier 
-- by price (cheapest first). Display prod_name, supplier_id, price, and rank.

-- Q65. Myntra's customer analytics wants to rank customers within each city by their age 
-- (youngest first). Show full_name, city, age, and rank within city.

-- Q66. Amazon India's logistics team needs to number shipments within each courier company, 
-- ordered by shipped_date. Show shipment_id, courier_name, shipped_date, and sequence.

-- Q67. Swiggy's finance team wants to see all expenses ranked by amount within each store. 
-- Display store_id, expense_type, amount, and rank for stores schema expenses.

-- Q68. PhonePe's campaign team needs to rank marketing campaigns by their budget 
-- (highest first). Show campaign_name, budget, and rank.

-- Q69. Ola's HR analytics wants to number all attendance records for each employee, 
-- ordered by date. Show emp_id, date, status, and sequence number per employee.

-- Q70. Paytm's sales analysis needs the top 3 orders by total_amount. 
-- Use ROW_NUMBER() and filter using a subquery or CTE.

-- Q71. IRCTC's regional analysis needs to find the highest-priced product in each category. 
-- Use RANK() with PARTITION BY category and filter for rank = 1.

-- Q72. Reliance Retail wants to identify the top 2 employees by salary in each department. 
-- Use ROW_NUMBER() partitioned by dept_id and filter appropriately.

-- Q73. Flipkart's inventory team needs the 3 most recently updated inventory records 
-- per store. Use window functions to identify and extract these records.

-- Q74. Zomato's review analytics needs to find the top-rated review for each product 
-- (highest rating, then most recent review_date as tiebreaker).

-- Q75. BigBasket's promotion team needs to rank promotions by discount_percent 
-- (highest first) and show only the top 5 promotions.

-- Q76. Myntra's store analytics wants the newest employee (by emp_id as proxy for hire order) 
-- in each store. Partition by store_id and filter for row number 1.

-- Q77. Amazon India's payment analysis needs to rank payments within each payment_mode 
-- by amount. Show payment_mode, amount, and rank within that payment mode.

-- Q78. Swiggy's customer segmentation needs to assign customers to numbered tiers 
-- within each region based on their loyalty points (highest points = tier 1).

-- Q79. PhonePe's returns analysis wants to rank returned items by refund_amount 
-- within each order. Show order_id, prod_id, refund_amount, and rank.

-- Q80. Ola's salary analysis needs to show each employee's salary rank within their store 
-- and also their overall rank across all stores. Show both ranks side by side.

-- Q81. Paytm's order analysis wants to display orders with three columns: 
-- overall rank by amount, rank within customer, and rank within store.

-- Q82. IRCTC's date analysis needs to number each day's orders sequentially. 
-- Partition by order_date and number by order_id within each date.

-- Q83. Reliance Retail's brand analysis wants to rank products within each brand 
-- by price. Show brand, prod_name, price, and dense rank within brand.

-- Q84. Flipkart's state-wise analysis needs to rank stores within each state 
-- alphabetically by store_name. Show state, store_name, and rank.

-- Q85. Zomato's gender-based analysis wants to rank customers within each gender 
-- by age (oldest first). Show gender, full_name, age, and rank.

-- Q86. BigBasket's click analysis needs to rank email campaigns by their click count 
-- (derived from email_clicks where clicked = true). Show campaign_id and click rank.

-- Q87. Myntra's expense tracking needs to identify the single largest expense for each store 
-- using window functions. Show store_id, expense_type, amount.

-- Q88. Amazon India's shipment tracking wants to find orders with the fastest delivery 
-- (smallest gap between shipped_date and delivered_date) per courier. Use ranking functions.

-- Q89. Swiggy's department analysis needs to rank departments by the count of employees 
-- in each. First aggregate, then rank the results.

-- Q90. PhonePe's monthly analysis needs to number orders within each month 
-- (extract month from order_date). Show order_id, order_date, month, and sequence within month.

-- Q91. Ola's campaign effectiveness needs to rank ad channels by conversions within each campaign. 
-- Show campaign_id, channel, conversions, and rank within campaign.

-- Q92. Paytm's customer loyalty analysis wants to rank customers by total_points, 
-- but only for customers with more than 1000 points. Show cust_id, total_points, and rank.

-- Q93. IRCTC's product review analysis needs to rank products by their average rating. 
-- First calculate average rating, then rank products.

-- Q94. Reliance Retail's address analysis wants to number addresses for each customer 
-- by address_type alphabetically. Show cust_id, address_type, city, and sequence.

-- Q95. Flipkart's revenue analysis needs to rank stores by their total sales from 
-- revenue_summary table. Show store_id, total_sales, and rank.

-- Q96. Zomato's order status analysis wants to rank orders within each status 
-- by total_amount. Show order_status, order_id, total_amount, and rank within status.

-- Q97. BigBasket's supplier analysis needs to show how many products each supplier has, 
-- then rank suppliers by product count (most products = rank 1).

-- Q98. Myntra's quarterly analysis needs to number customers who joined in each quarter. 
-- Use dim_date or extract quarter from join_date, partition by quarter.

-- Q99. Amazon India's city-wise analysis needs to rank customers within each city 
-- by their join_date (earliest = rank 1), showing ties with DENSE_RANK().

-- Q100. Swiggy's comprehensive ranking needs to show employees with their rank by salary 
-- within department, within store, and overall. Display all three ranks for comparison.

-- ============================================
-- END OF DAY 13 EASY QUESTIONS
-- ============================================


********************************************* ANSWERS *********************************************

-- Scenario: TCS HR wants to see each employee's salary along with their department's average
-- salary - keeping every employee row visible.

select 
	e.emp_name,
	e.role,
	d.dept_name,
	e.salary,
	avg(e.salary) over (PARTITION by e.dept_id) as dept_avg_salary
from stores.employees e
join stores.departments d
on e.dept_id = d.dept_id
order by d.dept_name, e.salary desc;


-- Scenario: Number each customer's orders to track their purchase journey.

SELECT 
	c.full_name,
	o.order_id,
	o.order_date,
	o.total_amount,
	row_number() over(
	partition by cust_id
	order by o.order_date
	),
	CASE
		when row_number() over (
			partition by
				c.cust_id
			order by
				o.order_date
			) = 1 then 'First Purchase'
			else 'Repeat Customer'
	end as customer_type		
from 
	sales.orders o
	join customers.customers c using (cust_id)
		
-- Scenario: Identify and handle duplicate customer entries, keeping only the most recent record.

with 
	ranked_customers as (
	select 
		full_name,
		city,
		state,
		join_date,
		row_number() over (
			partition by
				full_name
			order by 
				join_date desc
		) as dup_rank
	from 
		customers.customers
	)
SELECT
	*
from
	ranked_customers
where 
	dup_rank = 1;




-- Q51. Flipkart's warehouse manager wants to assign a unique sequence number to 
-- each product in the products table, ordered by product name alphabetically. 
-- Help him create this simple numbered list.

select *,
	row_number() over(
			order by prod_name			
	) as sequence_numbering
	from products.products;

-- Q52. Zomato's operations team needs to see all orders with a sequential number 
-- assigned based on order_date (oldest first). They just want order_id, order_date, 
-- and a sequence number.

select order_id, order_date,
	row_number() over(
			order by order_date aSC
		) as orders_suquence
	from sales.orders;
	
-- Q53. BigBasket's inventory team wants to rank all products by their current price, 
-- with the most expensive product getting rank 1. Show prod_id, prod_name, price, and rank.

SELECT prod_id,
		prod_name,
		price,
		rank() over(
			order by price DESC
		) prod_ranking
	from products.products;
		
-- Q54. Myntra's fashion analytics team needs to number all customers in the order 
-- they joined (join_date), with the earliest customer as number 1. 
-- Display cust_id, full_name, join_date, and sequence number.

SELECT cust_id,
	full_name,
	join_date,
	row_number() over(
		order by join_date ASC
	) cust_join_sequence
FROM customers.customers;
	
-- Q55. Amazon India's sales team wants to see all orders with their rank based on 
-- total_amount (highest first). They need order_id, total_amount, and the rank.

SELECT order_id,
		total_amount,
		rank() over(
			order by total_amount DESC
		) orders_ranking
from sales.orders;

-- Q56. Swiggy's delivery analytics needs to number all stores by their store_id 
-- in ascending order. Show store_id, store_name, city, and row number.

SELECT store_id,
		store_name,
		city,
		row_number() over(
			order by store_id asc
		) store_sequence
FROM stores.stores;

-- Q57. PhonePe's reporting needs to rank all payments by amount, but they notice 
-- some payments have the same amount. Use RANK() to show payment_id, amount, and rank.

SELECT PAYMENT_ID,
		AMOUNT,
		RANK() OVER(
		ORDER BY  AMOUNT
		)PAYMENT_RANKING
	FROM SALES.payments;


-- Q58. Ola's driver performance team wants to rank employees by salary using DENSE_RANK(). 
-- Show emp_id, emp_name, salary, and dense rank.

SELECT EMP_ID,
	emp_name,
	salary,
	dense_rank() over(
	order by salary
	)salary_ranking
FROM stores.employees;

-- Q59. Paytm's analytics team needs to see the difference between RANK() and DENSE_RANK() 
-- for products ordered by price. Show prod_name, price, both RANK and DENSE_RANK side by side.

SELECT prod_name,
		price,
		rank() over(
		order by price
		) rank,

		dense_rank() over(
		order by price
		) dense_rank
	from products.products;

-- Q60. IRCTC's booking team wants to number all customers within each state separately. 
-- Each state should have numbering starting from 1 based on customer join_date.

select full_name,
		state,
		join_date,
		row_number() over(
			partition by state
			ORDER by join_date asc
			) emp_numbering_state_wise
	from customers.customers ;

-- Q61. Reliance Retail's regional manager wants to rank stores within each region 
-- by their store_id. Show store_name, region, and rank within that region.

SELECT store_name,
		region,
		rank() over(
			partition by region
			order by store_id
			) store_ranking_region_wise
	from stores.stores;

-- Q62. Flipkart's HR team needs to rank employees within each department by salary 
-- (highest salary gets rank 1). Show emp_name, dept_id, salary, and rank.

select emp_name,
		dept_id,
		salary,
		rank() over(
		partition by dept_id
		order by salary desc
		)dept_wise_emp_ranking
	from stores.employees;

SELECT e.emp_name,
		e.dept_id,
		d.dept_name,
		e.salary,
		rank() over (
		partition by e.dept_id
		order by e.salary DESC
		) dept_wise_emp_ranking
	from stores.employees e
	join stores.departments d	
	on e.dept_id = d.dept_id;

-- Q63. Zomato's restaurant team wants to number orders for each customer separately, 
-- based on order_date. Show cust_id, order_id, order_date, and order sequence per customer.

SELECT cust_id,
		order_id,
		order_date,
		row_number() over(
		partition by cust_id
		order by order_date
		)order_numbering
	from sales.orders;

-- Q64. BigBasket's supplier management needs to rank products within each supplier 
-- by price (cheapest first). Display prod_name, supplier_id, price, and rank.

SELECT prod_name,
		supplier_id,
		price,
		rank() over(
		partition by supplier_id
		order by price asc

		)
			from products.products;

-- Q65. Myntra's customer analytics wants to rank customers within each city by their age 
-- (youngest first). Show full_name, city, age, and rank within city.

select full_name,
		city,
		age,
		rank() over(
		partition by city
		order by age ASC
		) cust_ranking_by_age
		from customers.customers;

-- Q66. Amazon India's logistics team needs to number shipments within each courier company, 
-- ordered by shipped_date. Show shipment_id, courier_name, shipped_date, and sequence.

SELECT shipment_id,
		courier_name,
		shipped_date,
		row_number() over(
		partition by courier_name
		order by shipped_date
		) ORDER_sequnce
	FROM sales.shipments;

-- Q67. Swiggy's finance team wants to see all expenses ranked by amount within each store. 
-- Display store_id, expense_type, amount, and rank for stores schema expenses.

SELECT store_id,
	expense_type,
	amount,
	rank() over(
	partition by store_id
	order by amount
	) expense_ranking
	from stores.expenses;

-- Q68. PhonePe's campaign team needs to rank marketing campaigns by their budget 
-- (highest first). Show campaign_name, budget, and rank.

SELECT campaign_name,
		budget,
		rank() over(
		order by budget desc
		) campaign_ranking
		from marketing.campaigns;
		

-- Q69. Ola's HR analytics wants to number all attendance records for each employee, 
-- ordered by date. Show emp_id, date, status, and sequence number per employee.

select emp_id,
		date,
		status,
		row_number() over(
		partition by emp_id
		order by date
		) attendance_numbering
		from hr.attendance;				

-- Q70. Paytm's sales analysis needs the top 3 orders by total_amount. 
-- Use ROW_NUMBER() and filter using a subquery or CTE.

with top_3_orders as (
		select order_id,
		total_amount,
		row_number() over(
			order by total_amount DESC
		
) as top_3_prod
from sales.orders
)
select order_id, total_amount,top_3_prod
from top_3_orders
where top_3_prod <= 3;
	
-- Q71. IRCTC's regional analysis needs to find the highest-priced product in each category. 
-- Use RANK() with PARTITION BY category and filter for rank = 1.

with top_products as(
SELECT prod_name,
		category,
		price,
		rank() over(
		partition by category
		order by price DESC
		) top_prods 
	from products.products
			)
select prod_name,
		category,
		price,
		top_prods
	from top_products
where top_prods = 1;
		

-- Q72. Reliance Retail wants to identify the top 2 employees by salary in each department. 
-- Use ROW_NUMBER() partitioned by dept_id and filter appropriately.

with top_2_emp as(
select emp_name,
	dept_id,
	salary,
	row_number() over(
	partition by dept_id
	order by salary DESC
	)top_2_emp
from stores.employees
)

select emp_name,
		dept_id,
		salary,
		top_2_emp
	from top_2_emp
where top_2_emp <= 2;


-- Q73. Flipkart's inventory team needs the 3 most recently updated inventory records 
-- per store. Use window functions to identify and extract these records.

with recent_updated_stock as (
	select prod_id,
			store_id,
			last_updated,
		row_number() over(
			partition by store_id
			order by last_updated desc
		) stock_updates
	FROM products.inventory
			
)

SELECT prod_id,
		store_id,
		stock_updates,
		last_updated
	from  recent_updated_stock
	where stock_updates <= 3;


-- Q74. Zomato's review analytics needs to find the top-rated review for each product 
-- (highest rating, then most recent review_date as tiebreaker).


with top_recent_reviews as (
	select prod_id,
	rating,
	review_text,
	review_date,
	row_number() over(
	partition by prod_id
	order by rating desc, review_date desc
	) top_reviews
from customers.reviews
	
)

select prod_id,
	rating,
	review_text,
	review_date
from top_recent_reviews
	WHERE  top_reviews =1;
	
-- Q75. BigBasket's promotion team needs to rank promotions by discount_percent 
-- (highest first) and show only the top 5 promotions.



with top_promo as (
	select promo_id,
			discount_percent,
			rank() over(
			order by discount_percent desc		
		)top_promo
	from products.promotions
)

SELECT promo_id,
			discount_percent,
			top_promo
		from top_promo 
	where top_promo <=5;

-- Q76. Myntra's store analytics wants the newest employee (by emp_id as proxy for hire order) 
-- in each store. Partition by store_id and filter for row number 1.

---- Using cte

with emp_order as (
SELECT emp_name,
		emp_id,
		store_id,
		row_number() over(
		partition by store_id
		order by emp_id desc
		) as earliest_emp
	from stores.employees
)

SELECT  emp_name,
		emp_id,
		store_id,
		earliest_emp
	from emp_order
	WHERE earliest_emp =1;

---- Using SubQuery

SELECT emp_name,
		emp_id,
		store_id,													
		earliest_emp
FROM (
	SELECT emp_name,
			emp_id,
			store_id,
			row_number() over (
				PARTITION by store_id
				ORDER by emp_id DESC
			) as earliest_emp
	FROM stores.employees
) as emp_order
WHERE earliest_emp = 1;
		

-- Q77. Amazon India's payment analysis needs to rank payments within each payment_mode 
-- by amount. Show payment_mode, amount, and rank within that payment mode.

with payment_rank as (
	select payment_mode,
		amount,
		rank() over(
		PARTITION by payment_mode
		order by amount desc
		) as payment_rank
	from sales.payments
)

select payment_mode,
		amount,
		payment_rank
	from payment_rank;


-- Q78. Swiggy's customer segmentation needs to assign customers to numbered tiers 
-- within each region based on their loyalty points (highest points = tier 1).

SELECT * from customers.customers
with customer_segmentation as (
	select c.cust_id,
			c.full_name,
			p.total_points,
			rank() over(
			partition by c.region_name
			ORDER by p.total_points DESC
			)as total_pts
	from customers.loyalty_points p
	join customers.customers c
	on p.cust_id = c.cust_id
)

SELECT 
		cust_id,
		full_name,
		total_points,
		total_pts,
		case
			when total_pts >= 2500 then 'Tier 1 Cust'
			when total_pts >= 1000 then 'Tier 2 Cust'
			when total_pts >= 500 then 'Tier 3 Cust'
			else 'Tier 4'
		end as Cust_category
	from customer_segmentation; 

