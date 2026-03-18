CREATE DATABASE college;

USE college;
CREATE TABLE student(
   id INT PRIMARY KEY,
   name VARCHAR(50),
   age INT NOT NULL
);

 CREATE TABLE staff(
      id INT PRIMARY KEY,staff
      name VARCHAR(50),
      address INT 
 );
 
 INSERT INTO student VALUES(1,"UMRA",19);
 INSERT INTO student VALUES(2,"ARSHAD",22);
 
 SELECT * FROM student;