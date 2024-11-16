/*
-Database is collection of data in format that can be easily acessed(Digital)
-A software application used to manage our DB is called DBMS
*/

-- user->(SQL)-dbms->database --

create database temp1;  -- for creating database 
use temp1;              -- for using database
drop database temp1;    -- for delete the database;
create database if  not exists db_name; -- if not data base found then create
drop database if exists db_name; -- if database found then delete it
show databases; -- show all the database within the given serever
show tables; -- show all the table in which given database you are using
/*
Select in Detail:
used to select any data from the database
Basic Syntax:
SELECT col1, col2 FROM table_name;
To Select ALL:
SELECT * FROM table_name;
*/

/*
type of values ----
#CHAR-String(0-255) can store characters of fixed length.  ex=char(38)
#VARCAHR-String(0-255) can store character up to given length. ex=varchar(40)
#BLOB-String(0-65535) can store binary large object ex=blob(30)
#INT-integer(-214483648 to 2147483647)
#TINYINT-(-128 to 127)
#BIGINT-large interger
#FLOAT-decimal number with precesion to 23 digit 
#DOUBLE-decimal number wit precesion 24 to 53 digit
#BOOLEAN -boolean values 0 or 1
#DATE-YYYY-MM-DD RANGE 1000-01-01 to 9999-12-31
#YEAR -Year in 4 digit format ranging from 1901 to 2155
*/


/*
Types of SQL Commands
#DDL (Data Definition Language) : create, alter, rename, truncate & drop
#DML (Data Manipulation Language) : select, insert, update & delete
#DCL (Data Control Language) : grant & revoke permission to users
#DQL (Data Query Language) : select
#TCL (Transaction Control Language) : start transaction, commit, rollback etc.
*/

create database college;  
use college;
create table student(
rollno int primary key,
name varchar(50)
);
drop table student;
drop database college;

 insert into student
 (rollno,name)
 values
 (101,"kaka"),
 (102,"raja");
  select * from student;
 insert into student values (103,"alex");
 
 select * from student;
 
 /*
 keys->
 #primary key:
It is a column (or set of columns) in a table that uniquely identifies each row. (a unique id)
There is only 1 PK & it should be NOT null.

 #froeign key:
 A foreign key is a column (or set of columns) in a table that refers to the primary key in another table.
FKs can have duplicate & null values.
There can be multiple FK.
*/

/*
constraints:
sql constraints are used to specify rules for data in a table
*/

-- not null -coloumn cannot have a null value    ex: col1 int not null
-- unique- all values in coloumn are different   ex: col2 int unique
-- primary  key - make a coloumn unqiue & not null but used only for one
create table temp1(
rollno int unique,
id int ,
name varchar(20),
primary key(id ,name)
);

-- foreign key-prevent  action that would destroyed link b/w tables
create table temp(
cust_id int ,
foreign key(cust_id) references customer(id)
);

-- default:set the default value of a coloumn

create table emp(
id int ,
salary int default 25000);
insert into  emp(id) values (101);
select*from emp;

-- check :it can limit the value allowed in a coloumn 
create table city(
id int primary key,
city varchar(50),
age int ,
constraint age_check check (age>=18 and city="delhi")
);

-- ##################################### --
create database college;
use college;
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

select rollno,name,grade from student;
select distinct city from student;
select*from student;

/*
where clause :to define some condition

select col1,col2 from table_name
where condtion;
*/

select * from student where marks >80;
select * from student where city="goa";
select*from student where city="goa" and marks>70;
select*from student where marks+10>100;

-- Using Operators in WHERE

/*
=>Arithmetic Operators : +(addition) , -(subtraction),
*(multiplication), /(division), %(modulus)

=>Comparison Operators : = (equal to), != (not equal to), > , >=
, <, <=

=>Logical Operators : AND, OR , NOT, IN, BETWEEN, ALL, LIKE, ANY

=>Bitwise Operators : & (Bitwise AND), | (Bitwise OR)

=>AND (to check for both conditions to be true)
ex: select*from student where marks >80 and city="mumbai";

=>OR (to check for one of the conditions to be true)
ex: select*from student where marks >80 orcity="mumbai";

=>Between (selects for a given range)
ex:select*from student where marks between 80 and 90;

=>In (matches any value in the list)
ex:select*from student where city("delhi","mumbai");

=>not(to negate the given condtion )
ex:select*from student where city not in("delhi","mumbai");
 
*/
select*from student where marks >80 and city="mumbai";
select*from student where marks >80 or city="mumbai";
select*from student where marks between 80 and 90;
select*from student where city In ("delhi","Mumbai");
select*from student where city not in("delhi","mumbai");

-- limit clause: sets an upper limit on number of (tuples) rows to be returned
-- syntax: select col1,col2 from table_name limit number;

select*from student where marks>60
limit 3;

-- order by clause : to sort in ascending(ASC) or decending order(DESC)
-- syntax:select col1,col2 from table_name orderby col_names ASC;

select * from student 
order by marks desc
limit 3;

/*
Aggregate functions:perform a calculation on a set of values and return a single value.
-count()-give a no of count of particular column
-max()-give a maximum value of particular column
-min()-give a minimum value of particular column
-sum()-give a sum of value of particular column
-avg()-give a avg of value of particular column

*/

