-- =====================
-- PRACTICAL QUESTIONS (Q51-Q100)
-- =====================

-- Q51. Flipkart's HR team wants to identify employees whose salary is higher than the average salary of their own department. The comparison should be specific to each employee's department. Show employee name, salary, and department.

-- Q52. BigBasket's inventory manager needs to find products that are priced higher than the average price of products in the same category. Display product name, price, and category.

-- Q53. Zomato's analytics team wants to list customers who have placed more orders than the average number of orders placed by customers in their same city. Show customer name and city.

-- Q54. Amazon India's sales team needs products whose price is greater than ANY product supplied by supplier_id = 1. Display product name and price.

-- Q55. Paytm's finance team wants to find stores where total expenses exceed ALL stores in the 'South' region. Show store name and city.

-- Q56. Myntra's management wants a simple list of all product categories and their total revenue. Create this using a CTE named 'category_revenue' and then select from it.

-- Q57. Reliance Retail's analyst needs to build a report showing top 5 customers by total purchase amount. First, calculate customer totals in a CTE, then select the top 5.

-- Q58. Swiggy's data team wants to use a CTE to first calculate monthly order counts, then find months where orders exceeded 1000.

-- Q59. IRCTC's HR department maintains a simple employee hierarchy. Using a recursive CTE, show all employees along with their level in the organization (assuming top managers have NULL manager reference in dept_id).

-- Q60. Ola's reporting needs to identify employees who have not taken any leave (no record in attendance with status 'Leave'). Use a correlated subquery with NOT EXISTS.

-- Q61. PhonePe's campaign team wants products that have never been returned. Use EXISTS or NOT EXISTS to find these reliable products.

-- Q62. Flipkart's analyst needs to find stores that have at least one employee earning more than ₹80,000. Use EXISTS with a correlated subquery.

-- Q63. BigBasket's pricing team wants products priced higher than ALL products in the 'Snacks' category. Show product name, category, and price.

-- Q64. Zomato's team needs customers whose total order amount is greater than SOME customer from Mumbai. Display customer name and their total amount.

-- Q65. Amazon India's inventory team wants to list stores where stock quantity for any product is below the average stock quantity for that same product across all stores. Use a correlated subquery.

-- Q66. Paytm's HR wants to find departments where every employee has a salary above ₹40,000. Use ALL operator in your approach.

-- Q67. Myntra needs a report using two CTEs: first CTE calculates total sales per store, second CTE calculates average of those store totals. Then show stores above this average.

-- Q68. Reliance Retail wants to identify products that exist in inventory but have never been ordered. Use a CTE for products in inventory and then check against order_items.

-- Q69. Swiggy's finance team needs stores where expenses are higher than the average expenses of stores in the same region. Show store name, region, and total expenses.

-- Q70. IRCTC's analyst wants to find orders where the total amount is higher than the average order amount for that specific customer. Use a correlated subquery.

-- Q71. Ola's sales head wants to see each store alongside the count of products that are overstocked (stock > 100) in that store. Use a correlated subquery in SELECT.

-- Q72. PhonePe's team needs to find campaigns where ad spend on any channel exceeds ₹50,000. Use EXISTS with a correlated subquery.

-- Q73. Flipkart's category manager wants categories where at least one product is priced above ₹10,000. Use ANY or EXISTS appropriately.

-- Q74. BigBasket's analyst needs to list all customers along with their most recent order date. Use a correlated subquery to find the max order date for each customer.

-- Q75. Zomato's team wants orders placed by customers who have given at least one 5-star review. Use EXISTS to correlate reviews with customers.

-- Q76. Amazon India needs a CTE that lists all departments with their employee count, then selects only departments with more than 5 employees.

-- Q77. Paytm's reporting team wants to create a summary CTE with total payments by payment mode, then find modes that collected more than ₹1,00,000.

-- Q78. Myntra's warehouse team needs to find products where the current stock is less than the total quantity ever ordered for that product. Compare inventory vs order_items using correlated subquery.

-- Q79. Reliance Retail's HR wants employees whose salary is not less than ALL employees in their same role. Show employee name, role, and salary.

-- Q80. Swiggy's analyst needs to identify stores that have never recorded an expense in the 'Marketing' category. Use NOT EXISTS.

-- Q81. IRCTC's team wants to list each product along with the number of distinct stores it's available in. Use a correlated subquery in SELECT.

-- Q82. Ola's manager needs customers who have placed orders worth more than ANY order from the 'Electronics' category. 

-- Q83. PhonePe wants to find suppliers whose products have an average price higher than the overall average product price. Use a CTE for the overall average.

-- Q84. Flipkart's returns team needs products that have been returned more times than the average return count per product. First calculate average in a CTE.

