-- IMPORT CSV FILE INTO SQL -----

DROP TABLE IF EXISTS employee2;

CREATE TABLE employee2(
   employee_id INT PRIMARY KEY,
   first_name VARCHAR(20) NOT NULL,
   last_name VARCHAR(20) NOT NULL,
   email VARCHAR(100),
   department VARCHAR(20),
   salary NUMERIC(10,2),
   joining_date DATE,
   age INT
);

select * from employee2;

COPY
employee2 (employee_id,first_name,last_name,email,department,salary,joining_date,age)
FROM 'C:\Program Files\PostgreSQL\18\data\employee_data.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE employee3(
   employee_id INT PRIMARY KEY,
   first_name VARCHAR(20) NOT NULL,
   last_name VARCHAR(20) NOT NULL,
   email VARCHAR(100),
   department VARCHAR(20),
   salary NUMERIC(10,2),
   joining_date DATE,
   age INT
);

select * from employee3;

CREATE TABLE employee4(
   employee_id INT PRIMARY KEY,
   first_name VARCHAR(20) NOT NULL,
   last_name VARCHAR(20) NOT NULL,
   email VARCHAR(100),
   department VARCHAR(20),
   salary NUMERIC(10,2),
   joining_date DATE,
   age INT
);