select max(marks)
from student;

select sum(marks) from student;

/*
Group by clause:
roups rows that have the same values into summary rows.
It collects data from multiple records and groups the result by one or more column.

*Generally we use group by with some aggregation function.
*/

select city ,count(ROLLNO)
from student
group by city;

select city,rollno ,count(rollno)
from student
group by city,rollno;


select city ,avg(marks)
from student 
group by city
order by avg(marks) desc;

select grade ,count(rollno)
from student
group by grade
order by grade;


 /*
 Having clause: 
 Similar to Where i.e. applies some condition on rows.
Used when we want to apply any condition after grouping.

Count number of students in each city where max marks cross 90
*/

select city,count(rollno)
from student
group by city
having max(marks)>90;

/*

General Order:
SELECT column(s)
FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDER BY column(s) ASC;


where-> applies rows
having -> applies groups
*/
select city 
from student 
where grade ="A"
group by city
having max(marks)>80
order by city desc;

/*
update:
to update existing rows

synatx:
update table_name
set col1=val1,col2=val2
where condition;
*/
-- sql safe mode kio bhi galti se changes na ho jaye usse bachata h 0-off,1-on
set sql_safe_updates=0;

update student 
set grade ="O"
where grade="A";

update student
set marks=86
where rollno=103;

update student 
set grade ="B"
where marks between 80 and 90;

update student 
set marks=marks+1;

select*from student;


/*
Delete: (to delete existing rows)
DELETE FROM table_name
WHERE condition;
*/

delete from student
where marks<75;

delete from student; -- delete table student permanant
select*from student;


-- foreign key :
/*
parent table -here dept table
child table -here teacher table which connected with foreign key with parent table
*/
create table dept(
ID INT PRIMARY KEY,
NAME VARCHAR(40)
);

insert into dept
values
(101,"English"),
(102,"IT");
select*from dept;

update dept
set id =103
where id=102;
/*
Cascading for FK:
-->On Delete Cascade:
When we create a foreign key using this option, it deletes the referencing rows in the child table
when the referenced row is deleted in the parent table which has a primary key

-->On Update Cascade:
When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the child
table when the referenced row is updated in the parent table which has a primary key
*/
create table teacher(
id int primary key,
name varchar(40),
dept_id int,
foreign key (dept_id) references dept(id)
on update cascade
on delete cascade
);
drop table teacher;

insert into teacher 
values
(101,"kaka",101),
(102,"jao",102);

select*from teacher;

/*
Schema-design(Coloumn,datatypes ,constraints)
------------   Alter-(to change the schema)       ----------------------
1:ADD coloumn- on existing table add new coloumn
syntax:
ALTER TABLE table_name
ADD COLUMN column_name datatype constraint;

2:Drop coloumn -on existing table delete any coloumn 
syntax:
ALTER TABLE table_name
DROP COLUMN column_name;

3:rename table: on existing name of table .we can rename the table name
syntax:
ALTER TABLE table_name
RENAME TO new_table_name;

4:change coloumn (rename):on existing table .we can rename of the coloumn name to the old name
syntax:
ALTER TABLE table_name
CHANGE COLUMN old_name new_name new_datatype new_constraint;

5:modify coloumn :on existing table we can modify datatype/constraints) of a coloumn
syntax:
ALTER TABLE table_name
MODIFY col_name new_datatype new_constraint;
*/

-- ADD COloumn :

alter table student
add column age int not null default 19;

-- modify coloumn:

alter table student
modify column age varchar(2);

insert into student 
(rollno,name,marks,age)
values
(107,"gargi",68,100);

-- change :
alter table student
change age stu_age int;

insert into student 
(rollno,name,marks,stu_age)
values
(107,"gargi",68,100);


-- drop:
alter table student
drop column stu_age;

-- rename:
alter table student
rename to stu;
select* from student;

-- drop -directly delete the table
--  truncate:to  delete table data only but table exist after delete table data .we can add data in table after delete table data .
    
truncate table teacher; -- only delete data not table
select * from teacher;


/*       ######---  drop &  delete   -----##########
drop:
Purpose: Removes an entire database object, such as a table, database, index, or view.
Effect: Completely deletes the structure (and data) of the specified object from the database.
Usage: Irreversible. Once dropped, the object and all its data are permanently lost.
Performance: Faster as it removes everything directly.

--Create a table
CREATE TABLE Employees (
    ID INT,
    Name VARCHAR(50),
    Age INT
);

-- Drop the table
DROP TABLE Employees;
-- The 'Employees' table is permanently deleted.

DELETE:
Purpose: Removes specific rows from a table based on a condition.
Effect: Deletes data but retains the table structure (schema).
Usage: Reversible if a transaction is used (ROLLBACK can undo the operation).
Performance: Slower for large datasets as it processes rows individually.

-- Insert data into the table
INSERT INTO Employees (ID, Name, Age)
VALUES (1, 'Alice', 25),
       (2, 'Bob', 30),
       (3, 'Charlie', 35);

-- Delete a specific record
DELETE FROM Employees WHERE Name = 'Bob';

-- Result: Only the row with Name = 'Bob' is removed.
-- The table 'Employees' and its structure remain intact.


*/
 