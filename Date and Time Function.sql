-- ------------------------- DATE & TIME FUNCTIONS IN SQL- I ----------------
-- NOW(),CURRENT_DATE(),CURRENT_TIME(),DATE_PART(),AGE(),EXTRACT() ----

-- 1> NOW() - Get Current Date and Time
SELECT NOW() AS CURRENT_DATETIME;

-- 2> CURRENT_DATE() - Get Current Date
SELECT CURRENT_DATE AS today_date;

SELECT Added_date, Current_Date , (CURRENT_DATE - added_date) AS Days_difference
FROM products;

-- To know my age in days ---
SELECT Current_Date , (CURRENT_DATE - '2001-06-29') AS Age_Difference;

-- Meri Umra's age in days --
SELECT Current_Date , (CURRENT_DATE - '2006-10-02') AS Meri_Sukoon;

-- 3> EXTRACT() - Extract Parts of a Date
-- Extract the year,month and day from the added_date column.

SELECT product_name,
       EXTRACT(YEAR FROM added_date) AS Year_Added,
	   EXTRACT(MONTH FROM added_date) AS Month_Added,
	   EXTRACT(DAY FROM added_date) AS Day_Added
FROM products;

-- 4. AGE() - Calculate Age Between Dates
-- Calculate the time difference between added_date and today's date.
SELECT product_name,
	AGE(CURRENT_DATE, added_date) as Age_since_added
from products;

SELECT AGE(CURRENT_DATE, '2001-06-29') as Age_since_added;
SELECT AGE(CURRENT_DATE, '2006-10-02') as Age_since_added;

-- 5> TO_CHAR() - Format Dates as Strings
-- Format added_date in a custom format (DD-Mon-YYYY).
SELECT product_name,
	TO_CHAR(added_date,'DD-Mon-YYYY') as FORMATED_DATE
from products;

-- ---------------------------------- Part - II ----------------------------------

-- 6> DATE_PART() - Get Specific Date Part
-- Extraact the day of the week from added_date.

SELECT product_name, added_date,
		DATE_PART('dow',added_date) AS day_of_week
FROM products;

SELECT product_name, added_date,
		DATE_PART('year',added_date) AS day_of_week
FROM products;

SELECT product_name, added_date,
		DATE_PART('month',added_date) AS day_of_week
FROM products;

-- 7> DATE_TRUNC() - Truncate Date to Precision
-- Truncate added_date to the start of the month

SELECT product_name,added_date,
		DATE_TRUNC('week',added_date) AS week_Start,
		DATE_PART('isodow',added_date) AS day_of_week
FROM products;

-- 8> INTERVAL - Add or Subtract Time Intervals
-- Add a 6 month to the added_date.

SELECT product_name,added_date,
		added_date + INTERVAL '6 days' AS new_date
FROM products;

SELECT product_name,added_date,
		added_date + INTERVAL '6 months' AS new_month
FROM products;


-- 9> CURRENT_TIME() - Get Current Time
--Retrieve only the current time.

SELECT CURRENT_TIME AS CurrentTime;

-- 10> TO_DATE() - Convert String to Date
-- Convert a string to a date format

SELECT TO_DATE('09-03-2026' , 'DD-MM-YYYY') AS CONVERTED_DATE;

