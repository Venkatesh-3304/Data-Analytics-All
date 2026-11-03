
-- =====================
-- SECTION A: SELF JOIN (Q1-Q35)
-- =====================


-- Q1. The HR head at RetailMart wants to identify pairs of employees who work in the same store. 
--     This will help in understanding team compositions across different locations.

-- Q2. Flipkart's talent acquisition team is curious about employees who earn exactly the same salary. 
--     They want to spot potential pay band patterns.

-- Q3. The regional manager wants to find customers who reside in the same city. 
--     This helps in planning city-specific marketing campaigns.

-- Q4. BigBasket's category manager notices some products share identical prices. 
--     They need to identify such product pairs for pricing review.

-- Q5. The store operations team wants to know which stores are located in the same state. 
--     This is needed for regional inventory sharing programs.

-- Q6. Zomato's HR team needs to find employees belonging to the same department. 
--     They're planning department-wise team building activities.

-- Q7. The inventory team at Myntra wants to identify products from the same brand. 
--     This helps in creating brand-specific promotional bundles.

-- Q8. RetailMart's customer success team wants to find pairs of customers who joined on the same date. 
--     These could be referral pairs.

-- Q9. The payroll team wants to compare each employee's salary with other employees in their department 
--     to find who earns more than their colleagues.

-- Q10. Amazon India's warehouse team wants to identify products from the same supplier 
--      but with different prices. This helps in supplier negotiation.

-- Q11. The Ola driver management team (imagine employees as drivers) wants to find pairs of employees 
--      who have the same role but different salaries. This is for salary standardization.

-- Q12. PhonePe's analytics team wants to find customers from the same region 
--      who might have similar purchasing behaviors.

-- Q13. The store planning team needs to identify stores in the same city 
--      to analyze cannibalization effects.

-- Q14. Swiggy's HR wants to find employees with different roles but similar salaries 
--      to understand role-salary alignment.

-- Q15. The marketing team wants to find pairs of customers with the same gender 
--      who live in different cities. This is for diverse focus group selection.

-- Q16. IRCTC's operations team wants to compare stores where one store's name 
--      comes before another alphabetically. Simple listing for directory purposes.

-- Q17. The product team wants to find products in the same category 
--      but from different brands for competitive analysis.

-- Q18. Reliance Retail's HR wants to identify employees at the same store 
--      who have different departments. This shows store department diversity.

-- Q19. The customer insights team wants to find pairs of customers 
--      where one is older than the other and both are from the same state.

-- Q20. BigBasket wants to find products from the same category 
--      where one product costs at least double the other.

-- Q21. The training team wants to find employee pairs from the same department 
--      where one earns at least 20% more than the other.

-- Q22. Myntra's merchandising team wants to spot products from the same supplier 
--      in different categories. This shows supplier diversification.

-- Q23. The store network team wants to identify stores in different cities 
--      but the same region. This helps understand regional spread.

-- Q24. Flipkart's people team wants to find employees with the same role 
--      across different stores. This helps in role standardization.

-- Q25. The loyalty team wants to find customer pairs from the same city 
--      with significantly different loyalty points (difference > 1000).

-- Q26. Amazon's pricing team wants to compare products where both are from the same brand 
--      and one is priced higher than the other.

-- Q27. The recruitment team wants to find departments that share employees with other departments 
--      (employees who could be cross-trained).

-- Q28. Zomato's city expansion team wants to know which cities have both customers and stores. 
--      Start by finding customer pairs in same cities.

-- Q29. The HR analytics team wants to find employees in different stores 
--      but earning identical salaries. This could indicate pay band alignment.

-- Q30. RetailMart wants to identify customers of the same age group (same age) 
--      but different genders for demographic analysis.

-- Q31. The vendor management team wants to find suppliers whose names start with the same letter. 
--      This is for alphabetical directory grouping.

-- Q32. Paytm Mall wants to find stores in the same state where one store's name 
--      is alphabetically after the other. Simple listing exercise.

-- Q33. The customer service team wants to identify pairs of customers 
--      where both have addresses in the same city (using addresses table).

-- Q34. BigBasket's assortment team wants to find product pairs from different categories 
--      but same brand. This shows brand category coverage.

-- Q35. The analytics team wants to find employee pairs where one joined 
--      at a store in a different region than the other's store.

