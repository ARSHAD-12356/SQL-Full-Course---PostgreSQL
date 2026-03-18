----------------------- COALESCE Functions in SQL ----------------------------
--                       (HANDLING NULL Values)

SELECT * from products;

ALTER TABLE products
DROP COLUMN discount_price;

ALTER TABLE Products
ADD COLUMN discount_price NUMERIC(10,2);

UPDATE products
SET discount_price = NULL
WHERE product_name IN('Laptop','Desk');

UPDATE products
SET discount_price = price*0.9
WHERE product_name NOT IN('Laptop','Desk');

SELECT product_name, price , discount_price
FROM products;

SELECT product_name,
		COALESCE(discount_price,price) AS final_price
FROM products;