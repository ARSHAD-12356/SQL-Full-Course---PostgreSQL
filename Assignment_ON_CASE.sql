------                   Assignment ON CASE                   --------
-- ASSIGNMENT 1 : CASE with AND & OR Operators - Stock Status
-- We Will classify products based on quantity available:

-- In Stock if quantity is 10 or more 
-- Limited Stock if quantity is between 5 and 9
-- Out of Stock soon if quantity is less than 5

SELECT * from products;

SELECT product_name,quantity,
		CASE
			WHEN quantity>=10 THEN 'In Stock'
			WHEN quantity>=5 AND quantity<=9 THEN 'Limited Stock'
			ELSE 'Out of Stock'
		END AS Stock_Status
FROM products;

SELECT product_name,quantity,
		CASE
			WHEN quantity>=10 THEN 'In Stock'
			WHEN quantity BETWEEN 6 AND 9 THEN 'Limited Stock'
			ELSE 'Out of Stock'
		END AS Stock_Status
FROM products;

-- ASSIGNMENT 2: CASE with LIKE Operator - Category Classification
-- Check if the category name contains 'Electronics item' or 'Furniture Item' or 'Accessoory Item' Using LIKE

SELECT product_name,category,
		CASE
			WHEN category LIKE 'Ele%' THEN 'Electronics Item'
			WHEN category LIKE 'Fur%' THEN 'Furniture Item'
			ELSE 'Accessories Item'
		END AS Category_Classification
FROM products;