-- Q85. BigBasket's analyst wants to show each region along with its best-performing store (highest total sales). Use a correlated subquery.

-- Q86. Zomato's campaign analyst needs campaigns where all ad channels have achieved at least 100 conversions. Use ALL operator.

-- Q87. Amazon India's team wants a two-CTE query: CTE1 finds customers with more than 5 orders, CTE2 finds their total spending. Combine to show loyal high-spenders.

-- Q88. Paytm's HR needs to identify employees who earn more than at least one employee in a higher-paying role. Use ANY with a salary comparison.

-- Q89. Myntra's inventory team wants stores where every product in inventory has stock greater than 0 (no zero-stock items). Use ALL operator.

-- Q90. Reliance Retail's analyst needs to find products that are available in ALL stores. Use NOT EXISTS to check for missing combinations.

-- Q91. Swiggy's marketing team wants to list each campaign with its ROI (total conversions / budget). Define the calculation in a CTE first.

-- Q92. IRCTC's analyst needs customers whose average order value is higher than their city's average order value. Use correlated subquery.

-- Q93. Ola's finance team wants to find months where total revenue exceeded total expenses. Use two CTEs, one for revenue and one for expenses.

-- Q94. PhonePe's team needs to list products along with the supplier name, but only for products priced higher than the average price of that supplier's products. Use correlated subquery.

-- Q95. Flipkart's team wants to identify customers who have purchased products from every category. Use NOT EXISTS with a double negative approach.

-- Q96. BigBasket's manager needs stores that have recorded expenses on all expense types that exist in the system. Use correlated subquery with NOT EXISTS.

-- Q97. Zomato's analyst wants to find the top 3 most expensive products in each category. Use a CTE to rank and then filter.

-- Q98. Amazon India needs to show each employee alongside the count of other employees who earn more than them in the same store. Use correlated subquery.

-- Q99. Paytm's team wants to list products that have been ordered in every month of 2024 (Jan-Dec). Use a correlated approach to check presence in each month.

-- Q100. Myntra's reporting team wants a comprehensive summary: a CTE for total sales, a CTE for total returns, and a final query showing the net sales figure and return rate percentage.

-- ============================================
-- END OF DAY 12 EASY QUESTIONS
-- ============================================




-- Q51. Retailmart's HR team wants to identify employees whose salary is higher than the average salary of their own department. The comparison should be specific to each employee's department. Show employee name, salary, and department.

select e.emp_name,
		e.dept_id,
		e.salary

from stores.employees e
join (
	select dept_id, avg(salary) as avg_dept_salary
	from stores.employees
	group by dept_id
	)d
on e.dept_id = d.dept_id
where e.salary > d.avg_dept_salary;

-- Q52. Retailmart's inventory manager needs to find products that are priced higher than the average price of products in the same category. Display product name, price, and category.

select * from products.products


select 
	p.prod_name,
	p.price,
	p.category
from products.products p
join (
	select 
		category, avg(price) as avg_category_price
		from products.products
		group by category
	) c
on p.category = c.category
where p.price > c.avg_category_price


-- Q53. Zomato's analytics team wants to list customers who have placed more orders than the average number of orders placed by customers in their same city. Show customer name and city.

select c.full_name,
		c.city,
		count(o.order_id) as total_orders
FROM customers.customers c 
left join sales.orders o 
	on c.cust_id = o.cust_id
GROUP by c.cust_id, c.full_name, c.city
having count(o.order_id) > (
	select	avg(order_count)

	from (
		select count(o2.order_id) as order_count
		from customers.customers c2
		LEFT join sales.orders o2 
		on c2.cust_id = o2.cust_id
		WHERE c2.city = c.city
		group by c2.cust_id
	) as city_orders
)
	

-- Q54. Amazon India's sales team needs products whose price is greater than ANY product supplied by supplier_id = 1. Display product name and price.

SELECT prod_name,
		price
from products.products
where price > any (
	select price
	from products.products
	where supplier_id = 1
);


-- Q55. Paytm's finance team wants to find stores where total expenses exceed ALL stores in the 'South' region. Show store name and city.
SELECT * from stores.stores

SELECT s.store_name,
		s.city
	from finance.expenses e
join stores.stores s
on s.store_id = e.store_id
GROUP by store_name,city
HAVING sum(e.amount) > all (
	SELECT sum(e.amount)
	from finance.expenses e 
	JOIN stores.stores s 
	on s.store_id = e.store_id
	WHERE s.region = 'South'
	GROUP by store_name
);

		
-- Q56. Myntra's management wants a simple list of all product categories and their total revenue. Create this using a CTE named 'category_revenue' and then select from it.