-- =====================
-- SECTION B: CROSS JOIN (Q36-Q55)
-- =====================

-- Q36. RetailMart's inventory planning team wants to see every possible combination 
--      of products and stores. This is the starting point for stock allocation planning.

-- Q37. The marketing team at Flipkart wants to generate all possible combinations 
--      of regions and product categories for campaign targeting.

-- Q38. Zomato's promotion team needs a list showing every product 
--      paired with every available promotion. This is for promotion eligibility analysis.

-- Q39. The HR team wants to create a matrix of all departments and all stores 
--      to plan potential team placements.

-- Q40. BigBasket's pricing team wants to see every combination of brands and categories 
--      to understand market coverage opportunities.

-- Q41. The logistics team wants to pair every store with every region 
--      to analyze potential delivery route expansions.

-- Q42. Myntra's visual merchandising team wants to combine every category 
--      with every store for display planning purposes.

-- Q43. The campaign planning team needs to pair every marketing campaign 
--      with every store to track campaign reach.

-- Q44. Amazon India's expansion team wants to see every city (from stores) 
--      combined with every region for market analysis.

-- Q45. The supplier relationship team wants to pair every supplier 
--      with every category to identify partnership gaps.

-- Q46. PhonePe's analytics team wants to combine every payment mode 
--      (imagine distinct payment modes) with every store.

-- Q47. The product launch team wants to pair the first 5 products 
--      with the first 5 stores for pilot launch planning.

-- Q48. Swiggy's planning team wants to combine all unique states from customers 
--      with all unique states from stores.

-- Q49. The training department wants to pair every department 
--      with every employee role to create training matrices.

-- Q50. RetailMart's market research team wants to combine every brand 
--      with every region for brand awareness studies.

-- Q51. The space planning team wants to pair the top 10 products by price 
--      with all stores for premium placement analysis.

-- Q52. Flipkart's category team wants to combine categories with brands 
--      to find gaps in product assortment.

-- Q53. The events team wants to pair every store with every month (1-12) 
--      for annual event planning. Use generate_series or dim_date.

-- Q54. BigBasket wants to create a matrix of customer cities 
--      and store cities for delivery feasibility analysis.

-- Q55. The sales planning team wants to pair every quarter (from dim_date) 
--      with every store for quarterly target setting.

-- =====================
-- SECTION C: UNION & UNION ALL (Q56-Q75)
-- =====================

-- Q56. The operations team wants a combined list of all cities 
--      where either a customer lives or a store is located, without duplicates.

-- Q57. Zomato's data team needs a master list of all person names, 
--      combining customer names and employee names, removing duplicates.

-- Q58. The geographic team wants all states mentioned in the database, 
--      whether from customers, stores, or addresses, without repeats.

-- Q59. RetailMart's finance team wants to combine expense dates from stores 
--      with expense dates from finance, including all occurrences.

-- Q60. The marketing analytics team wants a list of all dates 
--      when either an order was placed or a campaign started.

-- Q61. Flipkart's contact center wants all unique city names 
--      from both customer addresses and store locations.

-- Q62. The compliance team needs all dates when money moved: 
--      either payment dates or expense dates.

-- Q63. BigBasket's catalog team wants a combined list 
--      of all category names from products and dim_category.

-- Q64. The PR team wants all unique brand names 
--      appearing in either products table or dim_brand table.

-- Q65. Myntra's customer team wants to combine customer join dates 
--      with order dates to see all significant customer activity dates.

-- Q66. The audit team needs a complete list of all amounts: 
--      order totals and expense amounts combined, keeping duplicates.

-- Q67. RetailMart wants all city names where either customers live 
--      or where they have addresses, removing duplicates.

SELECT 
    city 
FROM customers.customers
UNION
SELECT 
    city    
FROM customers.addresses;

-- Q68. The logistics team wants to combine shipped dates and delivered dates 
--      from shipments to get all logistics activity dates.

-- Q69. Swiggy's finance team wants all unique amounts that appear 
--      either as order totals or as payment amounts.

-- Q70. The HR team wants a combined list of dates 
--      when employees either attended work or received salary updates.

-- Q71. The product team wants to combine all product names 
--      with all store names into one master list of entity names.

