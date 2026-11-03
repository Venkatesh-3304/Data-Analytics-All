Got it! Here are all the questions renumbered starting from **1**:

```sql
/* ============================================================
   💻 SECTION B: BASIC COMMANDS (40)
   ------------------------------------------------------------ */
/* Q1.  Create database sql_bootcamp if it does not exist. */
/* Q2.  Connect to sql_bootcamp. */
/* Q3.  Verify the connection using SELECT current_database(). */
/* Q4.  Create schema daily if not exists. */
/* Q5.  Create table daily_departments(dept_id SERIAL PRIMARY KEY, dept_name TEXT NOT NULL). */
/* Q6.  Insert 5 departments into daily_departments. */
/* Q7.  Create table daily_employees(emp_id SERIAL, emp_name TEXT, dept_id INT). */
/* Q8.  Insert 3 employees linked to department IDs. */
/* Q9.  Select all records from daily_employees. */
/* Q10. Add column salary NUMERIC(10,2) to daily_employees. */
/* Q11. Update all employees' salaries to 50000. */
/* Q12. Rename daily_employees to daily_staff. */
/* Q13. Drop column salary from daily_staff. */
/* Q14. Drop and recreate table daily_employees with three columns (id, name, hire_date). */
/* Q15. Insert 3 employees with hire_date as current_date. */
/* Q16. Create temporary table temp_data(a INT, b TEXT). */
/* Q17. Insert 3 sample records into temp_data. */
/* Q18. Select count of records from temp_data. */
/* Q19. Drop temp_data. */
/* Q20. Create table daily_projects(id SERIAL, name TEXT, start_date DATE DEFAULT CURRENT_DATE). */
/* Q21. Insert 2 projects and verify insertion. */
/* Q22. Update project name for one record. */
/* Q23. Delete one record from daily_projects. */
/* Q24. Drop daily_projects. */
/* Q25. Create a role hard_user with LOGIN privilege. */
/* Q26. Grant CREATE privilege on schema daily to hard_user. */
/* Q27. Create table daily_logs(id SERIAL, action TEXT, created_at TIMESTAMP DEFAULT NOW()). */
/* Q28. Insert 3 activity logs (INSERT, UPDATE, DELETE). */
/* Q29. Retrieve all logs sorted by created_at. */
/* Q30. Drop daily_logs. */
/* Q31. Show database size using pg_database_size(). */
/* Q32. Show list of all schemas and their owners. */
/* Q33. Retrieve names of all tables in current schema using information_schema.tables. */
/* Q34. Retrieve PostgreSQL version using SELECT version(). */
/* Q35. Show active sessions using pg_stat_activity. */
/* Q36. Create table daily_branches(branch_id SERIAL, branch_name TEXT, city TEXT). */
/* Q37. Insert 3 branches with different cities. */
/* Q38. Update one city name. */
/* Q39. Delete one record. */
/* Q40. Drop daily_branches table. */

/* ============================================================
   🧩 SECTION C: PRACTICAL DDL & DML TASKS (40)
   ------------------------------------------------------------ */
/* Q41. Create schema daily if not exists in sql_bootcamp. */
/* Q42. Create table daily_products(product_id SERIAL, name TEXT, category TEXT, price NUMERIC(10,2)). */
/* Q43. Insert 10 sample rows into daily_products. */
/* Q44. Add a new column brand TEXT to daily_products. */
/* Q45. Update brand for all rows to 'Generic'. */
/* Q46. Delete 2 random records from daily_products. */
/* Q47. Create table daily_customers(customer_id SERIAL, name TEXT, city TEXT, joined_on DATE DEFAULT CURRENT_DATE). */
/* Q48. Insert 5 customers into daily_customers. */
/* Q49. Create table daily_orders(order_id SERIAL, customer_id INT, product_id INT, order_date DATE DEFAULT CURRENT_DATE). */
/* Q50. Insert 5 orders with valid customer and product IDs. */
/* Q51. Retrieve all orders from daily_orders. */
/* Q52. Rename column city to location in daily_customers. */
/* Q53. Drop column brand from daily_products. */
/* Q54. Truncate daily_orders table but retain structure. */
/* Q55. Drop daily_orders table. */
/* Q56. Backup daily_customers into daily_customers_backup. */
/* Q57. Drop daily_customers_backup. */
/* Q58. Retrieve first 15 records from retailmart.products. */
/* Q59. Retrieve all unique categories from retailmart.products. */
/* Q60. Retrieve total number of rows in retailmart.products. */
/* Q61. Retrieve all customers from retailmart.customers. */
/* Q62. Retrieve all employees from retailmart.hr.employees. */
/* Q63. Retrieve 10 records from retailmart.sales.orders. */
/* Q64. Retrieve first 5 product names and prices from retailmart.products. */
/* Q65. Retrieve all distinct product categories from retailmart.products. */
/* Q66. Retrieve total count of rows in retailmart.sales.orders. */
/* Q67. Retrieve all products ordered by name alphabetically. */
/* Q68. Retrieve top 5 products by price (using ORDER BY + LIMIT). */
/* Q69. Show name of current database using SELECT current_database(). */
/* Q70. Retrieve all schemas in sql_bootcamp using information_schema.schemata. */
/* Q71. Retrieve all table names from daily schema using information_schema.tables. */
/* Q72. Create table daily_feedback(id SERIAL, feedback TEXT, added_on TIMESTAMP DEFAULT NOW()). */
/* Q73. Insert 3 feedback records. */
/* Q74. Select all feedback records ordered by id DESC. */
/* Q75. Truncate daily_feedback table. */
/* Q76. Drop daily_feedback table. */
/* Q77. Show database size in MB for sql_bootcamp. */
/* Q78. Show current PostgreSQL user. */
/* Q79. List all databases with their owners. */
/* Q80. List all tables available under retailmart.products schema. */

/* ============================================================
   ✅ END OF DAY 1 — HARD LEVEL PRACTICE FILE (80 QUESTIONS)
   ------------------------------------------------------------
   Instructions:
   - Stay within Day 1 concepts (setup, DDL, DML, schema, metadata).
   - No constraints, joins, or filters beyond basics.
============================================================ */
```

