-- ============================================
-- Day 11: Subqueries Part 1 - MEDIUM Level
-- Student Question Bank (100 Questions)
-- ============================================
-- Concepts Allowed: SELECT, FROM, WHERE, JOINs (all types), 
--   GROUP BY, HAVING, Aggregates, CASE WHEN, COALESCE, NULLIF,
--   Set Operations (UNION, INTERSECT, EXCEPT), Self Join, Cross Join,
--   Subqueries (scalar, multi-row), IN/NOT IN with subqueries,
--   EXISTS/NOT EXISTS, Subqueries in WHERE/SELECT/FROM
-- Concepts NOT Allowed: Correlated subqueries, ANY/SOME/ALL,
--   CTEs, Window Functions, Transactions, Views, Functions
-- ============================================

-- Q1. Flipkart's merchandising team notices certain products never get ordered. They want to identify products that exist in the products catalog but have never appeared in any order. The team needs product names and their categories for a review meeting.

-- Q2. Zomato's customer retention team needs to find customers who placed orders but have zero loyalty points. These customers might have a technical issue with their loyalty program enrollment.

-- Q3. BigBasket's procurement team wants to identify suppliers whose products have an average price higher than the overall average product price. This helps negotiate better deals.

-- Q4. Myntra's regional sales head needs to find stores that have generated more revenue than the average revenue across all stores. Revenue is calculated from orders total_amount.

-- Q5. PhonePe's analytics team wants to find products that have been returned more than the average number of returns per product. Flag these for quality review.

-- Q6. Ola's HR department needs to identify employees whose salary exceeds the average salary of employees in their same role (without using self-join - use subquery).

-- Q7. Amazon India's category manager wants to find all products in categories where the total number of products exceeds 5. List product name and category.
        

-- Q8. Swiggy's operations team needs to identify orders where the payment amount doesn't match the order total_amount. Find these discrepancies.

-- Q9. IRCTC's customer success team wants to find customers who have placed orders but never written a review. These are potential candidates for review solicitation.

-- Q10. Reliance Retail's inventory analyst needs to find products whose current stock quantity is below the average stock quantity for their category.

-- Q11. Paytm Mall's team wants to identify stores where the number of employees is greater than the overall average number of employees per store.

-- Q12. Flipkart's delivery team needs to find orders that were shipped but the delivered_date is earlier than shipped_date (data quality issue). Use subquery to first find such shipment IDs.

-- Q13. Zomato's marketing team wants to find customers who received emails from campaigns that had above-average budget. List customer names.

-- Q14. BigBasket's vendor management needs suppliers who have supplied products across multiple categories. Show supplier name and the count of distinct categories.

-- Q15. Myntra's analytics wants to find the top 5 products by total quantity sold, but only among products that have been ordered at least 10 times.

-- Q16. PhonePe's fraud team needs to identify payments where the amount exceeds twice the average payment amount for that payment mode.

-- Q17. Ola's fleet team wants to find stores that have expenses in every expense category. List store names.

-- Q18. Amazon's promotion team needs products that have never been part of any promotion period (no orders during any promotion date range).

-- Q19. Swiggy's customer team wants to find customers who have placed orders in more than one region. Show customer name and number of regions.

-- Q20. IRCTC's revenue analyst needs to find the month with the highest total sales and display all orders from that month.

-- Q21. Reliance Digital's HR needs employees who joined after the most recently joined manager (role = 'Manager').

-- Q22. Paytm's campaign team wants to find campaigns whose total ad spend exceeds the average campaign budget. Show campaign name and total spend.

-- Q23. Flipkart's category team needs to find categories where the most expensive product costs more than twice the category's average price.

-- Q24. Zomato's logistics team wants to identify couriers who have delivered orders with above-average total amounts. List courier names.

-- Q25. BigBasket's pricing analyst needs products whose price falls in the top 25% price range (price > 75th percentile approximation using subquery).

-- Q26. Myntra's store ops team needs to find stores where the latest order date is more than 30 days old. These stores might need attention.

-- Q27. PhonePe's HR needs departments that have employees in more than one store location.

-- Q28. Ola's finance team wants to find expense records where the amount is more than the average expense for that particular expense type.

