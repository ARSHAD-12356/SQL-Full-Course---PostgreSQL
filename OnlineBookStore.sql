-- -------------------------------------------- ONLINE BOOKS STORE SYSTEM ---------------------------------------------------------

DROP TABLE IF EXISTS Books;
CREATE TABLE BOOKS(
	BOOK_ID SERIAL PRIMARY KEY,
	TITLE VARCHAR(100),
	AUTHOR VARCHAR(100),
	GENRES VARCHAR(50),
	PUBLISHED_YEAR INT,
	PRICE NUMERIC(10,2),
	STOCK INT
);

DROP TABLE IF EXISTS CUSTOMERS;
CREATE TABLE CUSTOMERS(
	CUSTOMER_ID SERIAL PRIMARY KEY,
	NAME VARCHAR(100),
	EMAIL VARCHAR(100),
	PHONE VARCHAR(15),
	CITY VARCHAR(50),
	COUNTRY VARCHAR(150)
);

DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS(
	ORDER_ID SERIAL PRIMARY KEY,
	CUSTOMER_ID INT REFERENCES CUSTOMERS(CUSTOMER_ID),
	BOOK_ID INT REFERENCES BOOKS(BOOK_ID),
	ORDER_DATE DATE,
	QUANTITY INT,
	TOTAL_AMOUNT NUMERIC(10,2)
);

SELECT * FROM BOOKS;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

-- Import Data into Books Table ---
COPY BOOKS(BOOK_ID,TITLE,AUTHOR,GENRES,PUBLISHED_YEAR,PRICE,STOCK)
FROM 'E:\SQL\SQL_Micro_Course-main\SQL_Micro_Course-main\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Books.csv'
CSV HEADER;

-- IMPORT Data into Customers Table
COPY CUSTOMERS(CUSTOMER_ID,NAME,EMAIL,PHONE,CITY,COUNTRY)
FROM 'E:\SQL\SQL_Micro_Course-main\SQL_Micro_Course-main\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Customers.csv'
CSV HEADER;

-- Import Data into Orders Table
COPY ORDERS(ORDER_ID,CUSTOMER_ID,BOOK_ID,ORDER_DATE,QUANTITY,TOTAL_AMOUNT)
FROM 'E:\SQL\SQL_Micro_Course-main\SQL_Micro_Course-main\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Orders.csv'
CSV HEADER;


-- ---------------------------- BASIC SQL QUERIES ON THIS ONLIINE BOOK STORE -----------------------------
--   1 ) Retreive all books in the 'Fiction' genere:
SELECT BOOK_ID,TITLE,GENRES
FROM BOOKS
WHERE GENRES = 'Fiction';


--  2 ) Find books published after the year 1950

SELECT * FROM BOOKS
WHERE PUBLISHED_YEAR>1950;

-- 3 ) List All the customers from the Canada
SELECT * FROM CUSTOMERS
WHERE COUNTRY='Canada';

-- 4 ) Show orders-placed in November 2023

SELECT * FROM ORDERS
WHERE ORDER_DATE BETWEEN '2023-11-01' AND '2023-11-30';

-- 5 ) Retreive the total stocks of book avilable

SELECT SUM(STOCK) As Total_Stock
FROM BOOKS;

-- 6 ) FInd the details of Most Expensive Books;

SELECT * FROM BOOKS
ORDER BY PRICE
DESC LIMIT 1;

-- 7 ) Show all customers who ordered more than 1 quantity of a book;

SELECT * FROM ORDERS
WHERE QUANTITY>1;

-- 8 ) Retreive all orders where the total amount exceeds $20

SELECT * FROM ORDERS
WHERE TOTAL_AMOUNT>20;

-- 9 ) List all genres available in the book table

SELECT DISTINCT GENRES FROM BOOKS;

-- 10 ) Find the books with the Lowest Stock

SELECT * FROM BOOKS
ORDER BY STOCK
LIMIT 1;

-- 11 ) Calculate total revenue generated from all orders;

SELECT SUM(TOTAL_AMOUNT) FROM ORDERS;

-- Advnced Question )

-- 1 ) Retreive total number of books sold for each genere

SELECT B.GENRES ,SUM (O.QUANTITY) AS TOTAL_BOOK_SOLD
FROM ORDERS O
JOIN BOOKS B ON O.BOOK_ID = B.BOOK_ID
GROUP BY B.GENRES;

-- 2 ) Find the average price of books in the 'Fantasy' genres

SELECT * FROM BOOKS;
SELECT AVG(PRICE) 
FROM BOOKS
WHERE GENRES='Fantasy';

-- 3 ) List customers who have placed at least 2 orders;

select * from orders;
select * from customers;

SELECT c.customer_id , COUNT(o.order_id)
from orders o
join customers c on c.customer_id = o.customer_id 
where o.order_id>=2;


SELECT O.CUSTOMER_ID , C.NAME , COUNT (O.ORDER_ID) AS ORDER_COUNT
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY O.CUSTOMER_ID, C.NAME
HAVING COUNT(ORDER_ID)>=2;

-- 4 ) Find the most frequently ordered book;

SELECT O.BOOK_ID, B.TITLE, COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM ORDERS O
JOIN BOOKS B ON B.BOOK_ID = O.BOOK_ID
GROUP BY o.BOOK_ID ,B.TITLE
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- 5 ) Show the top 3 most expensive books of 'Fantasy ' Genres

SELECT TITLE,PRICE,GENRES
FROM BOOKS
WHERE GENRES = 'Fantasy'
ORDER BY PRICE DESC LIMIT 3;

-- 6 ) Retrieve the total quantity of books sold by each author

SELECT B.AUTHOR , SUM(O.QUANTITY) AS TOTAL_BOOK_SOLD
FROM ORDERS O
JOIN BOOKS B ON B.BOOK_ID = O.BOOK_ID
GROUP BY B.AUTHOR;

-- 7 ) List the cities where customers who spent over 30$ are located

--  YE MERA QUERY LIKHA HUA H --

SELECT DISTINCT(C.CITY),O.TOTAL_AMOUNT AS SPENT_OVER_30
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY O.TOTAL_AMOUNT , C.CITY
HAVING O.TOTAL_AMOUNT>30;

-- VIDEO ---
SELECT DISTINCT(C.CITY), TOTAL_AMOUNT
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE O.TOTAL_AMOUNT>30
ORDER BY C.CITY ASC;

-- 8 ) Find the customer who spent the most on orders:

SELECT C.CUSTOMER_ID ,C.NAME, SUM(O.TOTAL_AMOUNT) AS TOTAL_SPENT
FROM ORDERS O
JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID,C.NAME
ORDER BY TOTAL_SPENT DESC LIMIT 1;

-- 9 ) Calculate the stock remaining after fulfilling all orders:

SELECT B.BOOK_ID, B.TITLE, B.STOCK , COALESCE(SUM(QUANTITY),0) AS ORDER_QUANTITY,
B.STOCK - COALESCE(SUM(QUANTITY),0) AS REMAINING_QUANTITY
FROM BOOKS B
LEFT JOIN ORDERS O ON B.BOOK_ID = O.BOOK_ID
GROUP BY B.BOOK_ID
ORDER BY B.BOOK_ID;