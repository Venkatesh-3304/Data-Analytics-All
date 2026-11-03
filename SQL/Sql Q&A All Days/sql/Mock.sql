Alright. No formatting tricks. No symbols. Just plain text. You can copy this easily.

---

BASIC LEVEL

1. Write a query to display all records from the employees table.

2. Write a query to fetch employee names starting with letter 'A'.

3. Write a query to fetch employees hired between '2020-01-01' and '2023-12-31'.

4. Write a query to display employees who do not have a manager.

5. Write a query to display the first 3 characters of employee names in uppercase.

6. Write a query to sort employees by department ascending and salary descending.

7. Write a query to find MAX, MIN, AVG, SUM, and COUNT of salary from employees.

8. Write a query to count employees in each department.

9. Write a query to display departments having more than 5 employees.

10. Write a query to display distinct job titles from employees.

11. Write a query to categorize employees as Low, Mid, or High based on salary ranges.

12. Write a query to count total number of employees.

---

INTERMEDIATE LEVEL

13. Write a query to find the second highest salary from emp table.

14. Write a query to find employees earning more than their department average salary.

15. Write a query to display customer names who have placed at least one order.

16. Write a query to display department name and total salary of each department.

17. Write a query to display employee name along with their manager name.

18. Write a query to find common emp_id values between table_a and table_b.

19. Write a query using CROSS JOIN between two tables.

20. Write a query using DENSE_RANK to rank employees by salary within each department.

21. Write a query using CTE to calculate average salary per department.

22. Write a query to create a temporary table for employees with salary greater than 50000.

23. Write a query to create a view combining employees and departments tables.

24. Write a query to insert terminated employees into archive_employees table.

25. Write a query to count total employees and distinct departments.

26. Write a query to find duplicate email IDs from users table.

27. Write a query to calculate total salary separately for IT and HR departments.

---

ADVANCED LEVEL

28. Write a query to find the second highest salary department-wise.

29. Write a query using EXISTS clause with correlation.

30. Write a query to demonstrate difference between UNION and UNION ALL.

31. Write a query to demonstrate difference between NATURAL JOIN and INNER JOIN.

32. Write a query to delete rows using DELETE statement with condition.

33. Write a query to truncate a table.

34. Write a query to drop a table.

35. Write a query to create a table with PRIMARY KEY and FOREIGN KEY constraints.

36. Write a query to create a table with composite primary key.

37. Write a transaction to transfer 500 from account 1 to account 2.

38. Write a query to demonstrate INTERSECT operation.

39. Write a query using HAVING without GROUP BY.

40. Write a query to find employees whose salary is greater than top 2 salaries in their department.

---



----------------------------############ BASIC LEVEL ##############---------------------------



1. Write a query to display all records from the employees table.

SELECT * from stores.employees

2. Write a query to fetch employee names starting with letter 'A'.

SELECT emp_name
FROM STORES.employees
WHERE employees.emp_name LIKE 'A%';

3. Write a query to fetch customers joinedd between '2023-01-01' and '2025-12-31'.

SELECT * from customers.customers

Select cust_id,
full_name
from customers.customers
where join_date BETWEEN '2023-01-01' and '2025-12-31';

4. Write a query to display customers who do not have a order.

SELECT c.full_name
FROM customers.customers c
where not exists (
SELECT 1
from sales.orders o
where c.cust_id = o.cust_id
)

5. Write a query to display the first 3 characters of employee names in uppercase.

SELECT upper(left(emp_name,3))
from stores.employees;

6. Write a query to sort employees by department ascending and salary descending.

select * FROM stores.employees
 order by dept_id asc , salary desc;


7. Write a query to find MAX, MIN, AVG, SUM, and COUNT of salary from employees.

select max(salary) as max_salary,
		min(salary) as min_salary,
		avg(salary) as avg_salary,
		sum(salary) as sum_salary,
		count(salary) as count_salary
from stores.employees;

8. Write a query to count employees in each department.

select dept_id,
		count(emp_id) as employees_for_dept
from stores.employees							-----methodd 1
GROUP by dept_id;

select d.dept_name,
		e.dept_id,
	count(e.emp_id) as employees_count
from stores.employees e
join stores.departments d					--------method 2 
on e.dept_id = d.dept_id
GROUP by d.dept_name, e.dept_id;

9. Write a query to display departments having more than 5 employees.

select dept_id
from stores.employees
GROUP by dept_id
having count(emp_id) > 5;


SELECT d.dept_name,
	e.dept_id,
	count(e.emp_id) as employee_count 
FROM stores.employees e
join stores.departments d 
	on e.dept_id = d.dept_id
GROUP by e.dept_id, d.dept_name
HAVING count(e.emp_id) > 5;

10. Write a query to display distinct job titles from employees.

SELECT distinct(role) as Job_Title
from stores.employees e


11. Write a query to categorize employees as Low, Mid, or High based on salary ranges.

SELECT emp_name,
	case 
		when salary  <=  25000 then 'Low'
		when salary >=  50000 then 'medium'
		else 'High'
	end as Emp_Category
from stores.employees;
	

12. Write a query to count total number of employees.

SELECT count(emp_id) as Total_employees
from stores.employees;


			######### Intermediate Level ############

13. Write a query to find the second highest salary from emp table.

SELECT salary 
from stores.employees			------Nrml METHOD
order by salary DESC
limit 1 offset 1;

