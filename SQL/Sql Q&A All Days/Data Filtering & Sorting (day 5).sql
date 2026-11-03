


SELECT
	*
FROM
	CUSTOMERS.CUSTOMERS
WHERE
	STATE = 'Delhi'
	and join_date >= '2024-01-01';



SELECT
	*
FROM
	SALES.ORDERS
WHERE
	ORDER_STATUS = 'Shipped'
	AND ORDER_DATE < '2025-01-07';

SELECT DISTINCT
	ORDER_STATUS
FROM
	SALES.ORDERS;


SELECT
	*
FROM
	STORES.EMPLOYEES
WHERE
	SALARY < 30000
	OR SALARY > 80000;

	
SELECT
	*
FROM
	SALES.ORDERS
WHERE
	TOTAL_AMOUNT > 10000
	and order_status = 'Pending' or order_status = 'Shipped' or order_status = 'Processing'

SELECT
	*
FROM
	PRODUCTS.PRODUCTS
WHERE
	CATEGORY = 'Electronics' 
	
SELECT
	DISTINCT STORE_ID
FROM
	PRODUCTS.INVENTORY
WHERE
	PROD_ID > 100 or PROD_ID < 221


SELECT
	*
FROM
	PRODUCTS.PRODUCTS
WHERE
	PROD_NAME LIKE '%phone%';


SELECT
	*
FROM
	CUSTOMERS.CUSTOMERS
WHERE
	FULL_NAME LIKE 'S____ %'


SELECT
	*
FROM
	SALES.ORDERS
WHERE
	ORDER_DATE >= '2024-10-01'
	AND ORDER_DATE <= '2024-12-31'

	
SELECT
	*
FROM
	SALES.ORDERS
WHERE
	ORDER_DATE BETWEEN '2024-10-01' AND '2024-12-31'


select * from sales.orders where (store_id= 1 or store_id= 3 or store_id=5 or store_id= 7)
	and (total_amount >= 5000 and total_amount <=50000)
	and (not order_status = 'Cancelled')
    and (not order_status = 'Returned')


select * from sales.orders where store_id in (1,3,5,7)
	and total_amount between 5000 and 50000
	and order_status not in ('Cancelled','Returned')
  

select distinct city,state,gender from customers.customers

select 
	distinct on(city,state,gender)
	city,state,gender
from
	customers.customers


select 
	distinct state,city
from
	customers.customers
order by
	state,city
limit 
1
offset 6










--Exercise 1 (Basic Filtering)
--Find all customers from Karnataka state who are female (gender = 'F').
--Exercise 2 (Range Query)
--Find all poducts priced betweren ₹1,000 and ₹5,000.
--Exercise 3 (Pattern Matching)
--Find all products where the product name starts with 'Samsung'.
--Exercise 4 (NULL Handling)
--Find all shipments that have been shipped but not yet delivered.
--o Exercise 5 (Pagination)
--Show page 2 of orders (15 orders per page), sorted by total amount descending.



--Exercise 1 (Basic Filtering)
--Find all customers from Karnataka state who are female (gender = 'F'). 
select * from customers.addresses
select * from customers.customers

SELECT *
FROM customers.customers
WHERE gender = 'F'
  AND state = 'Karnataka';



--Exercise 2 (Range Query)
--Find all poducts priced betweren ₹1,000 and ₹5,000.
select * from products.products

 select * from products.products
 where price between 1000 and 5000;

 
--Exercise 3 (Pattern Matching)
--Find all products where the product name starts with 'Samsung'.

 select * from products.products
 where prod_name ilike 'samsung%';


--Exercise 4 (NULL Handling)
--Find all shipments that have been shipped but not yet delivered.

select * from sales.orders

SELECT *
FROM sales.orders
WHERE order_status = 'Shipped';

--Exercise 5 (Pagination)
--Show page 2 of orders (15 orders per page), sorted by total amount descending.

select * from sales.orders
SELECT *
FROM sales.orders
ORDER BY total_amount DESC
LIMIT 15 OFFSET 15;




   🔍 SECTION B: COMPLEX FILTERING (50)
   ------------------------------------------------------------ */



/* Q14. Retrieve all customers where (city = 'Delhi' OR city = 'Mumbai') AND gender = 'F'. */
/* Q15. Retrieve all customers where (email IS NULL OR email NOT LIKE '%@%') AND city IS NOT NULL. */



select * from products.products

/* Q11. Retrieve all products where (price > 1000 AND category = 'Electronics') OR (price < 200 AND category = 'Stationery'). */

select * from products.products
where (price > 1000 and category = 'Electronics') or (price > 200 and category = 'Stationery');


/* Q12. Retrieve all products where category IN ('Electronics','Furniture') AND (price BETWEEN 500 AND 1500 OR price IS NULL). */


SELECT *
FROM products.products
WHERE category IN ('Electronics', 'Furniture')
  AND (price BETWEEN 500 AND 1500 OR price IS NULL);


/* Q13. Retrieve all products where (category = 'Clothing' OR category = 'Footwear') AND price < 2000. */


SELECT * FROM 
	products.products
where category IN ('Fashion', 'Footwear') AND price < 2000;
	