-- Q29. Amazon's review team needs customers who have given both 5-star and 1-star reviews. They want to understand these polarized reviewers.

-- Q30. Swiggy's inventory team needs products where the total inventory across all stores is less than the average total inventory per product.

-- Q31. IRCTC's operations wants to find orders that have all items delivered (all order_items have corresponding completed shipments).

-- Q32. Reliance Retail's marketing needs customers from states where the total number of customers exceeds 100.

-- Q33. Paytm's analyst wants to display each order along with a column showing how much it deviates from the average order amount.

-- Q34. Flipkart's supplier team needs to find products from suppliers who have more than 3 products in the catalog.

-- Q35. Zomato's HR needs employees whose salary is within 10% of their department's maximum salary.

-- Q36. BigBasket's sales team wants to find customers who ordered on the same date that store ID 5 recorded its highest sales day.

-- Q37. Myntra's returns team needs to identify products that have a return rate higher than the overall average return rate.

-- Q38. PhonePe's ops team wants orders where at least one item was ordered at a discount greater than the average discount across all items.

-- Q39. Ola's HR team needs to find the second highest salary in each department using subqueries.

-- Q40. Amazon's category manager wants to find categories where the cheapest product is still more expensive than the overall median price.

-- Q41. Swiggy's marketing needs campaigns that achieved click-through rates above the average campaign CTR.

-- Q42. IRCTC's customer team wants to find customers who have spent more than the average lifetime spend but have below-average loyalty points.

-- Q43. Reliance Digital wants products that have inventory in stores located in every region.

-- Q44. Paytm's analyst needs to find payment modes that have processed more than the average number of transactions per mode.

-- Q45. Flipkart's regional head wants stores where the employee-to-orders ratio is better than the company average.

-- Q46. Zomato's QA team needs products where the average review rating is below 3 and total orders exceed 50.

-- Q47. BigBasket's ops team wants to find orders placed by customers whose average order value exceeds the overall average order value.

-- Q48. Myntra's finance team needs stores whose monthly expenses exceed their monthly revenue (use subqueries for both calculations).

-- Q49. PhonePe's team wants to find customers who made their first order in the same month as the store's inauguration (earliest order date for that store).

-- Q50. Ola's analytics needs to display each product with its price and a column indicating what percentage of the maximum price it represents.

-- Q51. Amazon India's fulfillment center needs to identify orders that contain products from more than 3 different suppliers.

-- Q52. Swiggy's loyalty team wants customers who earned loyalty points in months where total company sales exceeded 1 million.

-- Q53. IRCTC's scheduling team needs to find dates on which orders were placed at stores that normally have no orders (less than 5 total orders).

-- Q54. Reliance Retail's procurement wants suppliers whose products have never been returned.

-- Q55. Paytm's marketing needs to find campaigns where the email open rate exceeded the average open rate by at least 10 percentage points.

-- Q56. Flipkart's inventory team needs products that are out of stock in at least one store but available in others.

-- Q57. Zomato's pricing team wants products whose price is within one standard deviation of the mean (use AVG and approximate calculation).

-- Q58. BigBasket's HR needs employees who work at stores that have above-average customer order counts.

-- Q59. Myntra's ops team wants to find the order that has the highest number of distinct products.

-- Q60. PhonePe's analytics wants to identify customers who have used all available payment modes at least once.

-- Q61. Ola's regional manager needs stores located in cities where the total number of customers exceeds the national average per city.

-- Q62. Amazon's returns department needs to find products where the refund amount typically exceeds the product price (data quality issue).

-- Q63. Swiggy's campaign team needs campaigns that ran during months with above-average total orders.

-- Q64. IRCTC's customer success wants customers whose review ratings are consistently above the product's average rating (all their reviews are above respective product averages).

-- Q65. Reliance Digital's finance needs stores whose profit margin (revenue - expenses) is in the top 30% of all stores.

-- Q66. Paytm's HR wants employees whose hire date is after the store's first recorded expense date.

-- Q67. Flipkart's category team needs categories where the price variance (max - min) exceeds the average price of that category.

-- Q68. Zomato's QA needs orders where all items have been shipped (no pending items).