-- Q1. Create database sql_bootcamp.

CREATE DATABASE sql_bootcamp;

-- Q3. Verify the connection.

SELECT current_database();

-- Q4. Create schema daily if not exists.

CREATE SCHEMA IF NOT EXISTS daily;

-- Q5. Create table daily_departments.

CREATE TABLE daily.daily_departments(
    dept_id   SERIAL PRIMARY KEY,
    dept_name TEXT NOT NULL
);

-- Q6. Insert 5 departments into daily_departments.

INSERT INTO daily.daily_departments (dept_id, dept_name)
VALUES
(001, 'Data Analyst'),
(002, 'Business Analyst'),
(003, 'Data Engineer'),
(004, 'UI/UX Designer'),
(005, 'Frontend Developer'),
(006,'Ai Engineer'),
(007,'Supply Cain');

-- Q7. Create table daily_employees.

CREATE TABLE daily.daily_employees(
    emp_id   SERIAL,
    emp_name TEXT,
    dept_id  INT
);

-- Q8. Insert 5 employees into daily_employees.

INSERT INTO daily.daily_employees (emp_id, emp_name)
VALUES 
(001, 'Venkatesh'),
(002, 'Ajay'),
(003, 'Pavani'),
(004, 'Lali'),
(005, 'Akash');

-- Q9. Select all records from daily_employees.

SELECT * FROM daily.daily_employees;

-- Q10. Add column salary to daily_employees.

ALTER TABLE daily.daily_employees
ADD COLUMN salary NUMERIC(10,2);

-- Q11. Update all employees salaries.

UPDATE daily.daily_employees
SET salary = value
WHERE salary IS NULL;



-- Q11. Update all employees' salaries with different values.
UPDATE daily.daily_employees
SET salary = CASE emp_id
    WHEN 001 THEN 45000
    WHEN 002 THEN 55000
    WHEN 003 THEN 60000
    WHEN 004 THEN 50000
    WHEN 005 THEN 70000
END;

SELECT * from daily.daily_employees

/* Q12. Rename daily_employees to daily_staff. */

alter table daily.daily_employees RENAME to daily_staff;

SELECT * from daily.daily_staff;

/* Q13. Drop column salary from daily_staff. */

alter table daily.daily_staff
drop COLUMN salary;

/* Q14. Drop and recreate table daily_employees with three columns (id, name, hire_date). */

drop table daily.daily_staff;

CREATE table daily.daily_employees(
			    emp_id   SERIAL,
   				 emp_name TEXT,
   				 dept_id  INT
);

/* Q15. Insert 3 employees with hire_date as current_date. */

INSERT into daily.daily_employees (emp_id,emp_name,dept_id)
values (001,'Venkates',001),
		(002,'Harika',002),
		(003,'Akash',003),
		(004,'Pavani',004),
		(005,'Ajay',005),
		(006,'Lali',006),
		(007,'Mohan',007);
		
SELECT * from daily.daily_employees

/* Q16. Create temporary table temp_data(a INT, b TEXT). */

create temp table temp_data(a INT, b TEXT);


/* Q17. Insert 3 sample records into temp_data. */

insert into temp_data (a,b)
values (1,'one'),
		(2,'two'),
		(3,'three');

SELECT * from temp_data;

/* Q18. Select count of records from temp_data. */

SELECT count(*) from temp_data;

/* Q19. Drop temp_data. */

drop table temp_data;

/* Q20. Create table daily_projects(id SERIAL, name TEXT, start_date DATE DEFAULT CURRENT_DATE). */

CREATE table daily.daily_projects(id serial,name text,start_date date DEFAULT current_date);

/* Q21. Insert 2 projects and verify insertion. */

insert into daily.daily_projects(id,name)
VALUES (1,'swiggy Dashboard'),
		(2,'Retailmart Platform');
select * FROM  DAILY.daily_projects;

/* Q22. Update project name for one record. */

UPDATE  daily.daily_projects
set name = 'Excel Dashboard'
where name = 'swiggy Dashboard';

/* Q23. Delete one record from daily_projects. */

delete from daily.daily_projects
where name = 'Excel Dashboard';

/* Q24. Drop daily_projects. */

drop table daily.daily_projects

/* Q25. Create a role hard_user with LOGIN privilege. */

CREATE ROLE hard_user			--PASSWORD
WITH LOGIN;

CREATE ROLE hard_user
WITH LOGIN						---with password
PASSWORD 'postgres';

/* Q26.Grant CREATE privilege on schema daily to hard_user. */

GRANT CREATE
ON SCHEMA daily
TO hard_user;

/* Q27. Create table daily_logs(id SERIAL, action TEXT, created_at TIMESTAMP DEFAULT NOW()). */

Create table daily_logs(id SERIAL, action TEXT, created_at TIMESTAMP DEFAULT NOW());

/* Q28. Insert 3 activity logs (INSERT, UPDATE, DELETE). */

INSERT INTO daily_logs (action)
VALUES 
('INSERT'),
('UPDATE'),
('DELETE');

/* Q29. Retrieve all logs sorted by created_at. */

SELECT * from daily_logs

/* Q30. Drop daily_logs. */

drop table daily_logs;

/* Q31. Show database size using pg_database_size(). */

SELECT pg_database_size(current_database());

SELECT pg_size_pretty(pg_database_size(current_database()));
