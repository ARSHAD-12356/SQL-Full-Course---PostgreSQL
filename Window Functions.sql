--                    WINDOW FUNCTIONS                              

-- Window Functions perform calculations across a set of table rows related to the current row. They are useful for ranking, calculating running totals, percentages, and much more.

SELECT product_name,category,price,
		ROW_NUMBER() OVER(PARTITION BY category ORDER BY price DESC) as row_num
FROM products;

-- Dense Rank : if both row price data are same than both row assign 1 but next row of that particular category it assign 2 not 3
SELECT product_name,category,price,
		DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) as Ranking
FROM products;

-- Rank : if both row price data are same than assign both row 1 but next row it assign direct 3 skipping 2
SELECT product_name,category,price,
		RANK() OVER(PARTITION BY category ORDER BY price DESC) as Ranking
FROM products;

-- Now retreive Running Total
SELECT product_name,category,price,
		SUM(price) OVER(ORDER BY price DESC) AS Running_Total
FROM products;

SELECT product_name,category,price,
		SUM(price) OVER(PARTITION BY category ORDER BY price DESC) AS Running_Total
FROM products;

SELECT product_name,category,price,
		AVG(price) OVER(PARTITION BY category ORDER BY price ASC) AS Running_Total
FROM products;