-- Q69. BigBasket's marketing wants to identify customers who have ordered from at least 5 different product categories.

-- Q70. Myntra's analyst wants products where the total ordered quantity exceeds 10 times the current stock quantity.

-- Q71. PhonePe's fraud detection wants payments from customers who have made more payments than the average customer.

-- Q72. Ola's operations wants stores where the average expense per month exceeds the average revenue per month.

-- Q73. Amazon's HR needs departments where the total salary budget exceeds the company's average department budget.

-- Q74. Swiggy's delivery analytics wants orders delivered by couriers with above-average delivery counts.

-- Q75. IRCTC's finance wants to identify the most profitable day of the week using order data.

-- Q76. Reliance Retail's strategy team wants stores that have orders from customers in more than 3 different states.

-- Q77. Paytm Mall's team wants products that appear in orders with above-average total amounts.

-- Q78. Flipkart's customer team wants customers who have placed orders at the same store more than 5 times.

-- Q79. Zomato's inventory needs products whose restock frequency (based on last_updated in inventory) is higher than average.

-- Q80. BigBasket's marketing wants campaigns where every ad channel achieved at least one conversion.

-- Q81. Myntra's finance needs to show each store's revenue alongside the company-wide average revenue per store.

-- Q82. PhonePe's analyst wants to find the customer who has the most diverse product portfolio (ordered most distinct products).

-- Q83. Ola's HR needs employees who have been present every day in the current month (no absent records).

-- Q84. Amazon's ops team wants orders where the total exceeds the average by at least 2 times the standard deviation (approximated).

-- Q85. Swiggy's customer team wants customers from cities that have both high-value (>1000) and low-value (<100) orders.

-- Q86. IRCTC's marketing wants products that have been ordered in campaigns with above-average conversion rates.

-- Q87. Reliance Digital's inventory wants to flag products where any store has less than 10% of the maximum stock for that product.

-- Q88. Paytm's analytics wants payment modes with transaction counts above the median transaction count.

-- Q89. Flipkart's HR wants the manager (role) who supervises the department with the highest total salary expense.

-- Q90. Zomato's returns team wants customers whose return rate exceeds the overall customer average return rate.

-- Q91. BigBasket's pricing wants products that are priced differently (higher or lower by >10%) than the average of their brand.

-- Q92. Myntra's ops wants stores where the average delivery time (shipped to delivered) is faster than the company average.

-- Q93. PhonePe's team wants customers who made purchases on dates when total company sales exceeded the daily average.

-- Q94. Ola's finance wants expense categories that have been used by more than half the total stores.

-- Q95. Amazon's marketing wants customers who responded to emails from their first campaign they were part of.

-- Q96. Swiggy's analyst wants products where the percentage of orders with discounts exceeds 50%.

-- Q97. IRCTC's ops wants to identify the peak ordering hour (derived from order_date if time is available, otherwise day of week).

-- Q98. Reliance Retail's HR wants employees whose attendance percentage is above the store's average attendance.

-- Q99. Paytm's strategy wants regions where the average order value exceeds the national average by at least 20%.

-- Q100. Flipkart's category manager wants to identify brands where all products have above-average ratings (every product rated > 3.5).

-- ============================================
-- END OF DAY 11 MEDIUM QUESTIONS
-- ============================================



-- Q1. Retailmart's merchandising team notices certain products never get ordered. They want to identify products that exist in the products catalog but have never appeared in any order. The team needs product names and their categories for a review meeting.

SELECT *
FROM products.products p
WHERE NOT EXISTS (
    SELECT 1						 ---  using sub query
    FROM sales.order_items oi
    WHERE p.prod_id = oi.prod_id  
);


SELECT p.prod_name, p.category
FROM products.products p
LEFT JOIN sales.order_items oi  	--- using joins
    ON p.prod_id = oi.prod_id
WHERE oi.prod_id IS NULL;

-- Q2. Retailmat's customer retention team needs to find customers who placed orders but have zero loyalty points. These customers might have a technical issue with their loyalty program enrollment.

SELECT DISTINCT c.cust_id
FROM customers.customers c
JOIN sales.orders o
    ON c.cust_id = o.cust_id		--- 