-- Q72. Amazon's campaign team wants all dates relevant to marketing: 
--      campaign start dates, end dates, and email sent dates.

-- Q73. The customer 360 team wants all dates associated with customers: 
--      join dates, order dates, and review dates combined.

-- Q74. RetailMart's master data team wants a single list 
--      containing customer IDs and employee IDs together (as a number list).

-- Q75. The inventory team wants to combine product IDs from products table 
--      with product IDs from inventory table, keeping all occurrences.

-- =====================
-- SECTION D: INTERSECT (Q76-Q88)
-- =====================

-- Q76. The market penetration team wants to find cities 
--      where both customers live AND stores are located.

-- Q77. Flipkart's data quality team wants to identify product IDs 
--      that exist in both the products table and the order_items table.

-- Q78. The regional planning team wants states 
--      that appear in both customer data and store data.

-- Q79. BigBasket's inventory team wants to find product IDs 
--      present in both products and inventory tables.

-- Q80. The order fulfillment team wants dates 
--      when both orders were placed AND payments were made.

-- Q81. Myntra's customer insights team wants to find customer IDs 
--      who have both placed orders AND written reviews.

-- Q82. The pricing team wants amounts that appear 
--      as both payment amounts and order totals.

-- Q83. RetailMart wants to find product IDs 
--      that have been both ordered AND returned.

-- Q84. The email marketing team wants customer IDs 
--      who received emails AND also placed orders.

-- Q85. Zomato's analytics team wants to find dates 
--      when both campaigns were active AND orders were placed.

-- Q86. The store expansion team wants cities appearing 
--      in both stores table and customer addresses table.

-- Q87. The supplier team wants to find supplier IDs 
--      whose products appear in both products and inventory.

-- Q88. The finance team wants dates appearing 
--      in both expenses and revenue_summary tables.

-- =====================
-- SECTION E: EXCEPT (Q89-Q100)
-- =====================

-- Q89. The market expansion team wants cities where customers live 
--      but no store is located yet. Prime spots for new stores.

-- Q90. Flipkart's catalog team wants product IDs in the products table 
--      that have never been ordered.

-- Q91. The delivery team wants cities where stores exist 
--      but no customers currently live there.

-- Q92. BigBasket's dead stock team wants product IDs in inventory 
--      that haven't been ordered yet.

-- Q93. The customer acquisition team wants states with stores 
--      but no registered customers.

-- Q94. Myntra's engagement team wants customer IDs who placed orders 
--      but never wrote a review.

-- Q95. The returns analysis team wants product IDs that were ordered 
--      but never returned. These are satisfaction champions.

-- Q96. RetailMart's loyalty team wants customer IDs in the customers table 
--      who don't have loyalty points yet.

-- Q97. The payment reconciliation team wants order IDs 
--      that don't have corresponding payments.

-- Q98. Swiggy's campaign team wants customer IDs 
--      who placed orders but never received marketing emails.

-- Q99. The supplier performance team wants supplier IDs in products 
--      whose products are not in inventory at any store.

-- Q100. The HR team wants employee IDs 
--       who don't have any attendance records yet.

-- ============================================
-- END OF DAY 10 EASY QUESTIONS
-- ============================================



--- Q1. The HR head at RetailMart wants to identify pairs of employees who work in the same store. 
--     This will help in understanding team compositions across different locations.

select * FROM stores.employees;

SELECT
    e1.emp_id   AS emp1_id,
    e1.emp_name AS emp1_name,
    e2.emp_id   AS emp2_id,
    e2.emp_name AS emp2_name,
    e1.store_id
FROM stores.employees e1
JOIN stores.employees e2
    ON e1.store_id = e2.store_id
   AND e1.emp_id < e2.emp_id;
	 
-- Q2. Retailmart's talent acquisition team is curious about employees who earn exactly the same salary. 
--     They want to spot potential pay band patterns.


SELECT
    e1.emp_id   AS emp1_id,
    e1.emp_name AS emp1_name,
    e2.emp_id   AS emp2_id,
    e2.emp_name AS emp2_name,
    e1.salary
FROM stores.employees e1
JOIN stores.employees e2
    ON e1.salary = e2.salary
   AND e1.emp_id < e2.emp_id;

 
