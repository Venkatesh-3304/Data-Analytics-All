🔒 SECTION B: CONSTRAINTS & KEYS TASKS (40)
   (All tasks in daily; create NEW tables only.)



/* Q21. Create table d3_products(
         product_id SERIAL PRIMARY KEY,
         sku VARCHAR(30) UNIQUE,
         product_name TEXT NOT NULL
       ). */


Create table d3_products(
         product_id SERIAL PRIMARY KEY,
         sku VARCHAR(30) UNIQUE,
         product_name TEXT NOT NULL);


/* Q22. Insert 3 rows into d3_products (with unique sku). */

INSERT INTO d3_products(product_id,sku,product_name)
		VALUES(01,'KLJHADS','MOBILE'),
			(02,'KHADS','WATCH'),
			(03,'KLJS','BUDS');

SELECT * FROM d3_products;

/* Q23. Try inserting a row with NULL product_name to see NOT NULL behavior (then rollback/comment). */
       
/* INSERT INTO d3_products(product_id,sku,product_name)
		VALUES(04,'KLDS');	


/* Q24. Create table d3_customers(
         customer_id SERIAL PRIMARY KEY,
         customer_code VARCHAR(20) UNIQUE,
         full_name TEXT NOT NULL,
         city TEXT DEFAULT 'Unknown'
       ). */
	   

Create table d3_customers(
         customer_id SERIAL PRIMARY KEY,
         customer_code VARCHAR(20) UNIQUE,
         full_name TEXT NOT NULL,
         city TEXT DEFAULT 'Unknown'
       )


/* Q25. Insert 3 customers; omit city for at least one to use DEFAULT. */

INSERT INTO d3_customers (customer_code, full_name,city)
VALUES
    
	 ('C005', 'Ravi','mumbai'),
	  ('C006', 'Sumi','vizag');

SELECT * FROM d3_customers;
SELECT * FROM d3_orders;


/* Q26. Create table d3_orders(
         order_id SERIAL PRIMARY KEY,
         customer_id INT REFERENCES daily.d3_customers(customer_id),
         order_date DATE DEFAULT CURRENT_DATE
       ). */

CREATE TABLE d3_orders(order_id serial primary key,
						customer_id int REFERENCES d3_customers(customer_id),
						order_date date DEFAULT current_date);

/* Q27. Insert 3 orders with valid customer_id values. */

INSERT INTO d3_orders (customer_id)
VALUES
    (1),
	(3),
	(4);

/* Q28. Attempt to insert an order with a non-existent customer_id (expect FK failure; then comment). */


INSERT INTO d3_orders (customer_id)
VALUES
    (2);

	RESULT: ERROR:  insert or update on table "d3_orders" violates foreign key constraint "d3_orders_customer_id_fkey"
Key (customer_id)=(2) is not present in table "d3_customers". 

SQL state: 23503
Detail: Key (customer_id)=(2) is not present in table "d3_customers".


/* Q29. Create table d3_inventory(
         product_id INT REFERENCES daily.d3_products(product_id),
         location TEXT,
         qty INT CHECK (qty >= 0)
       ). */

Create table d3_inventory(
         product_id INT REFERENCES d3_products(product_id),
         location TEXT,
         qty INT CHECK (qty >= 0)
       );


/* Q30. Insert 3 inventory rows ensuring qty >= 0. */

INSERT INTO d3_inventory(product_id,"location",qty)
		VALUES(1,'SALUR',5),
		(2,'KOTTAKKI',10),
		(3,'BAM',67);

SELECT * FROM D3_INVENTORY;
SELECT * FROM D3_PRODUCTS;

/* Q31. Try inserting qty = -5 to observe CHECK failure (comment result). */


INSERT INTO d3_products(product_id,sku,product_name)
		VALUES(04,'JAFFA','MOUSE');
		
INSERT INTO d3_inventory(product_id,"location",qty)
		VALUES(04,'VZM',-5);

		RESULT:::   ERROR:  new row for relation "d3_inventory" violates check constraint "d3_inventory_qty_check"
Failing row contains (4, VZM, -5). 

SQL state: 23514
Detail: Failing row contains (4, VZM, -5).


/* Q32. Add a UNIQUE constraint on (product_id, location) for d3_inventory (composite unique). */


ALTER TABLE d3_inventory
ADD UNIQUE (product_id, location);



/* Q33. Insert a duplicate (product_id, location) pair to test the unique pair (expect failure; comment). */


INSERT INTO d3_inventory(product_id,"location",qty)
		VALUES(1,'SALUR',5);
result:::::::::::::::: 

                ERROR:  duplicate key value violates unique constraint "uq_d3_inventory_product_location"
                Key (product_id, location)=(1, SALUR) already exists. 
                
                SQL state: 23505
                Detail: Key (product_id, location)=(1, SALUR) already exists.


/* Q34. Create table d3_categories(
         category_id SERIAL PRIMARY KEY,
         category_name TEXT UNIQUE NOT NULL
       ). */

Create table d3_categories(
         category_id SERIAL PRIMARY KEY,
         category_name TEXT UNIQUE NOT NULL
       )

/* Q35. Insert 3 categories. */

insert into d3_categories(category_id,category_name)
		VALUES('01','Gadgets'),
		('02','home'),
		('03','grocery');

/* Q36. Create table d3_product_category_map(
         product_id INT REFERENCES daily.d3_products(product_id),
         category_id INT REFERENCES daily.d3_categories(category_id),
         PRIMARY KEY(product_id, category_id)
       ). */

Create table d3_product_category_map(
         product_id INT REFERENCES d3_products(product_id),
         category_id INT REFERENCES d3_categories(category_id),
         PRIMARY KEY(product_id, category_id)
       )


/* Q37. Insert 3 mappings ensuring valid product and category references. */

SELECT  * from d3_products;
SELECT  * from d3_categories;
SELECT  * from d3_product_category_map;

insert into  d3_product_category_map(product_id,category_id)
 values(1,1),
 (2,2),
 (5,4);

/* Q38. Attempt a duplicate mapping to test composite PK violation (comment). */

SELECT  * from d3_products;
SELECT  * from d3_categories;
SELECT  * from d3_product_category_map;

insert into  d3_product_category_map(product_id,category_id)
 values(1,1);

 result:::
				ERROR:  duplicate key value violates unique constraint "d3_product_category_map_pkey"
				Key (product_id, category_id)=(1, 1) already exists. 

				SQL state: 23505
				Detail: Key (product_id, category_id)=(1, 1) already exists.
 
/* Q39. Create table d3_staff(
         staff_id SERIAL PRIMARY KEY,
         staff_code VARCHAR(10) UNIQUE,
         role TEXT CHECK (role IN ('Analyst','Manager','Clerk'))
       ). */