





- Q51: Count the total number of customers in the customers.customers table.
select * from customers.customers;

SELECT COUNT(*)
FROM customers.customers;

SELECT COUNT(cust_id)
FROM customers.customers;


-- Q52: Find the total number of products in products.products table.

SELECT count(*)
from products.products;

-- Q53: Count how many orders exist in sales.orders table.

SELECT count(orders)
FROM sales.orders;

-- Q54: How many employees work at RetailMart (stores.employees table)?

select * from stores.employees;

select count(emp_id)
FROM stores.employees;

-- Q55: Count the total number of stores in stores.stores table.

SELECT count(store_id)
FROM stores.stores;

-- Q56: Find the total number of suppliers in products.suppliers table.

select * from products.suppliers;

SELECT count(supplier_id)
FROM products.suppliers;


-- Q57: Count how many departments exist in stores.departments.

select * from stores.departments;

SELECT count(dept_id)
FROM   stores.departments;


-- Q58: How many reviews are there in customers.reviews table?

select * from  customers.reviews;

SELECT count(review_id)
FROM    customers.reviews;


-- Q59: Count the total number of campaigns in marketing.campaigns.

-- Q60: Find the total count of shipments in sales.shipments.

-- Q61: Calculate the sum of all order amounts from sales.orders table (total_amount column).

select * from  sales.orders 

SELECT sum(total_amount) as Total_Revenue
FROM sales.orders;

-- Q62: Find the total of all salaries in stores.employees table.

select * from stores.employees

SELECT sum(salary) as Total_Salary
from stores.employees;

-- Q63: What is the sum of all stock quantities in products.inventory (stock_qty column)?

SELECT sum(stock_qty) as Total_qty
from  products.inventory;

-- Q64: Calculate the total refund amount from sales.returns (refund_amount column).

SELECT sum(refund_amount) as Total_refund
from sales.returns;


-- Q65: Find the sum of all loyalty points from customers.loyalty_points (total_points column).

SELECT sum(total_points)
from customers.loyalty_points;

-- Q66: Calculate the total budget from marketing.campaigns (budget column).

SELECT sum(budget)
from marketing.campaigns;

-- Q67: What is the sum of all payment amounts in sales.payments (amount column)?

SELECT sum(amount)
from sales.payments;

-- Q68: Find the total expense amount from finance.expenses (amount column).

SELECT sum(amount)
from finance.expenses;


-- Q69: Calculate the sum of all quantities from sales.order_items (quantity column).


SELECT sum(quantity)
from sales.order_items;

-- Q70: What is the total amount spent in marketing.ads_spend (amount column)?

SELECT sum(amount)
from marketing.ads_spend;