💻 SECTION B: BASIC COMMANDS (40)
   ------------------------------------------------------------ */
   
/* Q21. Create a database named sql_bootcamp. */
/* Q22. Connect to the sql_bootcamp database. */
/* Q23. Show all databases in PostgreSQL. */
/* Q24. Create a schema named daily. */
/* Q25. Show all schemas in the current database. */
/* Q26. Create a table named student with id INT and name TEXT. */
/* Q27. Insert one record (1, 'Amit') into student. */
/* Q28. Display all records from student. */
/* Q29. Add a column age INT to student. */
/* Q30. Update Amit's age to 22. */
/* Q31. Delete all records from student. */
/* Q32. Drop the student table. */
/* Q33. Create table course (course_id SERIAL, course_name TEXT). */
/* Q34. Insert 3 sample courses. */
/* Q35. Show all records from course table. */
/* Q36. Create a temporary table temp_marks(id INT, marks INT). */
/* Q37. Insert 2 records into temp_marks. */
/* Q38. Select all records from temp_marks. */
/* Q39. Drop temp_marks table. */
/* Q40. Create schema practice. */
/* Q41. Drop schema practice. */
/* Q42. Create table daily_logs(id SERIAL, log_text TEXT). */
/* Q43. Insert a record ('System started') into daily_logs. */
/* Q44. Select all from daily_logs. */
/* Q45. Create a new role beginner_user. */
/* Q46. Grant CONNECT privilege to beginner_user on sql_bootcamp. */
/* Q47. Create table sample_table(id INT PRIMARY KEY). */
/* Q48. Insert value (5) into sample_table. */
/* Q49. Drop table sample_table. */
/* Q50. Create table empty_table(id INT). */
/* Q51. Describe the structure of empty_table. */
/* Q52. Drop empty_table. */
/* Q53. Check PostgreSQL version using SQL query. */
/* Q54. Show current database name. */
/* Q55. Show current user name. */
/* Q56. List all available roles/users. */
/* Q57. Create table greetings(message TEXT). */
/* Q58. Insert record ('Hello PostgreSQL'). */
/* Q59. Select all from greetings. */
/* Q60. Drop table greetings. */


                                              ANSWERS

/* Q21. Create a database named sql_bootcamp. */

CREATE DATABASE sql_bootcamp;





/* Q23. Show all databases in PostgreSQL. */

SELECT datname
FROM pg_database;


/* Q24. Create a schema named daily. */

CREATE SCHEMA daily;


/* Q25. Show all schemas in the current database. */

SELECT schema_name
FROM information_schema.schemata;


/* Q26. Create a table named student with id INT and name TEXT. */

CREATE TABLE student (
    id INT,
    name TEXT
);


/* Q27. Insert one record (1, 'Amit') into student. */

INSERT INTO student (id, name)
VALUES (1, 'Amit');


/* Q28. Display all records from student. */

SELECT *
FROM student;


/* Q29. Add a column age INT to student. */

ALTER TABLE student
ADD COLUMN age INT;


/* Q30. Update Amit's age to 22. */

UPDATE student
SET age = 22
WHERE name = 'Amit';



/* Q31. Delete all records from student. */

DELETE FROM student;

/* Q32. Drop the student table. */

drop table student;

/* Q33. Create table course (course_id SERIAL, course_name TEXT). */

create table course(course_id serial, course_name text);


/* Q34. Insert 3 sample courses. */

 insert into course (course_id, course_name)
values(01, 'data analytics'),
		(03,'data SCIENCE'),
		(04,'FULL sTACK');


/* Q35. Show all records from course table. */

select * from course;
	
/* Q36. Create a temporary table temp_marks(id INT, marks INT). */

create table temp (id int, marks int);

/* Q37. Insert 2 records into temp_marks. */


insert into temp(id,marks)
values(32,96),
		(33,87),
		(34,90),
		(45,87);
/* Q38. Select all records from temp_marks. */

select * from temp;

/* Q39. Drop temp_marks table. */

drop table temp;

/* Q40. Create schema practice. */

create schema practice;


