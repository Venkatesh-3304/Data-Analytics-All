-- Q1: Join customers and orders to show customer names with their order IDs from customers.customers and sales.orders.

-- Q2: Display product names with their supplier names using INNER JOIN from products.products and products.suppliers.

-- Q3: Show employee names with their department names from stores.employees and stores.departments.

-- Q4: List all orders with their store names from sales.orders and stores.stores.

-- Q5: Display customer names with their review ratings from customers.customers and customers.reviews.

-- Q6: Show order items with product names from sales.order_items and products.products.

-- Q7: List employees with their store locations (city, state) from stores.employees and stores.stores.

-- Q8: Display orders with customer city information from sales.orders and customers.customers.

-- Q9: Show products with their category names from products.products and core.dim_category.

-- Q10: List campaigns with their total ad spend from marketing.campaigns and marketing.ads_spend.

-- Q11: Use LEFT JOIN to show all customers and their orders (including customers with no orders) from customers.customers and sales.orders.

-- Q12: Display all products and their reviews (including products with no reviews) from products.products and customers.reviews.

-- Q13: Show all stores and their employees (including stores with no employees) from stores.stores and stores.employees.

-- Q14: List all customers and their loyalty points (including customers with no loyalty points) from customers.customers and customers.loyalty_points.

-- Q15: Display all orders and their payments (including orders with no payments) from sales.orders and sales.payments.

-- Q16: Show all products and their inventory status (including products not in inventory) from products.products and products.inventory.

-- Q17: List all campaigns and their email clicks (including campaigns with no clicks) from marketing.campaigns and marketing.email_clicks.

-- Q18: Display all orders and their shipment details (including orders not yet shipped) from sales.orders and sales.shipments.

-- Q19: Show all suppliers and their products (including suppliers with no products) from products.suppliers and products.products.

-- Q20: List all customers and their addresses (including customers with no addresses) from customers.customers and customers.addresses.

-- Q21: Use RIGHT JOIN to show all orders and customer details (including orders without customer info) from customers.customers and sales.orders.

-- Q22: Display all reviews with customer names (including orphaned reviews) from customers.customers and customers.reviews.

-- Q23: Show all departments with employee count (including empty departments) from stores.departments and stores.employees.

-- Q24: List all products with order quantities (including unordered products) from products.products and sales.order_items.

-- Q25: Display all stores with their total expenses (including stores with no expense records) from stores.stores and stores.expenses.

-- Q26: Use FULL JOIN to show all customers and orders (including unmatched records) from customers.customers and sales.orders.

-- Q27: Display all products and inventory (showing both unordered products and orphaned inventory) from products.products and products.inventory.

-- Q28: Show all employees and attendance records (including employees with no attendance and attendance without employees) from stores.employees and hr.attendance.

-- Q29: List all campaigns and ads spend (including campaigns with no spend and spend without campaigns) from marketing.campaigns and marketing.ads_spend.

-- Q30: Display all orders and returns (including non-returned orders and returns without orders) from sales.orders and sales.returns.

-- Q31: Join three tables: customers, orders, and order_items to show customer names with product quantities from customers.customers, sales.orders, and sales.order_items.

-- Q32: Display employee names, department names, and store names from stores.employees, stores.departments, and stores.stores.

-- Q33: Show product names, category names, and brand names from products.products, core.dim_category, and core.dim_brand.

-- Q34: List customer names, order dates, and payment modes from customers.customers, sales.orders, and sales.payments.

-- Q35: Display order IDs, product names, and shipment status from sales.orders, sales.order_items, products.products, and sales.shipments.

-- Q36: Join customers, orders, and stores to show customer names with store locations from customers.customers, sales.orders, and stores.stores.

-- Q37: Show campaign names, channels, and customer emails from marketing.campaigns, marketing.ads_spend, and marketing.email_clicks.

-- Q38: Display product names, supplier names, and inventory quantities from products.products, products.suppliers, and products.inventory.

-- Q39: List employee names, departments, and their store's total sales from stores.employees, stores.departments, and sales.orders.

-- Q40: Show customer names, review ratings, and product names from customers.customers, customers.reviews, and products.products.