-- Q3. The regional manager wants to find customers who reside in the same city. 
--     This helps in planning city-specific marketing campaigns.

SELECT * FROM customers.customers

SELECT
	c1.cust_id as cust1_id,
	c1.full_name as cust1_name,
	c2.cust_id as cust2_id,
	c2.full_name as cust2_name,
	c1.city
FROM customers.customers c1
JOIN customers.customers c2
	on c1.city = c2.city
	and c1.cust_id < c2.cust_id; 

-- Q4. Retail martt's category manager notices some productsshare identical prices. 
--     They need to identify such product pairs for pricing review.
SELECT * from products.products

SELECT
	p1.prod_id as prod_id,
	p1.prod_name as prod1_name,
	p2.prod_id as prod_id,
	p2.prod_name as prod_name,
	p1.price
FROM products.products p1
JOIN products.products p2
	on p1.price = p2.price
	and p1.prod_id < p2.prod_id; 

-- Q5. The store operations team wants to know which stores are located in the same state. 
--     This is needed for regional inventory sharing programs.
SELECT * from stores.stores
SELECT
    s1.store_id   AS store1_id,
    s1.store_name AS store1_name,
    s2.store_id   AS store2_id,
    s2.store_name AS store2_name,
    s1.state
FROM stores.stores s1
JOIN stores.stores s2
    ON s1.state = s2.state
   AND s1.store_id < s2.store_id;


-- Q6. Zomato's HR team needs to find employees belonging to the same department. 
--     They're planning department-wise team building activities.

-- Q7. The inventory team at Myntra wants to identify products from the same brand. 
--     This helps in creating brand-specific promotional bundles.

-- Q8. RetailMart's customer success team wants to find pairs of customers who joined on the same date. 
--     These could be referral pairs.

-- Q9. The payroll team wants to compare each employee's salary with other employees in their department 
--     to find who earns more than their colleagues.


SELECT
    e1.emp_id   AS emp_id,
    e1.emp_name AS emp_name,
  	e1.dept_id,
    e1.salary
FROM stores.employees e1
JOIN stores.employees e2
    ON e1.salary = e2.salary
   AND e1.emp_id > e2.emp_id
GROUP BY
    e1.emp_id,
    e1.emp_name,
    e1.dept_id,
    e1.salary;


-- Q10. Amazon India's warehouse team wants to identify products from the same supplier 
--      but with different prices. This helps in supplier negotiation.

SELECT
    p1.supplier_id,
    p1.prod_id   AS prod1_id,
    p1.prod_name AS prod1_name,
    p1.price     AS prod1_price,
    p2.prod_id   AS prod2_id,
    p2.prod_name AS prod2_name,
    p2.price     AS prod2_price
FROM products.products p1
JOIN products.products p2
    ON p1.supplier_id = p2.supplier_id
   AND p1.price <> p2.price          -- different prices
   AND p1.prod_id < p2.prod_id;      -- avoid duplicates


   -- Q11. The Retailmart  management team wants to find pairs of employees 
--      who have the same role but different salaries. This is for salary standardization.

SELECT * from stores.employees
SELECT 
	e1.role,
	e1.emp_id   AS emp1_id,
    e1.emp_name AS emp1_name,
    e1.salary     AS emp1_salary,
    e2.emp_id   AS emp2_id,
    e2.emp_name AS emp2_name,
    e2.salary     AS emp2_salary
FROM stores.employees e1
JOIN stores.employees e2
    on e1.role = e2.role			-- same role
   AND e1.salary <> e2.salary         -- different salary  
   AND e1.emp_id < e2.emp_id;		 -- avoid duplicates
 

-- Q12. Retailmart's analytics team wants to find customers from the same region 
--      who might have similar purchasing behaviors.

SELECT * from customers.customers
EXPLAIN
SELECT
    c1.cust_id AS customer_1,
    c2.cust_id AS customer_2,
    c1.region_name
FROM customers.customers c1
JOIN customers.customers c2
  ON c1.region_name = c2.region_name
 AND c1.cust_id <> c2.cust_id;


-- Q13. The store planning team needs to identify stores in the same city 
--      to analyze cannibalization effects.

SELECT * from stores.stores

SELECT
	s1.store_id as Store1,
	s2.store_id as store2,
	s1.city