SELECT max(salary)
from stores.employees		-------------sub Query Method
where salary < (
	select max(salary)
	from stores.employees
);


14. Write a query to find employees earning more than their department average salary.

SELECT e1.emp_name, e1.salary, e1.dept_id
FROM stores.employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM stores.employees e2
    WHERE e2.dept_id = e1.dept_id 
)

15. Write a query to display customer names who have placed at least one order.

select c.full_name
from customers.customers c
where exists  (
		select 1 
		from sales.orders o
		where c.cust_id = o.cust_id
	
)

16. Write a query to display department name and total salary of each department.

select d.dept_name,
		sum(e.salary) as total_salary
		
from stores.departments d
join stores.employees e
	on d.dept_id = e.dept_id
	group by d.dept_name;

17. Display employee name along with their department name and store name.


SELECT * from stores.employees
	
	SELECT e.emp_name,
			d.dept_name,
			s.store_name
	from stores.employees e
	join stores.departments d
	on e.dept_id = d.dept_id
	join stores.stores s
	on e.store_id = s.store_id;
	
18. Write a query to find common cust_id values between table_a and table_b.

select c.cust_id
from customers.customers c
inner join sales.orders o
on c.cust_id = o.cust_id;

19. Write a query using CROSS JOIN between two tables.

SELECT s.store_id
from stores.stores s
cross join finance.expenses e


20. Write a query using DENSE_RANK to rank employees by salary within each department.




21. Write a query using CTE to calculate average salary per department.

with avg_salary as (
select dept_id,
	avg(salary) as avg_salary
from stores.employees
	GROUP by dept_id
)

SELECT dept_id, avg_salary
from avg_salary;


22. Write a query to create a temporary table for employees with salary greater than 50000.

CREATE temp TABLE tempo_table as
SELECT emp_name
from stores.employees
where salary > 50000;

23. Write a query to create a view combining employees and departments tables.




25. Write a query to count total employees and distinct departments

select count(emp_id) as total_empls,
		count(distinct dept_id) as distinct_depts
from stores.employees;

26. Write a query to find duplicate email IDs from users table.

SELECT email_id,
		count(*) as occurences
	from marketing.email_clicks
	group by email_id
	having count(*) >1;


27. Write a query to calculate total salary separately for IT and HR departments.

SELECT dept_name,
	sum(salary) as total_salary
from stores.employees e
JOIN stores.departments d
	on e.dept_id = d.dept_id
WHERE d.dept_name in ('Sales', 'HR')
GROUP by d.dept_name;























similar questions 

🟢 Easy — LIMIT / OFFSET
Q1. Find the 3rd highest salary from employees.

	SELECT salary
	from stores.employees
	ORDER by salary DESC
	limit 1 offset 2;
	
Q2. Find the 5th lowest salary from employees.

	SELECT salary
	from stores.employees
	order by salary ASC
	LIMIT 1 offset 4;

Q3. Display the 2nd most expensive product from products table.

	SELECT prod_name,
			price
	from products.products
	order by price DESC
	limit 1 offset 1;
			
Q4. Find the 3rd lowest priced product.

	SELECT prod_name,
			price
	FROM products.products
	order by price aSC
	LIMIT 1 offset 2;

🟡 Medium — Subquery approach

Q5. Find the 2nd highest salary department wise. (per department)



SELECT dept_id,
	max(salary) as second_highest
FROM stores.employees e1
where salary < (
	select max(salary)
	from stores.employees e2
	where e2.dept_id = e1.dept_id
)
group by dept_id
			

Q6. Find the 3rd maximum total order amount from orders table.

	SELECT max(total_amount) as third_highest_ttl_amt
	from sales.orders
	group by total_amount
	ORDER by total_amount  desc
	limit 1 offset 2;


SELECT MAX(total_amount) AS third_highest
FROM sales.orders
WHERE total_amount < (
    SELECT MAX(total_amount)
    FROM sales.orders
    WHERE total_amount < (
        SELECT MAX(total_amount)
        FROM sales.orders
    )
);
		


Q7. Find the 2nd most recent order date from orders table.

SELECT * FROM sales.orders

SELECT order_id
from sales.orders
order by order_date DESC
limit 1 OFFSET 1;



Q8. Find the product with 2nd highest price in each category.

------- method 1 without prod_name --------

SELECT p1.category,
	max(p1.price) as second_highest
FROM products.products p1
	where p1.price < (	
	select max(p2.price)
	from products.products p2
	where p1.category= p2.category
)
	group by category

------- method 2 with prod_name --------

SELECT p1.category, p1.prod_name, p1.price
FROM products.products p1
WHERE p1.price = (
    -- find 2nd highest price in same category
    SELECT MAX(p2.price)
    FROM products.products p2
    WHERE p2.category = p1.category  -- same category
    AND p2.price < (
        -- find 1st highest price in same category
        SELECT MAX(p3.price)
        FROM products.products p3
        WHERE p3.category = p1.category
    )
)
ORDER BY p1.category;

	
	

🔴 Hard — Dense Rank / Row Number
Q9. Find the top 3 highest paid employees in each department.
Q10. Find the 2nd highest salary without using LIMIT, OFFSET, or MAX.
Q11. Find Nth highest salary where N is any number you choose.
Q12. Find employees who earn the 2nd highest salary in their department.