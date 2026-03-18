-- --------------------------- STRINGS FUNCTIONS IN SQL -------------------------
-- UPPER (), LOWER(),LENGTH(),CONCAT(),SUBSTRING(),TRIM(),REPLACE() ------

SELECT * FROM products;

-- UPPER () 
-- Get all the categories in Uppercase
SELECT UPPER(category) AS Category_new
FROM products;

select distinct category
from products;

-- LOWER () 
-- Get all the categories in Lowercase
SELECT LOWER(category) AS Category_lOWER
FROM products;

-- CONCAT()
-- Join product name and category text with hypen
SELECT CONCAT(product_name,'-',category) AS product_details
FROM products;

-- SUBSTRING()
-- Extract the first 5 charachter from product_name
SELECT SUBSTRING(product_name,2,5) AS Short_name
FROM products;

-- LENGTH()
-- Count length
SELECT product_name, LENGTH(product_name) AS Count_of_char
FROM products;

-- Remove leading and trailling spaces from strings
SELECT TRIM('  Monitor  ') AS Trimmed_Text;
SELECT LENGTH(TRIM('  Monitor       ')) AS Trimmed_Text;
SELECT LENGTH('  Monitor       ') AS Trimmed_Text;

-- REPLACE()--
-- Replacae the word 'phones' with 'device' in products name
SELECT REPLACE(product_name, 'phones','device') AS updated
FROM products;

-- LEFT() --
-- Get the first 3 charachter from the category
SELECT LEFT(category,3) As Category_Char
FROM products;