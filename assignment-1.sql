                 -- ASSIGNMENT-1                  
-- Drop the table if it already exists
DROP TABLE IF EXISTS employees;
-- Create the employees table
CREATE TABLE employees(
employee_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
department VARCHAR(50),
salary DECIMAL(10,2) CHECK (salary>0),
joining_date DATE NOT NULL,
age INT CHECK(age>=18)
);

-- Insert some sample data into above table --
INSERT INTO employees(first_name,last_name,department,salary,joining_date,age)
VALUES
('Amit','Sharm','IT',60000.00,'2022-05-01',29 ),
('Neha','Patel','HR',55000.00,'2021-08-15',32 ),
('Ravi','Kumar','finance',70000.00,'2020-03-10',35 ),
('Anjali','Verma','IT',65000.00,'2019-11-22',28 ),
('Suresh','Reddy','Operations',50000.00,'2023-01-10',26 );

select * from employees;

-- Question 1 ---
-- Retrive all employee's first_name and their deparments.
-- solution
select first_name,department from employees;

-- Question 2 -- 
-- Update the salary of all employees in the "IT" depatment by increasing it by 10%.
UPDATE employees
SET salary = salary +(salary*0.1) 
where department = 'IT';


select * from employees;

-- Question 3 ---
-- Delete all employees who are older than 34 years --
DELETE FROM employees
WHERE age>34;

-- Question 4 --
-- Add a new column 'email' to the 'employees' table
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);

-- Question 5 --
-- Rename the 'department' colum to 'dept_name'
ALTER TABLE employees
RENAME COLUMN department to dept_name;

-- Question 6 ---
-- Retrieve the names of employess who joined after january 1, 2021.
SELECT first_name,last_name,joining_date from employees
WHERE joining_date>'2021-01-01';

-- Question 7 --
-- Change the data type of the 'salary' column to 'INTEGER'
ALTER TABLE employees
ALTER COLUMN salary TYPE INTEGER USING salary::INTEGER;

-- Question 8 --
-- List all employess with their age and salary in descending order of salary.
Select first_name,age,salary from employees order by salary desc;

-- Question 9 --
-- Insert a new employee with the following details:
       -- ('Raj','Singh','Marketing','60000','2023-09-15',30)
INSERT INTO employees(first_name,last_name,dept_name,salary,joining_date,age)
VALUES('Raj','Singh','Marketing','60000','2023-09-15',30);

-- Question 10 --
-- Update age of employee +1 to every employee;
UPDATE employees
SET age = age+1;

select * from employees;