from stores.stores s1
join stores.stores s2
	on s1.city = s2.city
	and s1.store_id <> s2.store_id;
-- Q14. Retailmart's HR wants to find employees with different roles but similar salaries 
--      to understand role-salary alignment.

SELECT * from stores.employees;

SELECT e1.emp_name as emp1_name,
		e1.role as emp_role,
		e1.salary,
		e2.emp_name as emp2_name,
		e2.role as emp2_role
from stores.employees e1
JOIN stores.employees e2
	on e1.salary = e2.salary
	and e1.role <> e2.role
	and e1.emp_id > e2.emp_id;


-- Q15. The marketing team wants to find pairs of customers with the same gender 
--      who live in different cities. This is for diverse focus group selection.

SELECT * from customers.customers
EXPLAIN
SELECT
	c1.full_name as cust1_name,
	c1.city as cust1_city,
	c1.gender,
	c2.full_name as cust2_name,
	c2.city as cust2_city
from customers.customers c1
JOIN customers.customers c2
	on c1.gender = c2.gender
	and c1.city <> c2.city
	and c1.cust_id > c2.cust_id;

-- Q16. Retailmart's operations team wants to compare stores where one store's name 
--      comes before another alphabetically. Simple listing for directory purposes.

SELECT
    s1.store_name AS store1_name,
    s2.store_name AS store2_name
FROM stores.stores s1
JOIN stores.stores s2
    ON s1.store_name < s2.store_name;

-- Q17. The product team wants to find products in the same category 
--      but from different brands for competitive analysis.

SELECT * from sales.products

SELECT
    p1.prod_name AS prod1_name,
    p1.brand     AS prod1_brand,
    p1.category,
    p2.prod_name AS prod2_name,
    p2.brand     AS prod2_brand
FROM products.products p1
JOIN products.products p2
    ON p1.category = p2.category
   AND p1.brand <> p2.brand
   AND p1.prod_id > p2.prod_id;



-- Q18. Retailmart Retail's HR wants to identify employees at the same store 
--      who have different departments. This shows store department diversity.




-- Q18. Retailmart Retail's HR wants to identify employees at the same store 
--      who have different departments. This shows store department diversity.

SELECT * FROM STORES.departments
SELECT
    e1.emp_name AS emp1_name,
    e1.store_id,
    e1.dept_id  AS emp1_dept,
    e2.emp_name AS emp2_name,
    e2.dept_id  AS emp2_dept
FROM stores.employees e1
JOIN stores.employees e2
    ON e1.store_id = e2.store_id
   AND e1.dept_id <> e2.dept_id
   AND e1.emp_id < e2.emp_id;

-- Q19. The customer insights team wants to find pairs of customers 
--      where one is older than the other and both are from the same state.

SELECT * FROM customers.customers
SELECT
    c1.full_name AS older_customer,
    c1.age       AS older_age,
    c1.state,
    c2.full_name AS younger_customer,
    c2.age       AS younger_age
FROM customers.customers c1
JOIN customers.customers c2
    ON c1.state = c2.state
   AND c1.age > c2.age;


-- Q20. Retailmart wants to find products from the same category 
--      where one product costs at least double the other.

SELECT
    p1.prod_name AS expensive_product,
    p1.price     AS expensive_price,
    p1.category,
    p2.prod_name AS cheaper_product,
    p2.price     AS cheaper_price
FROM products.products p1
JOIN products.products p2
ON p1.category = p2.category
AND p1.price >= 2 * p2.price;




-- Q21. The training team wants to find employee pairs from the same department 
--      where one earns at least 20% more than the other.

SELECT
    e1.emp_name AS high_salary_emp,
    e1.salary   AS high_salary,
    e1.dept_id,
    e2.emp_name AS low_salary_emp,
    e2.salary   AS low_salary
FROM stores.employees e1
JOIN stores.employees e2
    ON e1.dept_id = e2.dept_id
   AND e1.salary >= 1.2 * e2.salary
   AND e1.emp_id > e2.emp_id;


-- Q22. Retailmart's merchandising team wants to spot products from the same supplier 
--      in different categories. This shows supplier diversification.

SELECT * from products.products

SELECT
    p1.prod_name AS prod1_name,
    p1.category    AS category1,
    p1.supplier_id,
       p2.prod_name AS prod2_name,
    p2.category    AS category2
