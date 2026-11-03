

                ## Easy Questions ##




-- Q1: Display all customer names with their ages from customers.customers.

-- Q2: Create a derived column showing full address by concatenating city and state from customers.customers.

-- Q3: Calculate the discounted price (price - 10%) for all products from products.products.

-- Q4: Show order_id and calculated total with tax (total_amount * 1.18) from sales.orders.

-- Q5: Create a column showing 'Male' or 'Female' instead of 'M' or 'F' from customers.customers using CASE.

-- Q6: Display product names with 'Expensive' if price > 10000, else 'Affordable' from products.products.

-- Q7: Show employee names with 'High Earner' if salary > 80000, else 'Regular' from stores.employees.

-- Q8: Create age groups: 'Young' (age < 30), 'Middle' (30-50), 'Senior' (>50) from customers.customers.

-- Q9: Categorize orders as 'Small' (< 5000), 'Medium' (5000-20000), 'Large' (>20000) from sales.orders.

-- Q10: Show products with 'Low Stock' if stock_qty < 10, else 'Available' from products.inventory.

-- Q11: Use COALESCE to replace NULL region_name with 'Unknown' from customers.customers.

-- Q12: Use COALESCE to show rating or 0 if rating is NULL from customers.reviews.

-- Q13: Replace NULL discount with 0 from sales.order_items using COALESCE.

-- Q14: Show employee name with department name, or 'No Department' if NULL from stores.employees.

-- Q15: Use COALESCE to show refund_amount or 0 from sales.returns.

-- Q16: Use NULLIF to return NULL if order_status is 'Cancelled' from sales.orders.

-- Q17: Use NULLIF to return NULL when discount is 0 from sales.order_items.

-- Q18: Apply NULLIF to prevent division by zero: show sales per employee from sales.orders and stores.employees.

-- Q19: Use NULLIF to return NULL if stock_qty is 0 from products.inventory.

-- Q20: Show customer name with NULLIF returning NULL if city is 'Unknown' from customers.customers.

-- Q21: Create a column 'order_value_category' showing 'High', 'Medium', 'Low' based on total_amount from sales.orders.

-- Q22: Show product brand with 'Top Brand' or 'Regular Brand' based on price from products.products.

-- Q23: Categorize employees by salary range with CASE WHEN from stores.employees.

-- Q24: Show review sentiment: 'Positive' (rating >= 4), 'Neutral' (3), 'Negative' (<3) from customers.reviews.

-- Q25: Create shipping status: 'Fast' if delivered in 3 days, else 'Standard' from sales.shipments.

-- Q26: Calculate profit margin (unit_price - discount) for each order item from sales.order_items.

-- Q27: Show customer loyalty tier based on total_points from customers.loyalty_points.

-- Q28: Categorize campaigns by budget: 'Premium', 'Standard', 'Basic' from marketing.campaigns.

-- Q29: Show order priority: 'Urgent' if order_date is recent, else 'Normal' from sales.orders.

-- Q30: Create expense category flags from stores.expenses.

-- Q31: Calculate total revenue (quantity * unit_price) for each order item from sales.order_items.

-- Q32: Show net amount after discount (unit_price - discount) * quantity from sales.order_items.

-- Q33: Calculate customer age from join_date (assuming current year 2024) from customers.customers.

-- Q34: Show days since last order for each customer from sales.orders.

-- Q35: Calculate average rating per customer from customers.reviews.

-- Q36: Show salary increment (salary * 1.10) for all employees from stores.employees.

-- Q37: Calculate stock value (stock_qty * price) from products.inventory and products.products.

-- Q38: Show campaign duration in days (end_date - start_date) from marketing.campaigns.

-- Q39: Calculate expense percentage of budget from stores.expenses.

-- Q40: Show order fulfillment time (delivered_date - order_date) from sales.orders and sales.shipments.

-- Q41: Use CASE to show 'Active' if join_date > '2023-01-01', else 'Old' customer from customers.customers.

-- Q42: Categorize stores by region using CASE from stores.stores.

-- Q43: Show payment status based on amount using CASE from sales.payments.

-- Q44: Create product availability status from products.inventory.

-- Q45: Show campaign performance based on clicks from marketing.ads_spend.

-- Q46: Use COALESCE to handle NULL values in review_text from customers.reviews.

-- Q47: Show supplier name or 'Direct' if NULL from products.products.

-- Q48: Use CASE to show quarter from order_date from sales.orders.

-- Q49: Categorize delivery time as 'On-Time' or 'Delayed' from sales.shipments.

-- Q50: Create customer segment based on age and gender from customers.customers.



                     #######   Answers  ####### 



---1: Display all customer names with their ages from customers.customers.

select * FROM customers.customers;

select full_name ,  age FROM customers.customers;


