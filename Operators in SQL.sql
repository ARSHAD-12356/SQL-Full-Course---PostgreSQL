-- ---------------------------------  OPERATORS IN SQL --------------------------------
-- -------------------------------- ARITHMATIC OPERATORS -----------------------------
select * from employee2;

-- QUESTION 1 :---
-- Retreive the first_name,salary and caclulate 10% bonus on the salary ---

select first_name,salary , (salary+0.10) AS Bonus 
from employee2;

-- Question 2 ---
-- Calculate the Annual Salary and Salary Increment by 5% - show the monthly new salary as well
select first_name ,last_name,salary,
         (salary*12) as AnnualSalary , 
		 (salary*0.05) as Increment_Salary, 
		 (salary+ salary*0.05) as New_Salary,
		 (salary * 1.05) as new_salary2
from employee2;

-- ------------------------------ COMPARISION OPERATOR ------------------------
select * from employee2;

-- Retreive that person whose age equal to 30 ----
select * from employee2
where age = 30;

-- matches all except 30 ---
select first_name , age from employee2
where age != 30;

-- salary greaer than 50000 ---
select first_name, age, salary from employee2
where salary>=50000;

select first_name, age, salary from employee2
where salary<50000;

-- --------------------------- LOGICAL OPERATORS IN SQL ---------------
-------------------------------- AND OPERATROR -------------------------
select * from employee2;

-- Retrieve data whose salary greater than 50000 and age greater and equak t0 40 ---

select first_name,last_name, age, salary from employee2
where salary>=90000 AND age>=60;

---------------------------------- OR OPERATROR ------------------------
select first_name,last_name, age, salary from employee2
where salary>=90000 or age>=60;

----------------------------------- NOT OPERATOR -----------------------
select * from employee2
where not (department = 'IT');
 
-- --------------------------- BETWEEN , LIKE and IN OPERATOR ------------
select * from employee2;
  -- 1> Retreive employees whose salary is between 40,000 and 60,000 - use BETWEEN Operators
 SELECT first_name,last_name,salary
 FROM employee2
 WHERE salary BETWEEN 40000 AND 60000;

  -- 2 > Find employess wose email address ends with gmail.com - use LIKE Operators
SELECT first_name,last_name,email
FROM employee2 
WHERE email LIKE '%gmail.com';

-- Retreive name whose first letter starting with 'A' ----
SELECT first_name 
FROM employee2
WHERE first_name LIKE 'A%';

-- Retreive name whose last letter ending with 'a' ----
SELECT first_name
FROM employee2
WHERE first_name LIKE '%a';


-- Retreive name whose present'a' letter in anywhere ----
SELECT first_name
FROM employee2
WHERE first_name LIKE '%a%';

  -- 3 > Retreive employees who belong to either the 'finance' or 'Marketing' department-- use IN Operators

SELECT first_name,last_name,department
FROM employee2
WHERE department IN ('Finance','Marketing','IT');

SELECT first_name,last_name,department
FROM employee2
WHERE department='Finance' AND department='Marketing';


-- --------------------------------------- OTHER OPERATORS ---------------------------------------
-- -------------------------------------- IS NULL OPERATOR --------------------------------------

-- Q> Find the employee where the email column is null  (if applicable);

SELECT first_name,last_name, email
FROM employee2
WHERE email IS NULL;


------------------------------------------- ORDER BY Operator -----------------------------------
-- List employees sorted by salary in DESCENEDING order --
-- By default it gives asc order --
SELECT first_name,last_name,salary
FROM employee2
ORDER BY salary;

-- Now the question --
SELECT first_name,last_name,salary
FROM employee2
ORDER BY salary DESC;

-- ------------------------------------------ LIMIT Operator ----------------------------------the
-- Retreive the top 5 highest paid employee;
SELECT first_name,last_name,salary
FROM employee2                                   --> Give Top 5 only
LIMIT 5; 

-- Now A/Q 
SELECT first_name,last_name,salary
FROM employee2
ORDER BY salary DESC
LIMIT 5;


--------------------------------------------- DISTINCT Operator ---------------------------------
-- Retreive a list of unique department ----
SELECT DISTINCT department
FROM employee2;

SELECT COUNT (DISTINCT department)
FROM employee2;

SELECT COUNT (DISTINCT department) AS DEP_UNIQUE_COUNT
FROM employee2;

