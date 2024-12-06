-- mysql -u root --port 3306 -p




create database money;
use money;
create table payment(
id int primary key,
name  varchar(40),
mode varchar(30),
city varchar(40)
);

insert into payment
(id,name,mode,city)
values
(101,"lala","netbanking","poland"),
(102,"kaka","creditcard","india"),
(103,"alex","debitcard","goa"),
(104,"Ava","creditcard","bihar"),
(105,"Lia","debitcard","japan");

select mode ,count(name)
from payment 
group by mode;


                     -- ###############String functions: ############---------
-- Method:
-- Length(gives the length of the given string)
select length("Dheeraj kumar") as "Length";
select name as "people Name",length(name) as "LengthOfName" from payment;


-- Concat(add two or more string )
select concat("I am ","learning mysql database") as "Str";

select concat(name,"-->",mode) as "feePay" from payment;

-- Ucase and Lcase():
select lcase("I am Boy") as "inLower";
select ucase("i am learn sql") as "Upper";

-- substring(str,start,length)-extract part of the string 
select substring("I am Dheeraj ",1,5) as "SubString ";

-- trim():Space remove
select trim("   I am kaka   ") as "After trim";
-- reverse():

select reverse(name) from payment;

-- strcmp(String1,String2)-compare the two string

-- if(String1=String2) ,this function return 0;
-- if(String1<String 2),this function return -1;
-- if (String1 >String2), this function return 1;

select strcmp("AC","NA"); -- 1
select strcmp("ZA","AA"); -- 1
select strcmp("A","AA"); -- 0

 
-- other important method 

-- curdate( ): give the current date in yy--mm--dd
select curdate();
-- curTime(): return the current time 
select curtime();
-- now(): return current date and time both
select now();
-- year():
select year(curdate());

-- if(test,yes,no):return yes if test true else no;
select if(4<5,"yes","no");

select name ,mode, if(mode="debitcard","20%","10%") as "discount" from payment;

-- ifnull(null,"Test") -- if null then test else values itself
select ifnull(null,"kaka");

-- database(),version(),user():
select database(),version(),user();


-- MATH IMPORTANT FUNCTION 

-- ABS() - Returns the absolute value of a number.
select abs(-111) AS ABSOLUTEVALUE; -- 111 
select abs(-111) AS ABSOLUTEVALUE; -- 111 

-- CEIL() or CEILING() - Rounds a number up to the nearest integer.
select ceil(3.3); -- 4
-- FLOOR() - Rounds a number down to the nearest integer.
select floor(3.4) AS FLOORVALUE;-- 3
-- ROUND() - Rounds a number to the specified number of decimal places.
select round(3.43434,3);
-- POWER() - Returns the value of a number raised to a specified power.
 select power(2,3);
 -- SQRT() - Returns the square root of a number
 select sqrt(16);
 -- MOD():Returns the remainder of a division operation.
 select MOD(10,3) AS "MODVALUE";
 -- LOG() - Returns the natural logarithm (base e) of a number.
 select LOG(10) AS "NATURALLOG";-- 2.3058
 -- LOG10() - Returns the base-10 logarithm of a number.
 SELECT LOG10(1000) AS Log10Value;-- Output: 3
-- PI() - Returns the value of π.
SELECT PI() AS PiValue;-- Output: 3.141592653589793
-- RADIANS() - Converts degrees to radians.
SELECT RADIANS(180) AS RadiansValue;-- Output: 3.141592653589793
-- DEGREES() - Converts radians to degrees.
SELECT DEGREES(PI()) AS DegreesValue;
-- Output: 180
--  SIN(), COS(), TAN() - Trigonometric functions to calculate sine, cosine, and tangent values.
SELECT SIN(PI()/2) AS SineValue, COS(0) AS CosineValue, TAN(PI()/4) AS TangentValue;
-- Output: SineValue: 1, CosineValue: 1, TangentValue: 1




--  ----------- #########################################-----------------

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

 select* FROM STUDENT;
 
 -- ####################### OTher  ####################
 /*
The LIKE operator in SQL is used to search for patterns in data.
-- Wildcards:
1: % Matches zero or more characters.
Example: 'a%' → Matches "apple", "arm".
2: _ Matches one character.
Example: 'a_' → Matches "at", "an".

*/

-- % example:

select * from student where name like 'A%';
-- _ example:
select * from student where name like '_a%';

select*from student where name like '%h%';




 