-- Q41: Count how many orders each customer has placed using JOIN and GROUP BY from customers.customers and sales.orders.

-- Q42: Calculate total sales amount for each store using JOIN from sales.orders and stores.stores.

-- Q43: Find average product price by category using JOIN from products.products and core.dim_category.

-- Q44: Count reviews per product using JOIN from products.products and customers.reviews.

-- Q45: Calculate total quantity sold per supplier using JOIN from products.suppliers, products.products, and sales.order_items.

-- Q46: Find total expenses by store using JOIN from stores.stores and stores.expenses.

-- Q47: Count employees per department using JOIN from stores.departments and stores.employees.

-- Q48: Calculate average order value per customer using JOIN from customers.customers and sales.orders.

-- Q49: Find total loyalty points by customer region using JOIN from customers.customers and customers.loyalty_points.

-- Q50: Calculate total campaign clicks by channel using JOIN from marketing.campaigns and marketing.ads_spend.


\




-- Q1: Join customers and orders to show customer names with their order IDs from customers.customers and sales.orders.

SELECT
    c.full_name,
    o.order_id
FROM customers.customers c
JOIN sales.orders o
    ON c.cust_id = o.cust_id;

-- Q2: Display product names with their supplier names using INNER JOIN from products.products and products.suppliers.

SELECT
	p.prod_name,
	s.supplier_name
FROM products.products p
INNER join	products.suppliers s
	on p.supplier_id = s.supplier_id;

SELECT * from products.products
SELECT * from products.suppliers

-- Q3: Show employee names with their department names from stores.employees and stores.departments
SELECT * from stores.employees
SELECT * from stores.departments
select 
	e.emp_name,
	d.dept_name
FROM stores.employees e
join stores.departments d
	on e.dept_id = d.dept_id;
	
-- Q4: List all orders with their store names from sales.orders and stores.stores.
SELECT * from stores.stores
SELECT * from sales.orders
select 
	o.order_id,
	s.store_name
FROM sales.orders o
JOIN stores.stores s
	ON o.store_id = s.store_id
	
-- Q5: Display customer names with their review ratings from customers.customers and customers.reviews.

SELECT 
	c.full_name,
	r.rating
from customers.customers c
join customers.reviews r
	on c.cust_id = r.cust_id 

-- Q6: Show order items with product names from sales.order_items and products.products.
SELECT * from sales.order_items
SELECT * from products.products

SELECT
    i.order_item_id,
    p.prod_name
FROM sales.order_items i
JOIN products.products p
    ON i.prod_id = p.prod_id;

-- Q7: List employees with their store locations (city, state) from stores.employees and stores.stores.

SELECT * FROM stores.employees
SELECT * FROM stores.stores

SELECT e.emp_name,
		s.city,
		s.state
FROM stores.employees e
join stores.stores s
	on e.store_id = s.store_id;

-- Q8: Display orders with customer city information from sales.orders and customers.customers.

SELECT * FROM sales.orders 
SELECT * FROM customers.customers

SELECT s.order_id,
		c.city
FROM sales.orders s
JOIN customers.customers c
	on s.cust_id = c.cust_id;
	
-- Q9: Show products with their category names from products.products and core.dim_category.
SELECT * FROM products.products 
SELECT * FROM core.dim_category

SELECT p.prod_name,
		c.category_name
FROM products.products p
JOIN core.dim_category c
	on p.category = c.category_name

-- Q10: List campaigns with their total ad spend from marketing.campaigns and marketing.ads_spend.
SELECT * FROM marketing.campaigns 
SELECT * FROM marketing.ads_spend

-- Q10: List campaigns with their total ad spend

SELECT
	c.campaign_name,
	sum(a.amount) as total_ad_spend
FROM marketing.campaigns c
JOIN marketing.ads_spend a
	on c.campaign_id = a.campaign_id
GROUP by c.campaign_name;
	
		
-- Q11: Use LEFT JOIN to show all customers and their orders (including customers with no orders) from customers.customers and sales.orders.

select c.cust_id,
		c.full_name,
		o.order_id
FROM customers.customers c
LEFT join sales.orders o
	on c.cust_id = o.cust_id;

