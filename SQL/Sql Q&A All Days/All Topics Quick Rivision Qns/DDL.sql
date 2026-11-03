-- ============================================================
-- SQL PRACTICE — TOPIC 2: DDL (Data Definition Language)
-- Dataset: RetailMart (PostgreSQL)
-- Concepts: CREATE, ALTER, DROP, TRUNCATE, INDEX,
--            Constraints, Data Types, Schema Management
-- ============================================================


-- ============================================================
-- SECTION 1: SCHEMA & TABLE MANAGEMENT (Q1-Q4)
-- ============================================================

-- Q1. Create a new schema called reporting

CREATE SCHEMA reporting;

-- NOTE:
-- Schemas are like folders inside a database
-- Must create schema before creating tables inside it
-- DROP SCHEMA reporting CASCADE; -- drops schema + all tables inside


-- ---------------------------------------------------------------

-- Q2. Create reporting.monthly_targets table

CREATE TABLE reporting.monthly_targets (
    target_id      SERIAL PRIMARY KEY,
    month          INT,
    year           INT,
    target_revenue DECIMAL(10,2),
    target_orders  INT,
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_achieved    BOOLEAN DEFAULT FALSE
);

-- NOTE:
-- SERIAL = auto-increment integer (PostgreSQL specific)
-- DECIMAL(10,2) = 10 total digits, 2 after decimal point
-- DEFAULT CURRENT_TIMESTAMP = auto fills insert time (not DEFAULT TIMESTAMP)
-- BOOLEAN DEFAULT FALSE = true/false column defaulting to false


-- ---------------------------------------------------------------

-- Q3. Drop reporting schema with all tables inside

DROP SCHEMA IF EXISTS reporting CASCADE;

-- NOTE:
-- CASCADE automatically drops all objects inside the schema
-- Without CASCADE: error if schema has tables
-- IF EXISTS prevents error if schema doesn't exist
-- Dropping tables one by one first also works but CASCADE is cleaner


-- ---------------------------------------------------------------

-- Q4. Truncate analytics.sales_summary (remove all rows, keep table)

-- First recreate the table since we rolled back earlier
CREATE TABLE analytics.sales_summary (
    summary_id    SERIAL PRIMARY KEY,
    month         INT,
    year          INT,
    total_revenue INT,
    total_orders  INT
);

TRUNCATE TABLE analytics.sales_summary;

-- NOTE:
-- TRUNCATE removes ALL rows but keeps table structure intact
-- DROP TABLE removes the table itself entirely
-- TRUNCATE vs DELETE:
--   TRUNCATE: faster, cannot use WHERE, resets SERIAL counter, cannot rollback
--   DELETE: slower, can use WHERE, does not reset SERIAL, can rollback


-- ============================================================
-- SECTION 2: COLUMN OPERATIONS (Q5-Q7)
-- ============================================================

-- Q5. Add three columns at once to analytics.sales_summary

ALTER TABLE analytics.sales_summary
ADD COLUMN phone     TEXT,
ADD COLUMN age       INT,
ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- NOTE:
-- Multiple ADD COLUMN in one ALTER TABLE statement
-- Each separated by comma
-- No brackets around all columns — each ADD COLUMN is separate
-- DEFAULT TRUE applies only to is_active, not all columns


-- ---------------------------------------------------------------

-- Q6. Drop phone and age columns together

ALTER TABLE analytics.sales_summary
DROP COLUMN phone,
DROP COLUMN age;

-- NOTE:
-- Multiple DROP COLUMN in one ALTER TABLE statement
-- DROP COLUMN (singular) not DROP COLUMNS
-- Each separated by comma
-- Add CASCADE if other objects depend on the column:
--   DROP COLUMN phone CASCADE


-- ---------------------------------------------------------------

-- Q7. Change total_revenue from INT to DECIMAL(15,2)

ALTER TABLE analytics.sales_summary
ALTER COLUMN total_revenue TYPE DECIMAL(15,2);

-- NOTE:
-- ALTER COLUMN column_name TYPE new_datatype
-- Do NOT include old datatype — only new datatype after TYPE
-- Going from smaller to larger type is safe (INT -> DECIMAL)
-- Going from larger to smaller may fail if data exceeds new limit
-- USING clause needed for incompatible conversions:
--   ALTER COLUMN col TYPE INT USING col::INT


-- ============================================================
-- SECTION 3: CONSTRAINTS (Q8-Q10)
-- ============================================================

-- Q8. Add NOT NULL constraint to total_orders column

ALTER TABLE analytics.sales_summary
ALTER COLUMN total_orders SET NOT NULL;

