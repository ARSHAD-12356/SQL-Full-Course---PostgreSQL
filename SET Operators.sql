-- ---------------------------------------- SET OPERATOR ------------------------
DROP TABLE IF EXISTS student_2023;

CREATE TABLE student_2023(
	student_id INT PRIMARY KEY,
	student_name VARCHAR(100),
	course VARCHAR(50)
);

INSERT INTO student_2023(student_id,student_name,course) VALUES
(1,'Aarya Sharma','Computer Science'),
(2,'Ishita Verma','Mechanical Engineering'),
(3,'Kabir Patel','Computer Science'),
(4,'Ananya Desai','Computer Science'),
(5,'Rahul Gupta','Computer Science');

UPDATE student_2023
SET course = 'Civil Engineering'
WHERE student_name = 'Ananya Desai';

select student_name,course from student_2023;


DROP TABLE IF EXISTS student_2024;

CREATE TABLE student_2024(
	student_id INT PRIMARY KEY,
	student_name VARCHAR(100),
	course VARCHAR(50)
);

INSERT INTO student_2024(student_id,student_name,course) VALUES
(3,'Kabir Patel','Computer Science'),          ---- same as student_2023
(4,'Ananya Desai','Civil Engineering'),     ------ same as student_2023
(5,'Meera Rao','Computer Science'),
(6,'Vikram Singh','Mathematics'),
(7,'Sanya Kapoor','Physics');

select * from student_2024;

-- UNION --- Combine Results , Remove Duplicates
SELECT student_name,course
FROM student_2023
UNION
SELECT student_name,course
FROM student_2024;

-- UNION ALL -- Combine Results , keep duplicate
SELECT student_name,course
FROM student_2023
UNION ALL
SELECT student_name,course
FROM student_2024;

-- INTERSECT--  Returns Common Result in both table
SELECT student_name,course
FROM student_2023
INTERSECT
SELECT student_name,course
FROM student_2024;

-- EXCEPT -- Returns Results in the first table but not in the second
SELECT student_name,course
FROM student_2023
EXCEPT
SELECT student_name,course
FROM student_2024;