-- Q12: Display all products and their reviews (including products with no reviews) from products.products and customers.reviews.
SELECT * FROM products.products 
SELECT * FROM customers.reviews

SELECT p.prod_id,
		p.prod_name,
		c.review_text
FROM products.products p
left JOIN customers.reviews c
	on p.prod_id = c.prod_id


-- Q13: Show all stores and their employees (including stores with no employees) from stores.stores and stores.employees.
--SELECT * FROM stores.stores
--SELECT * FROM stores.employees

SELECT s.store_id,
		s.store_name,
		e.emp_name
from stores.stores s
join stores.employees e
	on s.store_id = e.store_id
	
-- Q14: List all customers and their loyalty points (including customers with no loyalty points) from customers.customers and customers.loyalty_points.
--SELECT * FROM customers.customers
--SELECT * FROM customers.loyalty_points
SELECT c.cust_id,
		c.full_name,
		l.total_points
from customers.customers c
LEFT join customers.loyalty_points l
	on c.cust_id = l.cust_id


-- Q15: Display all orders and their payments (including orders with no payments) from sales.orders and sales.payments.
--SELECT * FROM sales.orders
--SELECT * FROM sales.payments

SELECT o.order_id,
		
		p.amount
from sales.orders o
LEFT join sales.payments p
	on o.order_id = p.order_id;


-- Q16: Show all products and their inventory status (including products not in inventory) from products.products and products.inventory.

--SELECT * FROM products.products
--SELECT * FROM products.inventory

SELECT p.prod_id,
		p.prod_name,
		case
			when i.stock_qty IS null then 'Not in Inventory'
			when i.stock_qty = 0 then 'Out of Stock'
			else 'in stock'
	end as inventory_status
from products.products p
LEFT join products.inventory i
	on p.prod_id = i.prod_id;


-- Q17: List all campaigns and their email clicks (including campaigns with no clicks) from marketing.campaigns and marketing.email_clicks.

--SELECT * FROM marketing.campaigns
--SELECT * from  marketing.email_clicks

SELECT c.campaign_id,
	e.email_id,
	e.clicked

from marketing.campaigns  c
LEFT join marketing.email_clicks e
	on c.campaign_id = e.campaign_id;


-- Q18: Display all orders and their shipment details (including orders not yet shipped) from sales.orders and sales.shipments.

select * from sales.orders;

select * from sales.shipments

select o.order_id,
		s.status
from sales.orders o
left JOIN sales.shipments s
on o.order_id = s.order_id;
	

-- Q19: Show all suppliers and their products (including suppliers with no products) from products.suppliers and products.products.

select * from products.products;

select * from products.suppliers;

SELECT 
    s.supplier_name,
    p.prod_name
FROM products.suppliers s
LEFT JOIN products.products p
ON s.supplier_id = p.supplier_id;


-- Q20: List all customers and their addresses (including customers with no addresses) from customers.customers and customers.addresses.

select * from customers.customers;
select * from customers.addresses;

SELECT c.full_name,a.street,a.city,a.state
FROM customers.customers c
LEFT JOIN customers.addresses a
	on c.cust_id = a.cust_id;


-- Q21: Use RIGHT JOIN to show all orders and customer details (including orders without customer info) from customers.customers and sales.orders.

-- Q22: Display all reviews with customer names (including orphaned reviews) from customers.customers and customers.reviews.

-- Q23: Show all departments with employee count (including empty departments) from stores.departments and stores.employees.

-- Q24: List all products with order quantities (including unordered products) from products.products and sales.order_items.

-- Q25: Display all stores with their total expenses (including stores with no expense records) from stores.stores and stores.expenses.

-- Q26: Use FULL JOIN to show all customers and orders (including unmatched records) from customers.customers and sales.orders.
select * from customers.customers;
select * from sales.orders;

SELECT c.full_name,o.order_id
FROM customers.customers c
full JOIN sales.orders a
	on c.cust_id = a.cust_id;



-- Q27: Display all products and inventory (showing both unordered products and orphaned inventory) from products.products and products.inventory.

-- Q28: Show all employees and attendance records (including employees with no attendance and attendance without employees) from stores.employees and hr.attendance.

