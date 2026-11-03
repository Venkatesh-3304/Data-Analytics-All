/* ============================================================
   🔍 SECTION B: FILTERING PRACTICE (50)
   (Single-table filters — products, customers, orders, employees)
   ------------------------------------------------------------ */

/* Q11. Retrieve all columns from retailmart.products. */
/* Q12. Retrieve product_name and price from retailmart.products. */
/* Q13. Retrieve products where price is greater than 500. */
/* Q14. Retrieve products where price is less than 200. */
/* Q15. Retrieve products where category is 'Electronics'. */
/* Q16. Retrieve customers who live in 'Delhi'. */
/* Q17. Retrieve employees whose department is 'Sales'. */
/* Q18. Retrieve orders placed after '2022-01-01'. */
/* Q19. Retrieve orders placed before '2020-12-31'. */
/* Q20. Retrieve products priced between 100 and 1000 using BETWEEN. */
/* Q21. Retrieve products not priced between 200 and 500 using NOT BETWEEN. */
/* Q22. Retrieve products whose category is either 'Electronics' or 'Furniture' using IN. */
/* Q23. Retrieve products whose category is not in ('Grocery','Stationery'). */
/* Q24. Retrieve customers whose city is in ('Delhi','Mumbai','Kolkata'). */
/* Q25. Retrieve employees whose role is in ('Analyst','Manager'). */
/* Q26. Retrieve employees whose department is not 'HR'. */
/* Q27. Retrieve customers whose email IS NULL. */
/* Q28. Retrieve customers whose email IS NOT NULL. */
/* Q29. Retrieve products where product_name LIKE 'A%'. */
/* Q30. Retrieve products where product_name LIKE '%Phone%'. */
/* Q31. Retrieve products where product_name LIKE '_a%'. */
/* Q32. Retrieve products where category LIKE 'C%'. */
/* Q33. Retrieve employees whose name starts with 'S'. */
/* Q34. Retrieve employees whose name ends with 'a'. */
/* Q35. Retrieve orders where order_date IS NULL. */
/* Q36. Retrieve orders where order_date IS NOT NULL. */
/* Q37. Retrieve customers whose city is NOT NULL. */
/* Q38. Retrieve distinct category values from retailmart.products. */
/* Q39. Retrieve distinct city values from retailmart.customers. */
/* Q40. Retrieve distinct department values from retailmart.hr.employees. */
/* Q41. Retrieve all customers where city = 'Mumbai' AND gender = 'F'. */
/* Q42. Retrieve all customers where city = 'Delhi' OR city = 'Kolkata'. */
/* Q43. Retrieve all employees where department = 'Finance' OR department = 'Sales'. */
/* Q44. Retrieve all employees where department = 'Finance' AND role = 'Analyst'. */
/* Q45. Retrieve all orders where order_date BETWEEN '2021-01-01' AND '2022-12-31'. */
/* Q46. Retrieve all orders where order_date NOT BETWEEN '2018-01-01' AND '2020-01-01'. */
/* Q47. Retrieve all products priced IN (199,499,999). */
/* Q48. Retrieve all customers whose city IN ('Pune','Chennai'). */
/* Q49. Retrieve all customers whose gender NOT IN ('M'). */
/* Q50. Retrieve all orders placed on '2023-05-01'. */
/* Q51. Retrieve all orders placed after '2023-01-01' using > operator. */
/* Q52. Retrieve all employees whose joining_date is before '2022-01-01'. */
/* Q53. Retrieve all employees whose joining_date is after '2023-01-01'. */
/* Q54. Retrieve all employees where role is NULL. */
/* Q55. Retrieve all employees where salary is greater than 50000. */
/* Q56. Retrieve all employees where salary is less than 30000. */
/* Q57. Retrieve all employees where salary BETWEEN 30000 AND 70000. */
/* Q58. Retrieve all employees where department LIKE 'S%'. */
/* Q59. Retrieve all employees where name LIKE '%k%'. */
/* Q60. Retrieve all customers whose city NOT LIKE 'M%'. */

                               ----------------------ANSWERS------------------------ 

                            
/* Q11. Retrieve all columns from retailmart.products. */


/* Q11. Retrieve all columns from retailmart.products. */


SELECT * FROM 
    products.products;

/* Q12. Retrieve product_name and price from retailmart.products. */
SELECT prod_name, price
FROM products.products;

/* Q13. Retrieve products where price is greater than 500. */

select * from products.products
where price > 500;
	

/* Q14. Retrieve products where price is less than 200. */


select * from products.products
where price < 200;