WHERE NOT EXISTS (
    SELECT 1
    FROM customers.loyalty_points p
    WHERE p.cust_id = c.cust_id
);

SELECT DISTINCT c.cust_id
FROM customers.customers c
JOIN sales.orders o
    ON c.cust_id = o.cust_id
LEFT JOIN customers.loyalty_points p
    ON c.cust_id = p.cust_id
WHERE p.cust_id IS NULL;


-- Q3. Retailmart's procurement team wants to identify suppliers whose products have an average price higher than the overall average product price. This helps negotiate better deals.

SELECT supplier_id
from products.products
GROUP by supplier_id
having avg(price) > (
	select avg(price)
	from products.products
);



-- Q4. Retailmart's regional sales head needs to find stores that have generated more revenue than the average revenue across all stores. Revenue is calculated from orders total_amount.

SELECT store_id
from sales.orders
group by store_id
having sum(total_amount) > (
	SELECT avg(store_revenue)
	FROM (
		SELECT sum(total_amount) as store_revenue
		from sales.orders
		GROUP by store_id
	) t
);

-- Q5. Retailmart's analytics team wants to find products that have been returned more than the average number of returns per product. Flag these for quality review.

sELECT prod_id
from sales.returns
group by prod_id
having count(*) > (
	SELECT avg(return_count)
	FROM (
		SELECT count(*) as return_count
		from sales.returns
		GROUP by prod_id
	) t
);
-- Q6. Retailmart's HR department needs to identify employees whose salary exceeds the average salary of employees in their same role (without using self-join - use subquery).

SELECT emp_id
FROM stores.employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM stores.employees
    WHERE role = e.role
);


-- Q7. Retailmart's category manager wants to find all products in categories where the total number of products exceeds 50. List product name and category.

SELECT
	CATEGORY,
	PROD_NAME
FROM
	PRODUCTS.PRODUCTS
WHERE
	CATEGORY IN (
		SELECT
			CATEGORY
		FROM
			PRODUCTS.PRODUCTS
		GROUP BY
			CATEGORY
		HAVING
			COUNT(*) > 50
	)

-- Q8. Retailmart's operations team needs to identify orders where the payment amount doesn't match the order total_amount. Find these discrepancies.


select * from sales.orders
select * from sales.payments

select *
from sales.orders o
where o.total_amount <> (
	select p.amount
	from sales.payments p
	where p.order_id = o.order_id
);


-- Q9. Retailmart's customer success team wants to find customers who have placed orders but never written a review. These are potential candidates for review solicitation.

SELECT DISTINCT
	O.CUST_ID
FROM
	SALES.ORDERS O
WHERE
	NOT EXISTS (
		SELECT
			1
		FROM
			CUSTOMERS.REVIEWS R
		WHERE
			O.CUST_ID = R.CUST_ID
	);

-- Q10. Retail's inventory analyst needs to find products whose current stock quantity is below the average stock quantity for their category.

SELECT
    p.prod_name,
    p.category,
    i.stock_qty
FROM products.inventory i
JOIN products.products p
    ON i.prod_id = p.prod_id
WHERE i.stock_qty < (
    SELECT AVG(i2.stock_qty)
    FROM products.inventory i2
    JOIN products.products p2
        ON i2.prod_id = p2.prod_id
    WHERE p2.category = p.category
);

SELECT
	P.PROD_NAME,
	P.CATEGORY,
	I.STOCK_QTY
FROM
	PRODUCTS.INVENTORY I
	JOIN PRODUCTS.PRODUCTS P 
	ON I.PROD_ID = P.PROD_ID
WHERE
	I.STOCK_QTY < (
		SELECT
			AVG(I2.STOCK_QTY)
		FROM
			PRODUCTS.INVENTORY I2
			JOIN PRODUCTS.PRODUCTS P2
			ON I2.PROD_ID = P2.PROD_ID
		WHERE
			P2.CATEGORY = P.CATEGORY
	);

-- Q11. Retailmart's team wants to identify stores where the number of employees is greater than the overall average number of employees per store.

SELECT
	STORE_ID
FROM
	STORES.EMPLOYEES
GROUP BY
	STORE_ID