-- Q29: List all campaigns and ads spend (including campaigns with no spend and spend without campaigns) from marketing.campaigns and marketing.ads_spend.

-- Q30: Display all orders and returns (including non-returned orders and returns without orders) from sales.orders and sales.returns.

-- Q31: Join three tables: customers, orders, and order_items to show customer names with product quantities from customers.customers, sales.orders, and sales.order_items.

SELECT * from customers.customers;
SELECT * from sales.orders;
SELECT * from sales.order_items;

SELECT 
    c.full_name,
    oi.quantity
FROM customers.customers c
JOIN sales.orders o
    ON c.cust_id = o.cust_id
JOIN sales.order_items oi
    ON o.order_id = oi.order_id;

SELECT 
	c.full_name,
	oi.quality
from customers.customers c



--- Q32: Display employee names, department names, and store names from stores.employees, stores.departments, and stores.stores.

SELECT * FROM stores.employees
SELECT * FROM stores.stores

select e.emp_name,
		d.dept_name,
		s.store_name
FROM stores.employees e
JOIN stores.departments d
	on e.dept_id = d.dept_id
join stores.stores s
	on e.store_id = s.store_id;


-- Q33: Show product names, category names, and brand names from products.products, core.dim_category, and core.dim_brand.

SELECT * FROM products.products;
SELECT * FROM core.dim_category;
SELECT * FROM core.dim_brand;

SELECT
    p.prod_name,
    c.category_name,
    b.brand_name
FROM products.products p
JOIN core.dim_category c
    ON p.category = c.category_name
JOIN core.dim_brand b
    ON p.brand = b.brand_name;


-- Q34: List customer names, order dates, and payment modes from customers.customers, sales.orders, and sales.payments.

SELECT * FROM customers.customers;
SELECT * FROM sales.orders;
SELECT * FROM sales.payments;

SELECT
	c.full_name,
	o.order_date,
	p.payment_mode
FROM customers.customers c
JOIN sales.orders o
	on c.cust_id = o.cust_id
JOIN sales.payments p
	on o.order_id = p.order_id;
	

-- Q35: Display order IDs, product names, and shipment status from sales.orders, sales.order_items, products.products, and sales.shipments.

SELECT * from sales.orders
SELECT * from sales.order_items
SELECT * from sales.shipments
SELECT * FROM products.products;
SELECT
	o.order_id,
	p.prod_name,
	s.status
FROM sales.orders o
JOIN  sales.order_items oi
     ON o.order_id = oi.order_id
JOIN products.products p
	on oi.prod_id = p.prod_id
LEFT JOIN sales.shipments s
    ON o.order_id = s.order_id;

-- Q36: Join customers, orders, and stores to show customer names with store locations from customers.customers, sales.orders, and stores.stores.
select * from customers.customers
select * from sales.orders
select * from stores.stores
select c.full_name,
		s.city,
		s.state
from customers.customers c
join sales.orders o
	on c.cust_id = o.cust_id
JOIN stores.stores s
	on o.store_id = s.store_id;
	
-- Q37: Show campaign names, channels, and customer emails from marketing.campaigns, marketing.ads_spend, and marketing.email_clicks.

select * from marketing.campaigns
select * from  marketing.ads_spend
select * from  marketing.email_clicks
SELECT
    c.campaign_name,
    a.channel,
    e.email_id
FROM marketing.campaigns c
JOIN marketing.ads_spend a
    ON c.campaign_id = a.campaign_id
JOIN marketing.email_clicks e
    ON c.campaign_id = e.campaign_id;
	
-- Q38: Display product names, supplier names, and inventory quantities from products.products, products.suppliers, and products.inventory.



-- Q39: List employee names, departments, and their store's total sales from stores.employees, stores.departments, and sales.orders.

-- Q40: Show customer names, review ratings, and product names from customers.customers, customers.reviews, and products.products.

-- Q41: Count how many orders each customer has placed using JOIN and GROUP BY from customers.customers and sales.orders.
SELECT * from customers.customers
SELECT * FROM sales.orders
SELECT
	C.CUST_ID,
	C.FULL_NAME,
	
	COUNT(O.ORDER_ID) AS TOTAL_ORDERS