FROM products.products p1
JOIN products.products p2
    ON p1.supplier_id = p2.supplier_id
   AND p1.category <> p2.category
   AND p1.prod_id > p2.prod_id;


-- Q23. The store network team wants to identify stores in different cities 
--      but the same region. This helps understand regional spread.


-- Q24. Flipkart's people team wants to find employees with the same role 
--      across different stores. This helps in role standardization.

-- Q25. The loyalty team wants to find customer pairs from the same city 
--      with significantly different loyalty points (difference > 1000).

SELECT * from customers.loyalty_points
SELECT
    c1.full_name AS higher_points_customer,
    l1.total_points AS higher_points,
	c1.city,
    c2.full_name AS lower_points_customer,
    l2.total_points AS lower_points
FROM customers.customers c1
JOIN customers.loyalty_points l1
    ON c1.cust_id = l1.cust_id
JOIN customers.customers c2
    ON c1.city = c2.city
JOIN customers.loyalty_points l2
    ON c2.cust_id = l2.cust_id
WHERE l1.total_points > l2.total_points + 1000;

-- Q26. Retailmart's pricing team wants to compare products where both are from the same brand 
--      and one is priced higher than the other.

SELECT
    p1.prod_name AS expensive_product,
    p1.price     AS expensive_price,
    p1.brand,
    p2.prod_name AS cheaper_product,
    p2.price     AS cheaper_price
FROM products.products p1
JOIN products.products p2
ON p1.brand = p2.brand
AND p1.price > p2.price;

-- Q27. The recruitment team wants to find departments that share employees with other departments 
--      (employees who could be cross-trained).

question was wrong

-- Q28. Retailmart's city expansion team wants to know which cities have both customers and stores. 
--      Start by finding customer pairs in same cities.

SELECT
    c1.full_name AS cust1_name,
    c1.city,
    c2.full_name AS cust2_name
FROM customers.customers c1
JOIN customers.customers c2
    ON c1.city = c2.city
   AND c1.cust_id < c2.cust_id;


-- Q29. The HR analytics team wants to find employees in different stores 
--      but earning identical salaries. This could indicate pay band alignment.

SELECT * from stores.employees

SELECT 
    e1.emp_name AS emp1_name,
    e1.store_id   AS emp1_store,
    e1.salary,
    e2.emp_name AS emp2_name,
    e2.store_id   AS emp2_store
FROM stores.employees e1
JOIN stores.employees e2
    ON e1.salary = e2.salary
   AND e1.store_id <> e2.store_id
   AND e1.emp_id > e2.emp_id;

-- Q30. RetailMart wants to identify customers of the same age group (same age) 
--      but different genders for demographic analysis.
select * from customers.customers
SELECT 
    c1.full_name AS cust1_name,
    c1.gender   AS cust1_gender,
    c1.age,
    c2.full_name AS cust1_name,
    c2.gender   AS cust1_gender
FROM customers.customers c1
JOIN customers.customers c2
    ON c1.age = c2.age
   AND c1.gender <> c2.gender
   AND c1.cust_id > c2.cust_id;

-- Q31. The vendor management team wants to find suppliers whose names start with the same letter. 
--      This is for alphabetical directory grouping.

SELECT
    s1.supplier_name AS supplier1_name,
    s2.supplier_name AS supplier2_name
FROM products.suppliers s1
JOIN products.suppliers s2
    ON LEFT(s1.supplier_name, 1) = LEFT(s2.supplier_name, 1)
   AND s1.supplier_id > s2.supplier_id;

-- Q32. Retailmart wants to find stores in the same state where one store's name 
--      is alphabetically after the other. Simple listing exercise.

SELECT
    s1.store_name AS store1_name,
	    s1.state,
    s2.store_name AS store2_name

FROM stores.stores s1
JOIN stores.stores s2
    ON s1.state = s2.state
   AND s1.store_name > s2.store_name;

-- Q33. The customer service team wants to identify pairs of customers 
--      where both have addresses in the same city (using addresses table).

SELECT * from customers.addresses

SELECT
	a1.cust_id as cust1,
	a1.city,
	a2.cust_id as cust2
FROM customers.addresses a1
join customers.addresses a2
	on a1.city = a2.city
	and a1.cust_id > a2.cust_id
	

