
🔍 SECTION B: COMPLEX FILTERING (50)
   ------------------------------------------------------------ */
/* Q11. Retrieve all products where (price > 1000 AND category = 'Electronics') OR (price < 200 AND category = 'Stationery'). */
/* Q12. Retrieve all products where category IN ('Electronics','Furniture') AND (price BETWEEN 500 AND 1500 OR price IS NULL). */
/* Q13. Retrieve all products where (category = 'Clothing' OR category = 'Footwear') AND price < 2000. */
/* Q14. Retrieve all customers where (city = 'Delhi' OR city = 'Mumbai') AND gender = 'F'. */
/* Q15. Retrieve all customers where (email IS NULL OR email NOT LIKE '%@%') AND city IS NOT NULL. */
/* Q16. Retrieve all employees where (salary > 50000 AND department = 'Finance') OR (salary < 30000 AND department = 'HR'). */
/* Q17. Retrieve employees whose name LIKE '%a%' AND (role = 'Manager' OR role = 'Analyst'). */
/* Q18. Retrieve employees where NOT (department = 'Sales' OR department = 'Support'). */
/* Q19. Retrieve employees where department IN ('Finance','HR') AND salary BETWEEN 30000 AND 80000. */
/* Q20. Retrieve employees whose department IS NULL OR salary IS NULL. */
/* Q21. Retrieve orders where (payment_mode = 'Card' AND total_amount > 10000) OR (payment_mode = 'UPI' AND total_amount > 20000). */
/* Q22. Retrieve orders where (order_date BETWEEN '2021-01-01' AND '2022-12-31') AND status IN ('Delivered','Shipped'). */
/* Q23. Retrieve orders where NOT (status = 'Cancelled' OR status IS NULL). */
/* Q24. Retrieve orders where order_date IS NULL OR total_amount IS NULL. */
/* Q25. Retrieve customers where (city LIKE 'M%' OR city LIKE 'D%') AND gender = 'M'. */
/* Q26. Retrieve customers where name LIKE '%n%' AND (city = 'Pune' OR city = 'Kolkata'). */
/* Q27. Retrieve customers where name ILIKE '%Ali%' (case-insensitive search). */
/* Q28. Retrieve products where product_name ILIKE '%pro%' OR ILIKE '%max%'. */
/* Q29. Retrieve products where NOT (price BETWEEN 500 AND 1000). */
/* Q30. Retrieve products where price BETWEEN 1000 AND 5000 AND category IN ('Electronics','Appliances'). */
/* Q31. Retrieve products where price > 2000 AND product_name LIKE '%Phone%' AND category = 'Electronics'. */
/* Q32. Retrieve products where (category = 'Electronics' AND price BETWEEN 500 AND 1000) OR category = 'Gadgets'. */
/* Q33. Retrieve employees where (department = 'HR' AND role IN ('Clerk','Executive')) OR department = 'Finance'. */
/* Q34. Retrieve employees where salary BETWEEN 40000 AND 80000 AND (role LIKE '%Manager%' OR role LIKE '%Lead%'). */
/* Q35. Retrieve employees where NOT (department IN ('HR','Support')). */
/* Q36. Retrieve employees where role ILIKE '%lead%' AND salary > 70000. */
/* Q37. Retrieve customers where email LIKE '%@gmail%' OR email LIKE '%@yahoo%'. */
/* Q38. Retrieve customers where name LIKE '_a%' OR name LIKE '_e%'. */
/* Q39. Retrieve customers where gender IS NULL OR city IS NULL OR email IS NULL. */
/* Q40. Retrieve customers where (city IN ('Delhi','Kolkata') AND gender = 'F') OR email LIKE '%outlook%'. */
/* Q41. Retrieve products where product_name LIKE '%book%' OR product_name LIKE '%case%'. */
/* Q42. Retrieve products where price NOT BETWEEN 100 AND 500 AND category NOT IN ('Grocery'). */
/* Q43. Retrieve employees where salary > 40000 AND (department = 'Finance' OR department = 'Operations') AND name LIKE '%i%'. */
/* Q44. Retrieve employees where department LIKE 'S%' AND role LIKE '%Analyst%'. */
/* Q45. Retrieve orders where payment_mode IN ('UPI','Card') AND (status = 'Delivered' OR status = 'Processing'). */
/* Q46. Retrieve orders where NOT (payment_mode IS NULL OR total_amount < 1000). */
/* Q47. Retrieve customers where name ILIKE '%a%' AND city ILIKE '%pur%' OR gender = 'F'. */
/* Q48. Retrieve products where category IS NULL OR product_name IS NULL. */
/* Q49. Retrieve orders where order_date NOT BETWEEN '2020-01-01' AND '2021-12-31' AND status = 'Delivered'. */
/* Q50. Retrieve employees whose salary BETWEEN 20000 AND 90000 AND department NOT IN ('Support','Admin'). */
/* Q51. Retrieve all employees where salary IS NULL OR salary = 0. */
/* Q52. Retrieve all orders where order_date IS NOT NULL AND payment_mode IS NOT NULL. */
/* Q53. Retrieve all customers where city LIKE '%a%' AND email IS NOT NULL. */
/* Q54. Retrieve all products where category NOT LIKE 'F%' AND price > 1000. */
/* Q55. Retrieve products where category LIKE 'E%' AND (price > 1000 AND price < 5000). */
/* Q56. Retrieve products where NOT (category = 'Electronics' OR category = 'Appliances'). */
/* Q57. Retrieve customers where NOT (city = 'Delhi' OR gender = 'M'). */
/* Q58. Retrieve employees where NOT (salary BETWEEN 20000 AND 40000) AND role LIKE '%Manager%'. */
/* Q59. Retrieve orders where total_amount > 10000 AND NOT (status = 'Cancelled' OR status = 'Returned'). */
/* Q60. Retrieve products where (price < 200 OR price > 2000) AND category = 'Electronics'. */



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
	