/* Q41. Drop schema practice. */

drop schema practice;

/* Q42. Create table daily_logs(id SERIAL, log_text TEXT). */

Create table daily_logs(id SERIAL, log_text TEXT);

/* Q43. Insert a record ('System started') into daily_logs. */

insert into daily_logs(id,log_text)
values(01,'hi'),                       
		(02,'hlo'),
		(03,'world');


/* Q44. Select all from daily_logs. */

select * from daily_logs;

/* Q45. Create a new role beginner_user. */

CREATE ROLE beginner_user;

/* Q46. Grant CONNECT privilege to beginner_user on sql_bootcamp. */

GRANT CONNECT ON DATABASE sql_bootcamp TO beginner_user;


/* Q47. Create table sample_table(id INT PRIMARY KEY). */

Create table sample_table(id INT PRIMARY KEY)

/* Q48. Insert value (5) into sample_table. */

insert into sample_table(id)
values(5);

/* Q49. Drop table sample_table. */

drop table sample_table;

/* Q50. Create table empty_table(id INT). */

create table empty_table(id INT);

/* Q51. Describe the structure of empty_table. */

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'empty_table';


/* Q52. Drop empty_table. */

drop table empty_table;

/* Q53. Check PostgreSQL version using SQL query. */

SELECT version();


/* Q54. Show current database name. */

SELECT current_database();

/* Q55. Show current user name. */

SELECT current_user;

/* Q56. List all available roles/users. */

SELECT rolname FROM pg_roles;


/* Q57. Create table greetings(message TEXT). */

CREATE TABLE greetings (message TEXT);


/* Q58. Insert record ('Hello PostgreSQL'). */

INSERT INTO greetings (message)
VALUES ('Hello PostgreSQL');

/* Q59. Select all from greetings. */

SELECT * FROM greetings ;

/* Q60. Drop table greetings. */

drop table greetings;




/* ============================================================
   🧩 SECTION C: PRACTICAL DDL & DML TASKS (40)


   
/* Q61. In sql_bootcamp database, create schema daily if not exists. */

 create schema if not exists daily;

/* Q62. Create table daily_products(product_id SERIAL, name TEXT, price NUMERIC). */

Create table daily_products(product_id SERIAL PRIMARY key, name TEXT, price NUMERIC);

drop table daily_products;
/* Q63. Insert 3 sample products. */

insert into daily_products(product_id,name,price)
VALUES(01,'pen',5),
		(02,'book',10),
		(03,'pad',30);

SELECT * FROM daily_products;

DELETE FROM daily_products
WHERE product_id = 1;


/* Q65. Update price of first product to 499. */

UPDATE daily_products
SET price = 499
WHERE product_id = 2;

/* Q66. Delete one record from daily_products. */

DELETE FROM daily_products
WHERE product_id = 3;


/* Q67. Create table daily_customers(customer_id SERIAL, name TEXT, city TEXT). */


Create table daily_customers(customer_id SERIAL, name TEXT, city TEXT);

/* Q69. Create table daily_orders(order_id SERIAL, product_id INT, customer_id INT). */

Create table daily_orders(order_id SERIAL, product_id INT, customer_id INT);

/* Q70. Insert 2 sample orders. */

insert into daily_orders(order_id,product_id,customer_id)
VALUES(01,867,8785),
		(02,9867,478);
SELECT * from daily_orders;

/* Q72. Join daily_orders with daily_customers to show order with customer name. */



/* Q73. Alter daily_products add column stock INT. */

/* Q75. Drop column stock from daily_products. */

/* Q76. Rename column name to product_name in daily_products. */

/* Q77. Delete all data from daily_orders without dropping it. */

/* Q78. Drop daily_orders table. */

/* Q81. Retrieve 5 rows from retailmart.products. */

/* Q82. Retrieve all unique categories from retailmart.products. */

/* Q83. Count total products in retailmart.products. */

/* Q84. Show top 3 most expensive products from retailmart.products. */

/* Q88. Retrieve all products where price > 1000. */

/* Q99. Retrieve first 5 records from retailmart.products ordered by price. */