with category_revenue as (
	select p.category,
	sum(oi.quantity * oi.unit_price) as total_revenue
	FROM products.products p
	join sales.order_items oi 
	on p.prod_id = oi.prod_id
	GROUP by p.category
)
SELECT *
FROM category_revenue;

-- Q57. Reliance Retail's analyst needs to build a report showing top 5 customers by total purchase amount. First, calculate customer totals in a CTE, then select the top 5.

SELECT * from sales.orders
with top_5_cust as (
	select c.cust_id,c.full_name,
	sum(o.total_amount) as total_purchase
	from customers.customers c
	JOIN sales.orders o
	on c.cust_id = o.cust_id
	GROUP by c.full_name,c.cust_id
)

SELECT *
FROM top_5_cust
ORDER by total_purchase desc
limit 5;

-- Q58. Swiggy's data team wants to use a CTE to first calculate monthly order counts, then find months where orders exceeded 1000.

with monthly_orders as (
	select extract(month from order_date) as month,
			extract(year from order_date) as year,
			count(order_id) as order_count
	from sales.orders
	GROUP by month,year
)
SELECT month,year
from monthly_orders
where order_count > 1000;

-- Q59. IRCTC's HR department maintains a simple employee hierarchy. Using a recursive CTE, show all employees along with their level in the organization (assuming top managers have NULL manager reference in dept_id).



-- Q60. Ola's reporting needs to identify employees who have not taken any leave (no record in attendance with status 'Leave'). Use a correlated subquery with NOT EXISTS.

SELECT * from hr.attendance
select e.emp_name,e.emp_id
from stores.employees e
where  not exists (
	select 1
	from hr.attendance a
	where status = 'Leave'
	and e.emp_id = a.emp_id
)
		

-- Q61. PhonePe's campaign team wants products that have never been returned. Use EXISTS or NOT EXISTS to find these reliable products.

select p.prod_name
from products.products p
where not exists (
	select 1
	from sales.returns r
	where p.prod_id = r.prod_id
)

-- Q62. Flipkart's analyst needs to find stores that have at least one employee earning more than ₹80,000. Use EXISTS with a correlated subquery.

select * from stores.employees

select s.store_id,s.store_name
from stores.stores s
where exists (
	select 1
	from stores.employees e2
	where e2.salary > 80000
	and e2.store_id = s.store_id
)

-- Q63. BigBasket's pricing team wants products priced higher than ALL products in the 'Snacks' category. Show product name, category, and price.

select p.prod_name,
		p.category,
		p.price
from products.products p
where p.price > all (

	select p2.price 
	from products.products p2
	where p2.category = 'Snacks'
	
)

-- Q64. Zomato's team needs customers whose total order amount is greater than SOME customer from Mumbai. Display customer name and their total amount.

select c.full_name,
	sum(o.totl_amount) as total_amount
from customers.customers c
join o.total_amount o
	on c.cust_id = o.cust_id
having total_amount > (
	select ABORT
)


-- -- Q65. Amazon India's inventory team wants to list stores where stock quantity for any product is below the average stock quantity for that same product across all stores. Use a correlated subquery.

SELECT i.store_id
FROM products.inventory i
WHERE i.stock_qty < (
    SELECT AVG(i2.stock_qty)
    FROM products.inventory i2
    WHERE i2.prod_id = i.prod_id  
)

select i.store_id
from products.inventory i
where i.stock_qty < (
	SELECT avg(i2.stock_qty)
	from products.inventory i2
	where i2.prod_id = i.prod_id
)


-- Q66. Paytm's HR wants to find departments where every employee has a salary above ₹15,000. Use ALL operator in your approach.



select distinct e1.dept_id
from stores.employees e1
where 15000 < all (
	SELECT e2.salary
	FROM stores.employees e2
	where e2.dept_id = e1.dept_id
	
)

-- Q67. Myntra needs a report using two CTEs: first CTE calculates total sales per store, second CTE calculates average of those store totals. Then show stores above this average.


with ttl_sale_per_store as (
select store_id,
	sum(total_amount) as ttl_amt
from sales.orders 
group by store_id
),

avg_sale as (
	select avg(ttl_amt) as avg_amt
from ttl_sale_per_store
)

select store_id, ttl_amt
from ttl_sale_per_store
where ttl_amt > (
 select avg_amt
 from avg_sale
);

-- Q68. Reliance Retail wants to identify products that exist in inventory but have never been ordered. Use a CTE for products in inventory and then check against order_items.

with existence as (
select distinct prod_id
from products.inventory
)

SELECT prod_id
from existence
where prod_id not in (
	select distinct prod_id 
	from sales.order_items
);