-- NOTE:
-- SET NOT NULL adds not null constraint to existing column
-- Will fail if column already has NULL values
-- To remove: ALTER COLUMN total_orders DROP NOT NULL
-- Different from CHECK — NOT NULL is a separate constraint type


-- ---------------------------------------------------------------

-- Q9. Add FOREIGN KEY constraint linking summary_id to sales.orders

ALTER TABLE analytics.sales_summary
ADD CONSTRAINT fk_summary_orders FOREIGN KEY (summary_id) REFERENCES sales.orders(order_id);

-- NOTE:
-- ADD CONSTRAINT constraint_name FOREIGN KEY (column) REFERENCES schema.table(column)
-- Column must be in brackets: FOREIGN KEY (summary_id)
-- Convention: fk_sourcetable_targettable
-- Referenced column must be PRIMARY KEY or UNIQUE in target table
-- ON DELETE CASCADE can be added to auto-delete child rows:
--   REFERENCES sales.orders(order_id) ON DELETE CASCADE


-- ---------------------------------------------------------------

-- Q10. Drop the fk_summary_orders constraint

ALTER TABLE analytics.sales_summary
DROP CONSTRAINT fk_summary_orders;

-- NOTE:
-- DROP CONSTRAINT constraint_name
-- Works for all constraint types: CHECK, UNIQUE, FOREIGN KEY
-- For NOT NULL specifically: ALTER COLUMN col DROP NOT NULL
-- Constraint name needed — reason why naming constraints is important


-- ============================================================
-- SECTION 4: INDEXES & RENAME (Q11-Q14)
-- ============================================================

-- Q11. Create index on order_date in sales.orders

CREATE INDEX idx_orders_order_date ON sales.orders(order_date);

-- NOTE:
-- CREATE INDEX is standalone — NOT part of ALTER TABLE
-- Convention: idx_tablename_columnname
-- Indexes speed up SELECT queries on that column
-- Too many indexes slow down INSERT/UPDATE/DELETE


-- ---------------------------------------------------------------

-- Q12. Create unique index on prod_name in products.products

CREATE UNIQUE INDEX idx_products_prod_name ON products.products(prod_name);

-- NOTE:
-- UNIQUE INDEX = no duplicate values allowed in that column
-- Difference from UNIQUE constraint: index also improves query speed
-- UNIQUE constraint internally creates a unique index anyway


-- ---------------------------------------------------------------

-- Q13. Drop the idx_orders_order_date index

DROP INDEX idx_orders_order_date;

-- NOTE:
-- DROP INDEX is standalone — NOT part of ALTER TABLE
-- IF EXISTS can be added: DROP INDEX IF EXISTS idx_orders_order_date
-- PostgreSQL does not need table name in DROP INDEX


-- ---------------------------------------------------------------

-- Q14. Rename analytics.sales_summary to analytics.revenue_summary

ALTER TABLE analytics.sales_summary
RENAME TO revenue_summary;

-- NOTE:
-- RENAME TO new_name (not full schema path after RENAME TO)
-- Schema stays the same — only table name changes
-- Full schema.table path needed in ALTER TABLE part


-- ============================================================
-- SECTION 5: MISC DDL (Q15-Q25)
-- ============================================================

-- Q15. Add NOT NULL to feedback_text in customer_feedback

ALTER TABLE customers.customer_feedback
ALTER COLUMN feedback_text SET NOT NULL;


-- ---------------------------------------------------------------

-- Q16. Drop chk_rating constraint from customer_feedback

ALTER TABLE customers.customer_feedback
DROP CONSTRAINT chk_rating;


-- ---------------------------------------------------------------

-- Q17. Add CHECK constraint on rating in customer_feedback

ALTER TABLE customers.customer_feedback
ADD CONSTRAINT chk_rating CHECK (rating BETWEEN 1 AND 5);


-- ---------------------------------------------------------------

-- Q18. Add UNIQUE constraint on email in customers.customers

-- Option 1: Add new column with UNIQUE inline
ALTER TABLE customers.customers
ADD COLUMN email TEXT UNIQUE;

-- Option 2: Add constraint to existing column
ALTER TABLE customers.customers
ADD CONSTRAINT unq_email UNIQUE (email);


-- ---------------------------------------------------------------

-- Q19. Drop email column from customers.customers

ALTER TABLE customers.customers
DROP COLUMN email;


-- ---------------------------------------------------------------

-- Q20. Add DEFAULT 'Unknown' to city column in customers.addresses

ALTER TABLE customers.addresses
ALTER COLUMN city SET DEFAULT 'Unknown';

-- NOTE:
-- SET DEFAULT 'value' adds default to existing column
-- To remove default: ALTER COLUMN city DROP DEFAULT
-- Only affects future inserts — existing NULL rows stay NULL