/* Q14. Retrieve all customers where (city = 'Delhi' OR city = 'Mumbai') AND gender = 'F'. */


SELECT * FROM 
	products.customers
where (city = 'Delhi' OR city = 'Mumbai') AND gender = 'F';

/* Q15. Retrieve all customers where (email IS NULL OR email NOT LIKE '%@%') AND city IS NOT NULL. */


select c.full_name,
		c.cust_id,
		e.email_id,
		c.city
from customers.customers c
join marketing.email_clicks e
	on c.cust_id = e.cust_id
where (e.email_id is null
       or e.email_id::text not like '%@%')
  and c.city is not null;

/* Q16. Retrieve all employees where (salary > 50000 AND department = 'Finance') OR (salary < 30000 AND department = 'HR'). */

SELECT * from stores.departments
SELECT * from stores.employees

SELECT e.emp_id,
		e.salary,
		d.dept_name
from stores.employees e
JOIN stores.departments d
	on e.dept_id = d.dept_id
where (salary > 50000 AND dept_name = 'Finance') OR (salary < 30000 AND dept_name = 'HR');


/* Q17. Retrieve employees whose name LIKE '%a%' AND (role = 'Manager' OR role = 'Analyst'). */

select * FROM stores.employees
where (emp_name LIKE '%a%' AND role = 'Manager' OR role = 'Analyst') ---- 0 rows ---ans query for Q

select * FROM stores.employees
where (emp_name LIKE '%a%' AND role ilike '%Manager%' OR role ILIKE '%Analyst%') ---

/* Q18. Retrieve employees where NOT (department = 'Sales' OR department = 'Support'). */ 

SELECT e.emp_id,
		
		d.dept_name
from stores.employees e
JOIN stores.departments d
	on e.dept_id = d.dept_id
where NOT (dept_name = 'Sales' OR d.dept_name = 'Support')

/* Q19. Retrieve employees where department IN ('Finance','HR') AND salary BETWEEN 30000 AND 80000. */

SELECT e.emp_id,
		
		d.dept_name
from stores.employees e
JOIN stores.departments d
	on e.dept_id = d.dept_id
where d.dept_name IN ('Finance', 'HR') AND salary BETWEEN 30000 AND 80000;

/* Q20. Retrieve employees whose department IS NULL OR salary IS NULL. */

SELECT e.emp_id,
		d.dept_name
from stores.employees e
left JOIN stores.departments d
	on e.dept_id = d.dept_id
where d.dept_name is null OR e.salary is null;

/* Q21. Retrieve orders where (payment_mode = 'Card' AND total_amount > 10000) OR (payment_mode = 'UPI' AND total_amount > 20000). */

SELECT * FROM sales.orders
select * FROM sales.payments;

select o.order_id,
		o.total_amount,
		p.payment_mode
FROM sales.orders o
join sales.payments p	
On o.order_id = P. order_id
Where (payment_mode ILIKE '%Card%' AND total_amount > 10000) OR (payment_mode = 'UPI' AND total_amount > 20000);


/* Q22. Retrieve orders where (order_date BETWEEN '2024-01-01' AND '2025-12-31') AND status IN ('Delivered','Shipped'). */

select * from sales.orders
WHERE (order_date between '2024-01-01' AND '2025-12-31') AND order_status IN ('Delivered', 'Shipped');

/* Q23. Retrieve orders where NOT (status = 'Cancelled' OR status IS NULL). */

select * from sales.orders
where (order_status <> 'Cancelled' OR order_status is null)

/* Q24. Retrieve orders where order_date IS NULL OR total_amount IS NULL. */

select * from sales.orders									 ---- returns 0 rows becoz we dont have null values 
where (order_status is null OR total_amount is null)   		----- in our dataset

/* Q25. Retrieve customers where (city LIKE 'M%' OR city LIKE 'D%') AND gender = 'M'. */

select * from customers.customers
where (city like 'M%' OR city like 'D%') and gender = 'M';

/* Q26. Retrieve customers where name LIKE '%n%' AND (city = 'Pune' OR city = 'Kolkata'). */

select * from customers.customers
where (city = 'Pune' OR city = 'Kolkata') and full_name like '%n%';

/* Q27. Retrieve customers where name ILIKE '%Ali%' (case-insensitive search). */

select * from customers.customers
where full_name ilike '%Ali%';

/* Q28. Retrieve products where product_name ILIKE '%watch%' OR ILIKE '%phone%'. */

select * from products.products
where prod_name ILIKE '%phone%' OR prod_name ILIKE '%watch%';

/* Q29. Retrieve products where NOT (price BETWEEN 500 AND 1000). */

select * from products.products
where (price NOT BETWEEN 500 AND 1000); 

/* Q30. Retrieve products where price BETWEEN 500 AND 10000 AND category IN ('Electronics','Home Appliances'). */

select * from products.products
where (price  BETWEEN 500 AND 10000) and	 (category IN ('Electronics','Home Appliances')); 



	