-- Q69. Swiggy's finance team needs stores where expenses are higher than the average expenses of stores in the same region. Show store name, region, and total expenses.
-- Q69. Swiggy's finance team needs stores where expenses are higher than the average expenses of stores in the same region. Show store name, region, and total expenses.


WITH store_expenses AS (
    SELECT s.store_id,
           s.store_name,
           s.region,
           SUM(e.amount) AS total_expenses
    FROM finance.expenses e
    JOIN stores.stores s ON e.store_id = s.store_id
    GROUP BY s.store_id, s.store_name, s.region
),
region_avg AS (
    SELECT region,
           AVG(total_expenses) AS avg_expense
    FROM store_expenses
    GROUP BY region
)
SELECT se.store_name,
       se.region,
       se.total_expenses
FROM store_expenses se
JOIN region_avg ra ON se.region = ra.region
WHERE se.total_expenses > ra.avg_expense;


-- Q70. IRCTC's analyst wants to find orders where the total amount is higher than the average order amount for that specific customer. Use a correlated subquery.
SELECT o.order_id, o.cust_id, o.total_amount
FROM sales.orders o
WHERE o.total_amount > (
    SELECT AVG(o1.total_amount)
    FROM sales.orders o1
    WHERE o1.cust_id = o.cust_id
);

-- Q71. Ola's sales head wants to see each store alongside the count of products that are overstocked (stock > 100) in that store. Use a correlated subquery in SELECT.
SELECT s.store_id, s.store_name,
       (
           SELECT COUNT(*)
           FROM products.inventory i
           WHERE i.store_id = s.store_id
           AND i.stock_qty > 100
       ) AS overstock_count
FROM stores.stores s;

-- Q72. PhonePe's team needs to find campaigns where ad spend on any channel exceeds ₹50,000. Use EXISTS with a correlated subquery.
SELECT c.campaign_id, c.campaign_name
FROM marketing.campaigns c
WHERE EXISTS (
    SELECT 1
    FROM marketing.ads_spend a
    WHERE a.campaign_id = c.campaign_id
    AND a.amount > 50000
);

-- Q73. Flipkart's category manager wants categories where at least one product is priced above ₹10,000. Use ANY or EXISTS appropriately.
SELECT DISTINCT p.category
FROM products.products p
WHERE EXISTS (
    SELECT 1
    FROM products.products p1
    WHERE p1.category = p.category
    AND p1.price > 10000
);

-- Q74. BigBasket's analyst needs to list all customers along with their most recent order date. Use a correlated subquery to find the max order date for each customer.
SELECT c.full_name,
       (
           SELECT MAX(o.order_date)
           FROM sales.orders o
           WHERE o.cust_id = c.cust_id
       ) AS recent_order_date
FROM customers.customers c;

-- Q75. Zomato's team wants orders placed by customers who have given at least one 5-star review. Use EXISTS to correlate reviews with customers.
SELECT o.order_id, o.cust_id
FROM sales.orders o
WHERE EXISTS (
    SELECT 1
    FROM customers.reviews r
    WHERE r.cust_id = o.cust_id
    AND r.rating = 5
);

-- Q76. Amazon India needs a CTE that lists all departments with their employee count, then selects only departments with more than 5 employees.
WITH top_depts AS (
    SELECT e.dept_id,
           COUNT(emp_id) AS total_emps
    FROM stores.employees e
    GROUP BY e.dept_id
)
SELECT dept_id, total_emps
FROM top_depts
WHERE total_emps > 5;

-- Q77. Paytm's reporting team wants to create a summary CTE with total payments by payment mode, then find modes that collected more than ₹1,00,000.
WITH top_modes AS (
    SELECT p.payment_mode,
           SUM(amount) AS total_amt
    FROM sales.payments p
    GROUP BY p.payment_mode
)
SELECT payment_mode, total_amt
FROM top_modes
WHERE total_amt > 100000;

-- Q78. Myntra's warehouse team needs to find products where the current stock is less than the total quantity ever ordered for that product. Compare inventory vs order_items using correlated subquery.
SELECT i.prod_id, i.stock_qty
FROM products.inventory i
WHERE i.stock_qty < (
    SELECT SUM(o.quantity)
    FROM sales.order_items o
    WHERE o.prod_id = i.prod_id
);


select e.emp_name,
		e.role,
		salary
from stores.employees e
where e.salary >= all (
		select e1.salary
		from stores.employees e1
		where e.role = e1.role
)
		
-- Q80. Swiggy's analyst needs to identify stores that have never recorded an expense in the 'Marketing' category. Use NOT EXISTS.

select s.store_id,
		s.store_name
from stores.stores s
where not exists (
		SELECT 1
		from finance.expenses e
		where s.store_id = e.store_id
		and e.category = 'Marketing'
);