-- ---------------------------------------------------------------

-- Q21. Remove DEFAULT from city column

ALTER TABLE customers.addresses
ALTER COLUMN city DROP DEFAULT;


-- ---------------------------------------------------------------

-- Q22. Create schema if not exists

CREATE SCHEMA IF NOT EXISTS reporting;

-- NOTE:
-- IF NOT EXISTS prevents error if schema already exists
-- Safe to use in scripts that may run multiple times


-- ---------------------------------------------------------------

-- Q23. Drop customer_reviews table safely

DROP TABLE IF EXISTS customers.customer_reviews;


-- ---------------------------------------------------------------

-- Q24. Rename column reward_points back to loyalty_points

ALTER TABLE customers.customers
RENAME COLUMN reward_points TO loyalty_points;


-- ---------------------------------------------------------------

-- Q25. Drop loyalty_points column

ALTER TABLE customers.customers
DROP COLUMN loyalty_points;


-- ============================================================
-- DDL QUICK REFERENCE CARD
-- ============================================================

-- CREATE:
--   CREATE SCHEMA name;
--   CREATE SCHEMA IF NOT EXISTS name;
--   CREATE TABLE schema.table (col datatype constraints, ...);
--   CREATE INDEX idx_name ON schema.table(col);
--   CREATE UNIQUE INDEX idx_name ON schema.table(col);

-- ALTER TABLE:
--   ADD COLUMN col datatype;
--   ADD COLUMN col1 dt, ADD COLUMN col2 dt;   -- multiple
--   DROP COLUMN col;
--   DROP COLUMN col1, DROP COLUMN col2;        -- multiple
--   RENAME COLUMN old TO new;
--   ALTER COLUMN col TYPE new_datatype;
--   ALTER COLUMN col SET NOT NULL;
--   ALTER COLUMN col DROP NOT NULL;
--   ALTER COLUMN col SET DEFAULT value;
--   ALTER COLUMN col DROP DEFAULT;
--   ADD CONSTRAINT name CHECK (condition);
--   ADD CONSTRAINT name UNIQUE (col);
--   ADD CONSTRAINT name FOREIGN KEY (col) REFERENCES schema.table(col);
--   DROP CONSTRAINT name;
--   RENAME TO new_name;

-- DROP:
--   DROP TABLE IF EXISTS schema.table;
--   DROP SCHEMA IF EXISTS name CASCADE;
--   DROP INDEX IF EXISTS idx_name;

-- TRUNCATE:
--   TRUNCATE TABLE schema.table;

-- CONSTRAINT NAMING CONVENTIONS:
--   Primary Key  : pk_tablename
--   Foreign Key  : fk_sourcetable_targettable
--   Unique       : unq_columnname
--   Check        : chk_columnname
--   Index        : idx_tablename_columnname

-- DATA TYPES CHEAT SHEET:
--   SERIAL          auto-increment integer (PK)
--   INT / BIGINT    whole numbers
--   DECIMAL(p,s)    exact decimal (p=total digits, s=decimal places)
--   FLOAT           approximate decimal
--   TEXT            unlimited string
--   VARCHAR(n)      string with max length n
--   CHAR(n)         fixed length string
--   DATE            date only (2023-01-15)
--   TIMESTAMP       date + time (2023-01-15 10:30:00)
--   BOOLEAN         true/false
--   UUID            unique identifier

-- ============================================================
-- TOPIC 2 DDL COMPLETE — 25 QUESTIONS
-- Key concepts covered:
-- ✅ CREATE SCHEMA, DROP SCHEMA CASCADE
-- ✅ CREATE TABLE with all constraint types
-- ✅ SERIAL, DECIMAL, TEXT, TIMESTAMP, BOOLEAN data types
-- ✅ TRUNCATE vs DELETE vs DROP TABLE
-- ✅ ADD COLUMN (single and multiple)
-- ✅ DROP COLUMN (single and multiple)
-- ✅ RENAME COLUMN
-- ✅ ALTER COLUMN TYPE
-- ✅ SET NOT NULL / DROP NOT NULL
-- ✅ SET DEFAULT / DROP DEFAULT
-- ✅ ADD CONSTRAINT CHECK, UNIQUE, FOREIGN KEY
-- ✅ DROP CONSTRAINT
-- ✅ CREATE INDEX, CREATE UNIQUE INDEX
-- ✅ DROP INDEX
-- ✅ RENAME TO (table rename)
-- ✅ IF EXISTS / IF NOT EXISTS safety checks
-- ✅ Constraint naming conventions
-- ✅ Data types cheat sheet
-- ============================================================