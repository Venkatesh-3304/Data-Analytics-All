-- ============================================================
--         TCS NQT SQL PRACTICE QUESTIONS
--         Dataset: employees + departments
-- ============================================================

-- TABLE STRUCTURE
-- employees  : emp_id, emp_name, department, salary
-- departments: dep_id, dep_name, location

-- ============================================================
-- Q1: Total salary per department ordered by total salary DESC
-- ============================================================

-- Approach 1: JOIN
SELECT d.dep_name,
       SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
    ON e.department = d.dep_name
GROUP BY d.dep_name
ORDER BY total_salary DESC;

-- ============================================================
-- Q2: Department with highest average salary
-- ============================================================

-- Approach 1: LIMIT
SELECT d.dep_name,
       AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
    ON e.department = d.dep_name
GROUP BY d.dep_name
ORDER BY avg_salary DESC
LIMIT 1;

-- Approach 2: Subquery (without LIMIT)
SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) = (
    SELECT MAX(avg_sal)
    FROM (
        SELECT AVG(salary) AS avg_sal
        FROM employees
        GROUP BY department
    ) t
);

-- ============================================================
-- Q3: Employees earning more than their department average
-- ============================================================

-- Approach 1: Subquery (Derived Table)
SELECT e.emp_name,
       e.department,
       e.salary
FROM employees e
JOIN (
    SELECT department,
           AVG(salary) AS avg_dept_salary
    FROM employees
    GROUP BY department
) d
ON e.department = d.department
WHERE e.salary > d.avg_dept_salary;

-- Approach 2: CTE
WITH avg_dept_salary AS (
    SELECT department,
           AVG(salary) AS avg_dept_salary
    FROM employees
    GROUP BY department
)
SELECT e.emp_name,
       e.department,
       e.salary
FROM employees e
JOIN avg_dept_salary a
    ON e.department = a.department
WHERE e.salary > a.avg_dept_salary;

-- Approach 3: Correlated Subquery
SELECT emp_name,
       department,
       salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- ============================================================
-- Q4: Second highest salary
-- ============================================================

-- Approach 1: Subquery + MAX
SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- Approach 2: LIMIT + OFFSET
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- Approach 3: DENSE_RANK (Best for Nth highest)
SELECT salary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 2;

-- ============================================================
-- Q5: Departments with more than 2 employees
-- ============================================================

-- Approach 1: HAVING
SELECT department,
       COUNT(emp_name) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(emp_name) > 2;

-- Approach 2: Subquery
SELECT department, emp_count
FROM (
    SELECT department,
           COUNT(emp_name) AS emp_count
    FROM employees
    GROUP BY department
) t
WHERE emp_count > 2;

-- Approach 3: CTE
WITH dept_count AS (
    SELECT department,
           COUNT(emp_name) AS emp_count
    FROM employees
    GROUP BY department
)
SELECT department, emp_count
FROM dept_count
WHERE emp_count > 2;

-- ============================================================
-- Q6: Departments with NO employees
-- ============================================================

-- Approach 1: NOT EXISTS
SELECT d.dep_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE d.dep_name = e.department
);

-- Approach 2: LEFT JOIN + NULL check
SELECT d.dep_name
FROM departments d
LEFT JOIN employees e
    ON d.dep_name = e.department
WHERE e.emp_id IS NULL;

-- Approach 3: NOT IN
SELECT dep_name
FROM departments
WHERE dep_name NOT IN (
    SELECT DISTINCT department
    FROM employees
);

-- ============================================================
-- Q7: Highest earning employee per department (including ties)
-- ============================================================

-- Approach 1: CTE + DENSE_RANK
WITH cte AS (
    SELECT emp_name,
           department,
           salary,
           DENSE_RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rnk
    FROM employees
)
SELECT emp_name,
       department,
       salary
FROM cte
WHERE rnk = 1;

-- Approach 2: Subquery
SELECT e.emp_name,
       e.department,
       e.salary
FROM employees e
JOIN (
    SELECT department,
           MAX(salary) AS max_salary
    FROM employees
    GROUP BY department
) d
ON e.department = d.department
AND e.salary = d.max_salary;

-- ============================================================
-- Q8: Department summary (total, average salary, employee count)
-- ============================================================

-- Approach 1: Direct Aggregation
SELECT department,
       SUM(salary)   AS total_salary,
       AVG(salary)   AS avg_salary,
       COUNT(emp_name) AS emp_count
FROM employees
GROUP BY department
ORDER BY emp_count DESC;

-- ============================================================
-- Q9: Rank employees within department (RANK - skips ranks on tie)
-- ============================================================

-- Approach 1: CTE + RANK
WITH emp_rank AS (
    SELECT emp_name,
           department,
           salary,
           RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rnk
    FROM employees
)
SELECT emp_name,
       department,
       salary,
       rnk
FROM emp_rank;

-- Approach 2: Subquery + RANK
SELECT emp_name,
       department,
       salary,
       rnk
FROM (
    SELECT emp_name,
           department,
           salary,
           RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rnk
    FROM employees
) t;

-- ============================================================
-- Q10: Employees earning above company average + salary difference
-- ============================================================

-- Approach 1: CTE
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.emp_name,
       e.department,
       e.salary,
       e.salary - a.avg_salary AS salary_diff
FROM employees e
JOIN company_avg a
    ON e.salary > a.avg_salary
ORDER BY salary_diff DESC;

-- Approach 2: Subquery
SELECT emp_name,
       department,
       salary,
       salary - (SELECT AVG(salary) FROM employees) AS salary_diff
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary_diff DESC;

-- ============================================================
-- QUICK REFERENCE
-- ============================================================

-- RANK()       → 1,1,3   (skips rank on tie)
-- DENSE_RANK() → 1,1,2   (no skip on tie)
-- ROW_NUMBER() → 1,2,3   (unique always)

-- WHERE  → filters rows BEFORE grouping
-- HAVING → filters AFTER grouping (on aggregates)

-- GROUP BY needed  → average per group (multiple rows)
-- No GROUP BY      → average for whole table (single value)

-- NOT EXISTS  → most efficient for "no match" queries
-- LEFT JOIN + NULL → most common/readable
-- NOT IN      → avoid when subquery can return NULLs