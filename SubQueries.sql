create database University;
use university;
create table student (
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(50),
city varchar(20)
);

insert into student 
(rollno ,name,marks,grade,city)
values
(101,"anil",79,"C","pune"),
(102,"kaka",99,"A","delhi"),
(103,"chetan",48,"D","bihar"),
(104,"dhru",88,"B","goa");
insert into student values (105,"RJA",77,"C","goa");


select*from student;

/*

SubQueries:
A Subquery or Inner query or a Nested query is a query within another SQL query.
It involves 2 select statements
we can write subqueries with  3 ways:
1:select
2:from
3:where


Syntax:
SELECT column(s)
FROM table_name
WHERE col_name operator
( subquery )

*/
---   ################  subqueries write in where  ###### --------
/*Example
Get names of all students who scored more than class average.
Step 1. Find the avg of class
Step 2. Find the names of students with marks > avg
*/
-- by simple 
select avg(marks) from student;
select name ,marks from student
where marks>78.2000;

-- by subqueries
select name ,marks from student
where marks > (select avg(marks) from student);


/*
Example
Find the names of all students with even roll numbers.
Step 1. Find the even roll numbers
Step 2. Find the names of students with even roll no

*/

select name ,rollno from student 
where rollno in (select rollno from student where rollno %2=0);


/*
Example with FROM
Find the max marks from the students of goa
Step 1. Find the students of goa
Step 2. Find their max marks using the sublist in step 1

*/

-- by writing subquries in  where 
SELECT name, marks
FROM student
WHERE city = "goa" AND marks = (
    SELECT MAX(marks)
    FROM student
    WHERE city = "goa"
);

-- by writing subquries in from
select max(marks)
from (select * from student where city="goa") as temp;

select name ,max(marks) 
from student
where city="goa";


/*
mysql views:
A view is a virtual table based on the result-set of an SQL statement.

*A view always shows up-to-date data. The
database engine recreates the view, every time a
user queries it.

*/

create view view1 as 
select rollno ,name from student;

select * from view1;

drop view view1;