-- Q34. Retailmart's assortment team wants to find product pairs from different categories 
--      but same brand. This shows brand category coverage.

SELECT
    p1.prod_name AS prod1_name,
    p1.category     AS prod1_category,
    p1.brand,
    p2.prod_name AS prod2_name,
    p2.category     AS prod2_category
FROM products.products p1
JOIN products.products p2
    ON p1.category <> p2.category
   AND p1.brand = p2.brand
   AND p1.prod_id > p2.prod_id;

-- Q35. The analytics team wants to find employee pairs where one joined 
--      at a store in a different region than the other's store.
wrong questionn, so there is no specific qury to solve 



-- =====================
-- SECTION B: CROSS JOIN (Q36-Q55)
-- =====================

-- Q36. RetailMart's inventory planning team wants to see every possible combination 
--      of products and stores. This is the starting point for stock allocation planning.

SELECT
    p.prod_id,
    p.prod_name,
    s.store_id,
    s.store_name
FROM products.products p
CROSS JOIN stores.stores s;

-- Q37. The marketing team at Retailmart wants to generate all possible combinations 
--      of regions and product categories for campaign targeting.

SELECT * from products.products
SELECT * from stores.stores

SELECT p.category,
		s.region
from products.products p
cross join  stores.stores s;
	

-- Q38. Retailmart's promotion team needs a list showing every product 
--      paired with every available promotion. This is for promotion eligibility analysis.

SELECT
    p.prod_id,
    p.prod_name,
    pr.promo_id,
    pr.promo_name
FROM products.products p
CROSS JOIN products.promotions pr;

-- Q39. The HR team wants to create a matrix of all departments and all stores 
--      to plan potential team placements.

SELECT
    d.dept_id,
    d.dept_name,
    s.store_id,
    s.store_name
FROM stores.departments d
CROSS JOIN stores.stores s;

-- Q40. Retailmartt's pricing team wants to see every combination of brands and categories 
--      to understand market coverage opportunities.

SELECT
    b.brand,
    c.category
FROM (
    SELECT DISTINCT brand
    FROM products.products
) b
CROSS JOIN (
    SELECT DISTINCT category
    FROM products.products
) c;

-- =====================
-- SECTION C: UNION & UNION ALL (Q56-Q75)
-- =====================


-- Q56. The operations team wants a combined list of all cities 
--      where either a customer lives or a store is located, without duplicates.

SELECT city
FROM customers.addresses
UNION
SELECT city
FROM stores.stores;
-- Q57. Retailmart's data team needs a master list of all person names, 
--      combining customer names and employee names, removing duplicates.
SELECT full_name AS person_name
FROM customers.customers
UNION
SELECT emp_name AS person_name
FROM stores.employees;
-- Q58. The geographic team wants all states mentioned in the database, 
--      whether from customers, stores, or addresses, without repeats.
SELECT state
FROM customers.customers
UNION
SELECT state
FROM stores.stores
UNION
SELECT state
FROM customers.addresses;
-- Q59. RetailMart's finance team wants to combine expense dates from stores 
--      with expense dates from finance, including all occurrences.
SELECT expense_date
FROM stores.expenses
UNION ALL
SELECT expense_date
FROM finance.expenses;
-- Q60. The marketing analytics team wants a list of all dates 
--      when either an order was placed or a campaign started.
SELECT order_date
FROM sales.orders
UNION
SELECT start_date
FROM marketing.campaigns;
-- Q61. Retailmart's contact center wants all unique city names 
--      from both customer addresses and store locations.
SELECT city
FROM customers.addresses
UNION
SELECT city
FROM stores.stores;
-- Q62. The compliance team needs all dates when money moved: 
--      either payment dates or expense dates.
SELECT expense_date
from finance.expenses
UNION all
select payment_date
from sales.payments -- Q63. Retailmart's catalog team wants a combined list 
    --      of all category names from products and dim_category.