/* Q15. Retrieve products where category is 'Electronics'. */


select * from products.products
where category = 'Electronics';

/* Q16. Retrieve customers who live in 'Delhi'. */
SELECT * FROM 
    customers.customers
where city = 'Delhi';

/* Q17. Retrieve employees whose department is 'Sales'. */

select * from stores.departments

SELECT *
FROM stores.employees
WHERE dept_id IN (
    SELECT dept_id
    FROM stores.departments
    WHERE dept_name = 'Sales'
);


/* Q18. Retrieve orders placed after '2022-01-01'. */

select * from sales.orders
where order_date > '2022-01-01';

/* Q19. Retrieve orders placed before '2020-12-31'. */

select * from sales.orders
where order_date < '2020-12-31';



/* Q20. Retrieve products priced between 100 and 1000 using BETWEEN. */

select * from products.products
where price between 100 and 1000;


/* Q21. Retrieve products not priced between 200 and 500 using NOT BETWEEN. */

select * from products.products
where price not between 200 and 500

/* Q22. Retrieve products whose category is either 'Electronics' or 'Furniture' using IN. */

select * from products.products
where category in ('Electronics','Furniture')

/* Q23. Retrieve products whose category is not in ('Grocery','Stationery'). */

select * from products.products
where category not in ('Grocery','Stationery')

/* Q24. Retrieve customers whose city is in ('Delhi','Mumbai','Kolkata'). */

select * from customers.customers
where City in ('Delhi','Mumbai','Kolkata');

/* Q25. Retrieve employees whose role is in ('Analyst','Manager'). */

select * from stores.employees
where role in ('Analyst', 'Manager');

/* Q26. Retrieve employees whose department is not 'HR'. */

select e.*
from stores.employees e
join stores.departments d
  on e.dept_id = d.dept_id
where d.dept_name <> 'HR';

/* Q27. Retrieve customers whose email IS NULL. */

select * from marketing.email_clicks
where email_id is null

/* Q28. Retrieve customers whose email IS NOT NULL. */

select * from marketing.email_clicks
where email_id is not null;

/* Q29. Retrieve products where product_name LIKE 'A%'. */

select * from products.products
where prod_name like 'A%';

/* Q30. Retrieve products where product_name LIKE '%Phone%'. */

select * from products.products
where prod_name  ilike '%phone%';

/* Q31. Retrieve products where product_name LIKE '_a%'. */

select * from products.products
where prod_name  ilike '_a%';

/* Q32. Retrieve products where category LIKE 'C%'. */

select * from products.products
where category  ilike 'C%';

/* Q33. Retrieve employees whose name starts with 'S'. */

select * from stores.employees
where emp_name ilike 'S%';

/* Q34. Retrieve employees whose name ends with 'a'. */

select * from stores.employees
where emp_name ilike '%a';

/* Q35. Retrieve orders where order_date IS NULL. */

select * from sales.orders
where order_date is null;

/* Q36. Retrieve orders where order_date IS NOT NULL. */

select * from sales.orders
where order_date is not null;

/* Q37. Retrieve customers whose city is NOT NULL. */


select * from customers.customers
where city is not null;

/* Q38. Retrieve distinct category values from retailmart.products. */

select distinct category from products.products;

/* Q39. Retrieve distinct city values from retailmart.customers. */

select distinct city from customers.customers;

/* Q40. Retrieve distinct department values from retailmart.hr.employees. */

select distinct dept_name from stores.departments


/* Q21. Retrieve products not priced between 200 and 500 using NOT BETWEEN. */

select * from products.products
where price not between 200 and 500

/* Q22. Retrieve products whose category is either 'Electronics' or 'Furniture' using IN. */

select * from products.products
where category in ('Electronics','Furniture')

/* Q23. Retrieve products whose category is not in ('Grocery','Stationery'). */

select * from products.products
where category not in ('Grocery','Stationery')

/* Q24. Retrieve customers whose city is in ('Delhi','Mumbai','Kolkata'). */

select * from customers.customers
where City in ('Delhi','Mumbai','Kolkata');

/* Q25. Retrieve employees whose role is in ('Analyst','Manager'). */

select * from stores.employees
where role in ('Analyst', 'Manager');

/* Q26. Retrieve employees whose department is not 'HR'. */

select e.*
from stores.employees e
join stores.departments d
  on e.dept_id = d.dept_id
where d.dept_name <> 'HR';

/* Q27. Retrieve customers whose email IS NULL. */

select * from marketing.email_clicks
where email_id is null

/* Q28. Retrieve customers whose email IS NOT NULL. */