HAVING
	COUNT(EMP_ID) < (
		SELECT
			AVG(EMP_COUNT)
		FROM
			(
				SELECT
					COUNT(EMP_ID) AS EMP_COUNT
				FROM
					STORES.EMPLOYEES
				GROUP BY
					STORE_ID
			) T
	);

-- Q12. Retailmart's delivery team needs to find orders that were shipped but the delivered_date is earlier than shipped_date (data quality issue). Use subquery to first find such shipment IDs.

select *
from sales.orders
where order_id in 
	( select order_id
from sales.shipments
where  delivered_date < shipped_date
);

-- Q13. Retailmart's marketing team wants to find customers who received emails from campaigns that had above-average budget. List customer names.

SELECT * from marketing.email_clicks

SELECT distinct c.full_name
from customers.customers c
join marketing.email_clicks e
	on c.cust_id = e.cust_id
where e.campaign_id in (
	select campaign_id
	from marketing.campaigns
	where budget > (
		select avg(budget)
		from marketing.campaigns
	)
);

-- Q14. Retailmart's vendor management needs suppliers who have supplied products across multiple categories. Show supplier name and the count of distinct categories.

SELECT 
	s.supplier_name,
	count(distinct p.category) as category_count
from products.suppliers s
join products.products p
	on s.supplier_id = p.supplier_id
GROUP by
	s.supplier_name
HAVING count(DISTINCT P.CATEGORY) >1;

-- Q15. RETAILMART's analytics wants to find the top 5 products by total quantity sold, but only among products that have been ordered at least 10 times.

SELECT
	p.prod_name,
	sum(o.quantity) as total_qty
from products.products p
join sales.order_items o
	on p.prod_id = o.prod_id
group by 
	p.prod_name
having count(*) >=10
order by total_qty desc
limit 5;


-- Q16. Retailmrt's fraud team needs to identify payments where the amount exceeds twice the average payment amount for that payment mode.

select * from sales.payments
EXPLAIN
select 
	p.payment_id,
	p.payment_mode,
	p.amount
from sales.payments p
where p.amount > (
	select 2 * avg(p2.amount)
	from sales.payments p2
	where p2.payment_mode = p.payment_mode
);

-- Q17. Retailmart's fleet team wants to find stores that have expenses in every expense category. List store names.

SELECT s.store_name
from stores.stores s
JOIN finance.expenses e
on s.store_id = e.store_id
GROUP by s.store_id, s.store_name
HAVING count(distinct category) = (
	SELECT count(distinct category)
	FROM finance.expenses
);

-- Q18. Retailmart's promotion team needs products that have never been part of any promotion period (no orders during any promotion date range).

SELECT p.prod_id, p.prod_name
FROM products.products p
WHERE NOT EXISTS (
    SELECT 1
    FROM sales.order_items oi
    JOIN sales.orders o      				---- using "NOT EXISTS" BETTER WAY
	ON oi.order_id = o.order_id
    JOIN products.promotions pr
	ON o.order_date BETWEEN pr.start_date AND pr.end_date
    WHERE oi.prod_id = p.prod_id
);

SELECT prod_id, prod_name
FROM products.products
WHERE prod_id NOT IN (
    SELECT DISTINCT oi.prod_id				---USING "NOT IN" only when 0 null values in our data
    FROM sales.order_items oi
    JOIN sales.orders o       ON oi.order_id = o.order_id
    JOIN products.promotions pr ON o.order_date BETWEEN pr.start_date AND pr.end_date
);

-- Q19. Retailmart's customer team wants to find customers who have placed orders in more than one region. Show customer name and number of regions.

select c.full_name, count(distinct s.region) as region_count
from customers.customers c
join sales.orders o
on c.cust_id = o.cust_id
join stores.stores s
on o.store_id = s.store_id
GROUP by c.cust_id, c.full_name
HAVING count(distinct s.region) >1;

-- Q20. Retailmart's revenue analyst needs to find the month with the highest total sales and display all orders from that month.

SELECT *
FROM sales.orders
WHERE EXTRACT(MONTH FROM order_date) = (
    SELECT EXTRACT(MONTH FROM order_date)
    FROM sales.orders
    GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
    ORDER BY SUM(total_amount) DESC
    LIMIT 1
)




