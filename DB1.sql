CREATE DATABASE college1;
use college1;

create table student(
ROLL_NO int primary key,
NAME varchar(50),
MARKS INT NOT NULL,
GRADE VARCHAR(1),
CITY VARCHAR(20)
);

INSERT INTO student (ROLL_NO,NAME,MARKS,GRADE,CITY) VALUES 
(101,"ANIL",78,"C","Pune"),
(102,"BHUMKIKA",93,"A","Mumbai"),
(103,"CHETAN",85,"B","Mumbai"),
(104,"DHRUV",96,"A","Delhi"),
(105,"EMANUEL",12,"F","Delhi"),
(106,"FARHA",82,"B","Delhi");

select *from student;

select NAME,MARKS from student;
select CITY from student;
select distinct CITY from student;

select *from student;
//------:WhereClause:-----
//comparision operator:--
select * from student where MARKS>80;

//Logical Operator:---
//Logical AND:--
select * from student where CITY = "Delhi" and MARKS>80;
// Logical Or:----- 
select *from student where MARKS>90 or CITY="Mumbai";

// Arithmatic Operator:--
select * from student where MARKS+10>100;

// BETWEEN Operator:----(select for a given range)
select * from student where marks between 80 and 90; 

// In (matches any value in the list)-----
select *from student where city in ("Delhi","Mumbai"); 

// NOT (to negate the given condition)
select *from student where city not in ("Delhi","Mumbai"); 

// LIMIT Clause:-----

select *from student where MARKS>75 limit 3; 

// Order By Clause:----

select *from student order by city asc;
select *from student order by marks asc;

select *from student order by marks desc;
select *from student order by marks desc limit 3;

// Aggregate Function:---
// aggregate functions perform a calculation on a set of values, and return a single value

// count()---
select COUNT(name) from student;
select max(marks) from student;
select min(marks) from student;
select sum(marks) from student;
select avg(marks) from student;

// Group By Clause
// Groups rows that have the same values into summary rows,
it collect data from multiple records and groups the result by one or more column.

//syntax:--

select city,name, count(marks) from student group by city,name;
select grade,count(name) from student group by grade order by grade;
select city, count(marks) from student group by city;
select city, count(marks) from student group by city having maxx;

// Practice Qs
// write the Query to find avg marks in each city in ascending order
 
select city,avg(marks) from student Group by city order by city desc;

//Having Clause

select city,count(roll_no) from student group by city
having max(marks)>90;

// General Order to write command 
select city
from student
where grade = "A"
group by city
Having max(marks)>=93
order by city asc;

// Update Command
update student
set grade = "O"
where grade = "A";

SET SQL_SAFE_UPDATES =0;
update student
set grade = "O"
where grade = "A";

Select *from student;

update student 
set marks = 82
where roll_no = 105;

update student 
set grade = "B"
where marks between 80 and 90;

update student
set marks = marks+1;

update student 
set marks = 12
where roll_no = 105;

// DELETE Command
delete from student 
where marks<33;

//Foriegn key initialization:--

create table dept(
id int primary key,
name varchar(50)
);

create table teacher(
id int primary key,
NAME varchar(50),
dept_id int,
foreign key (dept_id) references dept(id)
on update cascade
on delete cascade
);

// Cascading fk

insert into dept
values
(101,"english"),
(102,"IT");

select *from dept;
update dept SET id = 103 where id = 102;
update dept SET id = 111 where id = 101;

insert into teacher
values
(101,"Adam",101),
(102,"Eve",102);

select *from teacher;

drop table teacher;

// Alter Table