select * from marketing.email_clicks
where email_id is not null;

/* Q29. Retrieve products where product_name LIKE 'A%'. */

select * from products.products
where prod_name like 'A%';

/* Q30. Retrieve products where product_name LIKE '%Phone%'. */

select * from products.products
where prod_name  ilike '%phone%';

/* Q31. Retrieve products where product_name LIKE '_a%'. */

select * from products.products
where prod_name  ilike '_a%';

/* Q32. Retrieve products where category LIKE 'C%'. */

select * from products.products
where category  ilike 'C%';

/* Q33. Retrieve employees whose name starts with 'S'. */

select * from stores.employees
where emp_name ilike 'S%';

/* Q34. Retrieve employees whose name ends with 'a'. */

select * from stores.employees
where emp_name ilike '%a';

/* Q35. Retrieve orders where order_date IS NULL. */

select * from sales.orders
where order_date is null;

/* Q36. Retrieve orders where order_date IS NOT NULL. */

select * from sales.orders
where order_date is not null;

/* Q37. Retrieve customers whose city is NOT NULL. */


select * from customers.customers
where city is not null;

/* Q38. Retrieve distinct category values from retailmart.products. */

select distinct category from products.products;

/* Q39. Retrieve distinct city values from retailmart.customers. */

select distinct city from customers.customers;

/* Q40. Retrieve distinct department values from retailmart.hr.employees. */

select distinct dept_name from stores.departments





/* Q41. Retrieve all customers where city = 'Mumbai' AND gender = 'F'. */

select * from customers.customers
where city = 'Mumbai' and gender = 'F';


/* Q42. Retrieve all customers where city = 'Delhi' OR city = 'Kolkata'. */

select * from customers.customers
where city = 'city' or city = 'Kolkata';

/* Q43. Retrieve all employees where department = 'Finance' OR department = 'Sales'. */

select * from stores.employees
where city = 'city' or city = 'Kolkata';

/* Q44. Retrieve all employees where department = 'Finance' AND role = 'Analyst'. */

select * from stores.employees
select * from stores.departments
select e.emp_name,
		e.role,
		d.dept_name
from stores.employees e
join stores.departments d
	on e.dept_id = d.dept_id
where d.dept_name = 'Finance' and e.role ilike  '%Analyst%';

/* Q45. Retrieve all orders where order_date BETWEEN '2021-01-01' AND '2022-12-31'. */


select * from sales.orders
where order_date between '2021-01-01' AND '2022-12-31';    -- o/p = 0 rows becoz no order b/ those dats

select * from sales.orders  -------to know the  first order date for my understing y becoz 0 rows
order by  order_date asc

/* Q46. Retrieve all orders where order_date NOT BETWEEN '2018-01-01' AND '2020-01-01'. */

select * from sales.orders
where order_date not between '2021-01-01' AND '2022-12-31';

/* Q47. Retrieve all products priced IN (199,499,999). */

SELECT * from products.products
where price in (199,499,999);       ---no products so 0 rows

/* Q48. Retrieve all customers whose city IN ('Pune','Chennai'). */

SELECT * from customers.customers
where city in ('Pune','Chennai');

/* Q49. Retrieve all customers whose gender NOT IN ('M'). */

SELECT * from customers.customers
where gender not in ('M');

/* Q50. Retrieve all orders placed on '2023-05-01'. */

SELECT * from sales.orders
where order_date = '2023-05-01';

/* Q51. Retrieve all orders placed after '2023-01-01' using > operator. */

SELECT * from sales.orders
where order_date > '2023-01-01';



/* Q54. Retrieve all employees where role is NULL. */

SELECT * from stores.employees;
where role is null

/* Q55. Retrieve all employees where salary is greater than 50000. */

SELECT * from stores.employees
where salary > 50000

/* Q56. Retrieve all employees where salary is less than 30000. */

SELECT * from stores.employees
where salary < 30000

/* Q57. Retrieve all employees where salary BETWEEN 30000 AND 70000. */


SELECT * from stores.employees
where salary BETWEEN  30000 and 50000;

/* Q58. Retrieve all employees where department LIKE 'S%'. */

SELECT e.*,
		d.dept_name
from stores.employees e
join stores.departments d
	on e.dept_id = d.dept_id
where d.dept_name like 'S%';

/* Q59. Retrieve all employees where name LIKE '%k%'. */

SELECT * from stores.employees
where emp_name like '%k%';

/* Q60. Retrieve all customers whose city NOT LIKE 'M%'. */

select * from customers.customers
where city like 'M%';






