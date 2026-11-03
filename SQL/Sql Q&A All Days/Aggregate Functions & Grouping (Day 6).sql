
select count(*) as total_orders
from
	sales.orders;

select count(*)
from
     sales.orders
where 
	order_status = 'Delivered';

select * from customers.customers

select count(distinct city)
from customers.customers

select count(*),
count(distinct state),
count(distinct city)
from customers.customers;

SELECT
	SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM
	SALES.ORDERS
SELECT
	SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM
	SALES.ORDERS
WHERE
	ORDER_STATUS IN ('Pending', 'Processing', 'Shipped');

select
	sum(amount) as total_collected
from
	sales.payments
select
	sum(refund_amount)
from
	sales.returns


select
	sum(total_amount) as premium_ordeer_revenue,
	count(*) as premier_order_count
from
	sales.orders
where
	total_amount > 5000


select 
	round(avg(salary),2)
from
	stores.employees
	
select
	round(avg(rating),2)
from
	customers.reviews;

