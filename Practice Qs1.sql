CREATE DATABASE XYZ;

CREATE TABLE employee(
id int PRIMARY KEY,
name varchar(50),
salary int
)

insert into employee values(1,"adam",25000);
insert into employee values(2,"bob",30000);
insert into employee values(3,"casey",40000);

select *from employee;

use xyz;

create table payment(
customer_id int primary key,
customer_name varchar(50),
payment_mode varchar(20),
city varchar(20)
);

// For the given table, find the total payment according to each payment method 
create database bank;
use bank;
create table payment(
customer_id int primary key,
customer_name varchar(50),
payment_mode varchar(50),
city varchar(20)
);
insert into payment values
(101,"Olivia Barrett","NetBanking","Portland"),
(102,"Ehtan Sinclair","Credit Card","Miami"),
(103,"Maya Hernandez","Credit Card","Seattle"),
(104,"Liam Donovan","NetBanking","Denever"),
(105,"Sophia Nguyen","Credit Card","New Orleans"),
(106,"Caleb Foster","Debit Card","Minneapolis"),
(107,"Ava Patel","Debit Card","Phoenix"),
(108,"Lucas Carter","NetBanking","Boston"),
(109,"Isabella Martinez","NetBanking","Nashville"),
(110,"Jackson Brooks","Credit Card","Boston");

select payment_mode,count(customer_name) from payment group by payment_mode;