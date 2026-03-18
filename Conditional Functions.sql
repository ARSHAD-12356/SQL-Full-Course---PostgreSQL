-- -------------- CONDITITONAL FUNCTIONS ---------------------------------
-- 1> CASE --> Return Value based on condition
-- 2> COALESCE() -- Return the first non-Null value

SELECT * from products;

-- 1>                   CASE FUNCTION - Categorizing Based on Conditions
-- We will categorize products into price ranges;
-- * 1> Expensive if the price is greater than or equal to 50,000
-- * 2> Moderate if the price is between 10,000 and 49,999
-- * 3> Affordable if the price is less than 10,000.

SELECT product_name,price,
		CASE
			WHEN price>=50000 THEN 'Expensive'
			WHEN price>=10000 AND price<=49999 THEN 'Moderate'
			ELSE 'Affordable'
		END AS price_category
FROM products;