-- Q2: Create a derived column showing full address by concatenating city and state from customers.customers.


SELECT concat(city, ',' ,state) from CUSTOMERS.CUSTOMERS;


-- Q3: Calculate the discounted price (price - 10%) for all products from products.products.

select * FROM products.products;

SELECT prod_name, price, price*0.90 as Diescounted_price
from products.products;


-- Q4: Show order_id and calculated total with tax (total_amount * 1.18) from sales.orders.

SELECT order_id, total_amount * 1.18 as total
from sales.orders;

-- Q5: Create a column showing 'Male' or 'Female' instead of 'M' or 'F' from customers.customers using CASE.

SELECT gender,
	case
		WHEN gender = 'M' then 'male'
		when gender = 'F'  then 'female'
		end AS gender_code
from customers.customers;

-- Q6: Display product names with 'Expensive' if price > 10000, else 'Affordable' from products.products.

select prod_name,price,
	case
		when price > 10000 then 'Expensive'
		ELSE  'Affordable'
		end as "prod_segment"
from products.products;

-- Q7: Show employee names with 'High Earner' if salary > 80000, else 'Regular' from stores.employees.
select * FROM stores.employees;
select emp_name,salary,
	case
		when salary > 80000 then 'High Earner'
		else 'regualr'
		end as "emp_type"
FROM stores.employees;

-- Q8: Create age groups: 'Young' (age < 30), 'Middle' (30-50), 'Senior' (>50) from customers.customers.

select * FROM customers.customers;

SELECT full_name,age,
	case
		when age < 30 then 'Young'
		when age BETWEEN 30 and 50 then 'Middle'
		when age > 50 THEN 'Senior'
		end as "Age_Group"
FROM customers.customers;

-- Q9: Categorize orders as 'Small' (< 5000), 'Medium' (5000-20000), 'Large' (>20000) from sales.orders

select * FROM sales.orders;

select order_id,total_amount,
	case
		when total_amount < 5000 then 'small'
		when total_amount BETWEEN 5000 and 20000 then 'medium'
		when total_amount > 20000 then 'Large'
		end as "Order_Category"
from sales.orders;


.

-- Q10: Show products with 'Low Stock' if stock_qty < 10, else 'Available' from products.inventory.

select * FROM sales.orders;

select stock_qty,
	case
		when stock_qty < 10 then 'Low Stock'
		ELSE 'Avaible'
		end as "qty_avaibility"
	from products.inventory;
	
-- Q11: Use COALESCE to replace NULL region_name with 'Unknown' from customers.customers.

-- Q11: Use COALESCE to replace NULL region_name with 'Unknown' from customers.customers.
SELECT
    cust_id,
    COALESCE(region_name, 'Unknown') AS region_name
FROM customers.customers;


-- Q12: Use COALESCE to show rating or 0 if rating is NULL from customers.reviews.
select * FROM customers.reviews;
SELECT
    review_id,
    COALESCE(rating, 0) AS rating
FROM customers.reviews;

-- Q13: Replace NULL discount with 0 from sales.order_items using COALESCE.
select * FROM sales.order_items;
select 
	order_item_id,
	COALESCE(discount, 0) as discount
from sales.order_items;

-- Q14: Show em ployee name with department name, or 'No Department' if NULL from stores.employees.

select * FROM stores.employees;
select 
SELECT emp_name,
	coalesce(role,'No Department') as dept_name
from stores.employees;


-- Q15: Use COALESCE to show refund_amount or 0 from sales.returns.

select * FROM sales.returns;
select return_id,
	coalesce(refund_amount,0) as refund_amount
	FROM sales.returns

-- Q16: Use NULLIF to return NULL if order_status is 'Cancelled' from sales.orders.

SELECT
    NULLIF(order_status, 'Cancelled') AS order_status
FROM sales.orders;

-- Q17: Use NULLIF to return NULL when discount is 0 from sales.order_items.

SELECT 
	nullif(discount, 0) discount
from sales.order_items;

-- Q18: Apply NULLIF to prevent division by zero: show sales per employee from sales.orders and stores.employees.

SELECT
   round(SUM(o.total_amount) / NULLIF(COUNT(emp_id), 0),2) AS sales_per_employee
FROM sales.orders o
JOIN stores.employees e
    ON emp_id = emp_id;


-- Q19: Use NULLIF to return NULL if stock_qty is 0 from products.inventory.

SELECT
	nullif(stock_qty, 0) stock_qty
from products.inventory;

-- Q20: Show customer name with NULLIF returning NULL if city is 'Unknown' from customers.customers.

SELECT
    full_name,
    NULLIF(LOWER(city), 'unknown') AS city
FROM customers.customers;



##################################Joins	#########################################
 
 