SELECT category
FROM products.products
UNION
SELECT category_name
FROM core.dim_category;
-- Q64. The PR team wants all unique brand names 
--      appearing in either products table or dim_brand table.
SELECT brand
FROM products.products
UNION
SELECT brand_name
FROM core.dim_brand;
SELECT datname
FROM pg_database;
-- Q65. Retailmart customer team wants to combine customer join dates 
--      with order dates to see all significant customer activity dates.
SELECT join_date
FROM customers.customers
UNION
SELECT order_date
FROM sales.orders;
-- Q66. The audit team needs a complete list of all amounts: 
--      order totals and expense amounts combined, keeping duplicates.
SELECT total_amount
FROM sales.orders
UNION ALL
SELECT amount
FROM finance.expenses;
SELECT *
FROM finance.expenses;
-- Q67. RetailMart wants all city names where either customers live 
--      or where they have addresses, removing duplicates.
SELECT city
from customers.customers
union
select city
from customers.addresses;
-- Q68. The logistics team wants to combine shipped dates and delivered dates 
--      from shipments to get all logistics activity dates.
select shipped_date
from sales.shipments
union
select delivered_date
from sales.shipments;
-- Q69. Swiggy's finance team wants all unique amounts that appear 
--      either as order totals or as payment amounts.\
select total_amount
from sales.orders
union
select amount
from sales.payments;
Q70.The HR team wants a combined list of dates --      when employees either attended work or received salary updates.
select date
from hr.attendance
union
select effective_date
from hr.salary_history;

-- Q71. The product team wants to combine all product names 
--      with all store names into one master list of entity names.

SELECT prod_name as prod_or_store
FROM products.products
UNION all	
select stores.store_name as prod_or_store
from stores.stores;

-- Q72. Retailmart's campaign team wants all dates relevant to marketing: 
--      campaign start dates, end dates, and email sent dates.

SELECT c1.start_date as date
FROM marketing.campaigns c1
UNION all
SELECT c2.end_date as date
FROM marketing.campaigns c2
UNION all
SELECT e.sent_date as date
FROM marketing.email_clicks e;

	

-- Q73. The customer 360 team wants all dates associated with customers: 
--      join dates, order dates, and review dates combined.

SELECT 
	join_date as date
from customers.customers 
UNION all
SELECT
	order_date as date
from sales.orders 
UNION all
select
   	review_date as date
from customers.reviews;
	
-- Q74. RetailMart's master data team wants a single list 
--      containing customer IDs and employee IDs together (as a number list).

SELECT cust_id AS id
FROM customers.customers
UNION ALL
SELECT emp_id AS id
FROM stores.employees;


-- Q75. The inventory team wants to combine product IDs from products table 
--      with product IDs from inventory table, keeping all occurrences.


SELECT 
	  prod_id as id
from products.products 
UNION all
SELECT
	prod_id
from products.inventory;

-- =====================
-- SECTION D: INTERSECT (Q76-Q88)
-- =====================

-- Q76. The market penetration team wants to find cities 
--      where both customers live AND stores are located.

SELECT
	city
from customers.customers
INTERSECT
select 
	city
from stores.stores;

-- Q77. Retailmart's data quality team wants to identify product IDs 
--      that exist in both the products table and the order_items table.

SELECT
	prod_id
from products.products
intersect
select
	prod_id
FROM sales.order_items;

-- Q78. The regional planning team wants states 
--      that appear in both customer data and store data.

SELECT
	state
from customers.customers
INTERSECT
select 
	state
from stores.stores;

-- Q79. Retailmart's inventory team wants to find product IDs 
--      present in both products and inventory tables.

SELECT
	prod_id
from products.products
intersect
select
	prod_id
FROM products.inventory;

-- Q80. The order fulfillment team wants dates 
--      when both orders were placed AND payments were made.

-- Q81. Myntra's customer insights team wants to find customer IDs 
--      who have both placed orders AND written reviews.

-- Q82. The pricing team wants amounts that appear 
--      as both payment amounts and order totals.

-- Q83. RetailMart wants to find product IDs 
--      that have been both ordered AND returned.

-- Q84. The email marketing team wants customer IDs 
--      who received emails AND also placed orders.

-- Q85. Zomato's analytics team wants to find dates 
--      when both campaigns were active AND orders were placed.

-- Q86. The store expansion team wants cities appearing 
--      in both stores table and customer addresses table.

-- Q87. The supplier team wants to find supplier IDs 
--      whose products appear in both products and inventory.

-- Q88. The finance team wants dates appearing 
--      in both expenses and revenue_summary tables.


