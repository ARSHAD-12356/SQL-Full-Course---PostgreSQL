DROP TABLE IF EXISTS users;


CREATE TABLE IF NOT EXISTS users(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	age INT,
	city VARCHAR(50)
);


5 * FROM users;

INSERT INTO users(username,email,age,city) VALUES
	('Rajesh','rajesh@gmail.com',25,'Mumbai'),
	('Ankit','ankit@gmail.com',28,'Banglore'),
	('Sneha','sneha@hotmail.com',35,'Pune'),
	('Priya','priya@yahoo.com',30,'Delhi'),
	('Vikram','vikram@gmail.com',22,'Hyderabad'),
	('NEHA','neha123@gmail.com',45,'Patna');

SELECT USERNAME,AGE,CITY FROM USERS;

-- Update query given below --
update users
set age = 28
where username = 'Rajesh';

-- now update age in sequence or order by username --
SELECT *
FROM USERS
ORDER BY USER_ID ASC;

-- now update in sequence or order by age --
update users
set city = 'Chennai'
where age>=30;

-- update two data in one time ----
update users
set age = 31, city = 'kolkata'
where username = 'Priya';

-- update on the basis of prefix or suffix of a field --
-- %-> suffix and without %-> prefix --

UPDATE users
SET age = age+1
WHERE email LIKE '%@gmail.com';

update users
set City = 'Patna'
where username Like '%a';

update users
set City = 'Pune'
where username Like 'Ankit';

update users
set age = age-1
where email Like '%gmail.com';


Delete from users where user_id =9;

SELECT * FROM users;