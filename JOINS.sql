-- ---------------------- JOINS IN SQL -----------------------
-- 1> INNER JOIN: Retrieve records with matching values in both table
-- 2> LEFT  JOIN (LEFT OUTER JOIN) : Retreive all records from left table and matching record from right table
-- 3> RIGHT JOIN (RIGHT OUTER JOIN) : Retreive all records from right table and matching record from left table
-- 4> FULL  JOIN (FULL OUTER JOIN)  : Retreive all records from both table
-- 5> CROSS JOIN : Combines all rows from both tables, resulting in a Cartesian product
-- 6> SELF  JOIN : Joins a table to itself
DROP TABLE IF EXISTS employee3;

Create TABLE Employee3(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	department_id INT
);

INSERT INTO Employee3(first_name,last_name,department_id) VALUES
('Rahul','Sharma',101),
('Priya','Mehta',102),
('Ankit','Verma',103),
('Simran','Kaur',NULL),
('Aman','Singh',101);


CREATE TABLE Departments(
	department_id INT PRIMARY KEY,
	department_name VARCHAR(50)
);

INSERT INTO Departments(department_id,department_name) VALUES
(101,'Sales'),
(102,'Marketing'),
(103,'IT'),
(104,'HR');


-- ----------------- INNER JOIN -----------------------
-- Retreive Employee3 and their department names where a match exists

SELECT e.employee_id,e.first_name,e.last_name, d.department_id , d.department_name
FROM Employee3 e
INNER JOIN
Departments d
ON e.department_id=d.department_id;

-- ------------------ LEFT JOIN --------------------------
-- Retreive all Emloyee3 and their departnment name, including those without a department.

SELECT e.employee_id, e.first_name, e.last_name,
		d.department_id,d.department_name
FROM Employee3 e
LEFT JOIN
Departments d
ON e.department_id = d.department_id;

-- ----------------	RIGHT JOIN ------------------------------
-- Retreive all departments and Employee3 wokring in them,  including departments without

SELECT e.employee_id, e.first_name, e.last_name,
		d.department_id,d.department_name
FROM Employee3 e
RIGHT JOIN
Departments d
ON e.department_id = d.department_id;


-- ---------------- FULL OUTER JOIN --------------------------
-- Retreive all Employee3 and departments, including non-matching records from both table
SELECT e.employee_id, e.first_name, e.last_name,
		d.department_id,d.department_name
FROM Employee3 e
FULL OUTER JOIN  -- YOU CAN CHANGE THE JOIN NAME HERE LIKE : RIGHT JOIN, LEFT JOIN, INNER JON
Departments d
ON e.department_id = d.department_id;


-- ------------------ CROSS JOIN ---------------------------------
-- Retrieve all possible combination of Employee3 and departments

SELECT e.first_name,e.last_name,d.department_name
FROM Employee3 e
CROSS JOIN
	Departments d;


-- ------------------- SELF JOIN -----------------------------
-- Find Employee3 who share the same departments.

SELECT e1.first_name AS Employee_name1,
	   e2.first_name AS Employee_name2,
	   d.department_name

FROM Employee3 e1 JOIN Employee3 e2
ON e1.department_id = e2.department_id AND e1.employee_id!=e2.employee_id
JOIN
departments d
ON
e1.department_id = d.department_id;
