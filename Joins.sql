/*  #########----    JOINS   ---###########

Join is used to combine rows from two or more tables, based on a related column between them.
type of joins:
-- inner joins:Returns records that have matching values in both tables
-- outer joins:
-left joins:Returns all records from the left table, and the matched records from
the right table
-right joins:Returns all records from the right table, and the matched records
from the left table
-full joins:Returns all records when there is a match in either left or right table

*/



/*inner joins:Returns records that have matching values in both tables
synatx:
SELECT column(s)
FROM tableA
INNER JOIN tableB
ON tableA.col_name = tableB.col_name;
*/

create database colleges;
use colleges;

create table student(
id int primary key,
name varchar(50)
);

insert into student (id,name)
values 
(101,"adan"),
(102,"kali"),
(103,"jojo");

create table course(
id int primary key,
course varchar(50)
);

insert into course (id ,course)
values
(102,"english"),
(105,"math"),
(103,"science"),
(107,"computer science");

select*from student;
select*from course;

select * from student as s
inner join course as c
on s.id=c.id;


-- alias : refer to alternate name

/*
left joins:Returns all records from the left table, and the matched records from
the right table
synatx:
SELECT column(s)
FROM tableA
LEFT JOIN tableB
ON tableA.col_name = tableB.col_name;

*/

select * from student as a
left join course as b
on a.id=b.id;

/*   right joins:
Returns all records from the right table, and the matched records
from the left table
Syntax:
SELECT column(s)
FROM tableA
RIGHT JOIN tableB
ON tableA.col_name = tableB.col_name;
*/

select* from student as a
right join course as b
on a.id=b.id;

/*Full Join
Returns all records when there is a match in either left or right table
*/
select * from student as a
left join course as b
on a.id=b.id
union
select* from student as a
right join course as b
on a.id=b.id;


/*
Left Exclusive Join:
A Left Exclusive Join (also called Left Anti Join) retrieves rows from the left table that do not have matching rows in the right table
overlapping ke liye not null lege
not overlapping ke liye null lege
*/
select*from student as a
left join course as b
on a.id=b.id
where b.id is null;

/*
right exclusive join:
A Right Exclusive Join (also known as a Right Anti Join) retrieves rows from the right table that do not have matching rows in the left table. This is the opposite of a Left Exclusive Join.

*/

select*from student as a
right join course as b
on a.id=b.id
where a.id is null;


-- question give me a table not common on both
select*from student as a
left join course as b
on a.id=b.id
where b.id is null
union
select*from student as a
right join course as b
on a.id=b.id
where a.id is null;


/*  self join :
A self join is when a table is joined with itself. 
This is useful when rows in the same table are related to each other, 
and you want to compare or relate these rows. 
It uses a standard JOIN operation but treats the same table as if it were two separate tables by using aliases.

Why Use a Self Join?
Compare rows within the same table: For example, to compare employees with their managers in an organization.
Find relationships: For example, identifying pairs of rows that share something in common (e.g., same department or manager).
Hierarchical data: Represent parent-child relationships, such as folders or organizational structures.

Syntax
SELECT a.column,b.column2
FROM table as a
JOIN table as b
ON a.col_name = b.col_name;

*/

create table employee(
id int primary key,
name varchar(50),
manager_id int
);

insert into employee (id ,name,manager_id)
values
(101,"adam",103),
(102,"bob",104),
(103,"casey",null),
(104,"donald",103);

select * from employee;

select a.name as manager_name,b.name
from 
employee as a
join employee as b
on a.id=b.manager_id;


/*
Union
It is used to combine the result-set of two or more SELECT statements.
Gives UNIQUE records.
Syntax:
SELECT column(s) FROM tableA
UNION
SELECT column(s) FROM tableB

to use it:
every SELECT should have same no. of columns
columns must have similar data types
columns in every SELECT should be in same order

#UNION ALL:operator in SQL combines the result sets of two or more SELECT queries and does not remove duplicate rows. Unlike UNION, which removes duplicates, UNION ALL is faster because it doesn't perform the duplicate elimination step

*/

select name from employee
union all
select name from employee;
