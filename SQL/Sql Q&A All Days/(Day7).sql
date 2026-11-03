SELECT
	FULL_NAME,
	CASE
		WHEN STATE IN ('Delhi', 'Uttar Pradesh', 'Punjab', 'Haryana') THEN 'North India'
		WHEN STATE IN ('Karnataka','Tamil Nadu','Kerala','Andhra Pradesh') THEN 'South India'
		WHEN STATE IN ('Maharastra', 'Gujarat', 'Rjasthan') THEN 'West India'
		WHEN STATE IN ('West Bengal', 'Bihar', 'Odiasha') THEN 'East India'
		ELSE 'Other Region'
	END AS REGION_CATEGORY
FROM
	CUSTOMERS.CUSTOMERS;


select * from customers.customers



SELECT
	CASE
		WHEN AGE BETWEEN 18 AND 25  THEN 'Gen Z (18-25)'
		WHEN AGE BETWEEN 26 AND 40  THEN 'Millennials (26-40)'
		WHEN AGE BETWEEN 41 AND 55  THEN 'Gen X (41-55)'
		WHEN AGE > 55 THEN 'Baby Boomers (55+)'
		ELSE 'Unknown Age Group'
	END AS AGE_SEGMENT
FROM
	CUSTOMERS.CUSTOMERS;



SELECT
	CASE
		WHEN AGE BETWEEN 18 AND 25  THEN 'Gen Z (18-25)'
		WHEN AGE BETWEEN 26 AND 40  THEN 'Millennials (26-40)'
		WHEN AGE BETWEEN 41 AND 55  THEN 'Gen X (41-55)'
		WHEN AGE > 55 THEN 'Baby Boomers (55+)'
		ELSE 'Unknown Age Group'
	END AS AGE_SEGMENT,
	COUNT(*) AS customers_count
FROM
	CUSTOMERS.CUSTOMERS
group by
	case
		WHEN AGE BETWEEN 18 AND 25  THEN 'Gen Z (18-25)'
		WHEN AGE BETWEEN 26 AND 40  THEN 'Millennials (26-40)'
		WHEN AGE BETWEEN 41 AND 55  THEN 'Gen X (41-55)'
		WHEN AGE > 55 THEN 'Baby Boomers (55+)'
		ELSE 'Unknown Age Group'
	END 


SELECT
	CASE
		WHEN AGE BETWEEN 18 AND 25  THEN 'Gen Z (18-25)'
		WHEN AGE BETWEEN 26 AND 40  THEN 'Millennials (26-40)'
		WHEN AGE BETWEEN 41 AND 55  THEN 'Gen X (41-55)'
		WHEN AGE > 55 THEN 'Baby Boomers (55+)'
		ELSE 'Unknown Age Group'
	END AS AGE_SEGMENT,
	COUNT(*) AS CUSTOMERS_COUNT,
	ROUND(AVG(AGE), 1) AS AVG_AGE_IN_SEGMENT
FROM
	CUSTOMERS.CUSTOMERS
GROUP BY
	AGE_SEGMENT;



SELECT 
	CASE CATEGORY
		WHEN 'Electronics' THEN 
		CASE
			WHEN PRICE > 50000 THEN 'Premium Tech'
			WHEN PRICE BETWEEN 10000 AND 50000 THEN 'Mid-Range Tech'
			ELSE 'Budget Tech'
		END
		WHEN 'Fashion' THEN CASE
			WHEN PRICE > 5000 THEN 'Designer Fashion'
			WHEN PRICE BETWEEN 1000 AND 5000 THEN 'Branded Fashion'
			ELSE 'Value Fashion'
		END
		ELSE CASE
			WHEN PRICE > 10000 THEN 'Premium Product'
			WHEN PRICE BETWEEN 2000 AND 10000 THEN 'Standard Product'
			ELSE 'Economy Product'
		END
	END AS PRCING_TIER,
	COUNT(*) AS PRODUCT_COUNT
FROM
	PRODUCTS.PRODUCTS


SELECT 
	CASE CATEGORY
		WHEN 'Electronics' THEN 
		CASE
			WHEN PRICE > 50000 THEN 'Premium Tech'
			WHEN PRICE BETWEEN 10000 AND 50000 THEN 'Mid-Range Tech'
			ELSE 'Budget Tech'
		END
		WHEN 'Fashion' THEN CASE
			WHEN PRICE > 5000 THEN 'Designer Fashion'
			WHEN PRICE BETWEEN 1000 AND 5000 THEN 'Branded Fashion'
			ELSE 'Value Fashion'
		END
		ELSE CASE
			WHEN PRICE > 10000 THEN 'Premium Product'
			WHEN PRICE BETWEEN 2000 AND 10000 THEN 'Standard Product'
			ELSE 'Economy Product'
		END
	END AS PRCING_TIER,
	COUNT(*) AS PRODUCT_COUNT
FROM
	PRODUCTS.PRODUCTS
GROUP BY
	CASE CATEGORY
		WHEN 'Electronics' THEN 
		CASE
			WHEN PRICE > 50000 THEN 'Premium Tech'
			WHEN PRICE BETWEEN 10000 AND 50000 THEN 'Mid-Range Tech'
			ELSE 'Budget Tech'
		END
		WHEN 'Fashion' THEN CASE
			WHEN PRICE > 5000 THEN 'Designer Fashion'
			WHEN PRICE BETWEEN 1000 AND 5000 THEN 'Branded Fashion'
			ELSE 'Value Fashion'
		END
		ELSE CASE
			WHEN PRICE > 10000 THEN 'Premium Product'
			WHEN PRICE BETWEEN 2000 AND 10000 THEN 'Standard Product'
			ELSE 'Economy Product'
		END
	END;




SELECT 
	CASE CATEGORY
		WHEN 'Electronics' THEN 
		CASE
			WHEN PRICE > 50000 THEN 'Premium Tech'
			WHEN PRICE BETWEEN 10000 AND 50000 THEN 'Mid-Range Tech'
			ELSE 'Budget Tech'
		END
		WHEN 'Fashion' THEN CASE
			WHEN PRICE > 5000 THEN 'Designer Fashion'
			WHEN PRICE BETWEEN 1000 AND 5000 THEN 'Branded Fashion'
			ELSE 'Value Fashion'
		END
		ELSE CASE
			WHEN PRICE > 10000 THEN 'Premium Product'
			WHEN PRICE BETWEEN 2000 AND 10000 THEN 'Standard Product'
			ELSE 'Economy Product'
		END
	END AS PRICING_TIER,
	COUNT(*) AS PRODUCT_COUNT,
	ROUND(AVG(price),2) as AVG_PRICE,
	min(price) as min_price,
	max(price) as max_price
FROM
	PRODUCTS.PRODUCTS
GROUP BY
	PRICING_TIER