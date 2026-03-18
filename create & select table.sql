-- :Creating a Table:----

create table employee(
	employee_id serial primary key,
	name varchar(100) not null,
	position varchar(50),
	department varchar(50),
	hire_date Date,
	salary numeric (10,2)

);

select * from employee;

create table employee2(
	employee_id INT primary key,
	name varchar(100) not null,
	position varchar(50),
	department varchar(50),
	hire_date Date,
	salary numeric (10,2)

);

select * from employee2;

CREATE TABLE users(
	user_id INT PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Email VARCHAR(100) UNIQUE,
	Age INTEGER CHECK(Age>=18),
	Reg_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM users;