FROM
	CUSTOMERS.CUSTOMERS C
	left JOIN SALES.ORDERS O ON O.CUST_ID = C.CUST_ID
GROUP BY
	C.CUST_ID,
	C.FULL_NAME;
	
-- Q42: Calculate total sales amount for each store using JOIN from sales.orders and stores.stores.

SELECT * from stores.stores
SELECT * FROM sales.orders

SELECT s.store_id,
		s.store_name,
		sum(o.total_amount) as Total_Sale_amount
from stores.stores s
left JOIN sales.orders o
	on s.store_id = o.store_id
group by
	s.store_id,
	s.store_name;

-- Q43: Find average product price by category using JOIN from products.products and core.dim_category.



SELECT * from products.products
select * from core.dim_category 

SELECT d.category_id,
		d.category_name,
		round(avg(p.price),2) as avg_product_price
FROM core.dim_category d
left join products.products p
	on d.category_name = p.category
group by
	d.category_id,
		d.category_name;


-- Q44: Count reviews per product using JOIN from products.products and customers.reviews.
SELECT * from products.products
select * from customers.reviews

SELECT
	 P.PROD_ID,
	P.PROD_NAME,
	COUNT(REVIEW_ID) AS TOTAL_REVIEWS_PER_PRODUCT
FROM
	PRODUCTS.PRODUCTS P
left JOIN CUSTOMERS.REVIEWS R ON P.PROD_ID = R.PROD_ID
GROUP BY
	P.PROD_ID,
	P.PROD_NAME;



-- Q45: Calculate total quantity sold per supplier using JOIN from products.suppliers, products.products, and sales.order_items.

SELECT * from products.products
select * from products.suppliers
select * from sales.order_items

select s.supplier_id,
		s.supplier_name,
		sum(o.quantity) as ttl_sold_qty
from products.suppliers s
left join products.products p
	on s.supplier_id = p.supplier_id
left join sales.order_items o
	on p.prod_id = o.prod_id
GROUP by	
	 s.supplier_id,
		s.supplier_name;


-- Q46: Find total expenses by store using JOIN from stores.stores and stores.expenses.

select * From stores.stores
select * from stores.expenses

SELECT s.store_id,
		s.store_name,
		sum(e.amount) as total_expenses
from stores.stores s
left join stores.expenses e
	on s.store_id = e.store_id
GROUP by
	 s.store_id,
		s.store_name;

-- Q47: Count employees per department using JOIN from stores.departments and stores.employees.

select * from  stores.departments
select * from  stores.employees

select d.dept_id,
		d.dept_name,
		coalesce(count(e.emp_id),0) as total_emps_per_dept
FROM stores.departments d
left join stores.employees e
	on d.dept_id = e.dept_id
group by
	d.dept_id,
		d.dept_name;

-- Q48: Calculate average order value per customer using JOIN from customers.customers and sales.orders.

select * from customers.customers
select * from sales.orders

select c.cust_id,
		c.full_name,
		coalesce(round(avg(o.total_amount),2),0) as avg_order_value
FROM customers.customers c
left join sales.orders o
	on c.cust_id = o.cust_id
group by
	c.cust_id,
	c.full_name;


-- Q49: Find total loyalty points by customer region using JOIN from customers.customers and customers.loyalty_points.

select * from  customers.customers
select * from  customers.loyalty_points

select
		c.region_name,
		coalesce(sum(l.total_points),0) as ttl_llt_pts_region
FROM customers.customers c
left join customers.loyalty_points l
	on c.cust_id = l.cust_id
group by

	c.region_name;


-- Q50: Calculate total campaign clicks by channel using JOIN from marketing.campaigns and marketing.ads_spend.

--With Joins
SELECT
    a.channel,
    COALESCE(SUM(a.clicks), 0) AS total_campaign_clicks
FROM marketing.campaigns c
LEFT JOIN marketing.ads_spend a
    ON c.campaign_id = a.campaign_id
GROUP BY
    a.channel;

--we can also solve this problem without joins. 
--Without Joins
SELECT
    channel,
    SUM(clicks) AS total_campaign_clicks
FROM marketing.ads_spend
GROUP BY channel;
