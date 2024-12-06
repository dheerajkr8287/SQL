create database storeProcedure;
use storeProcedure;
--  the AUTO_INCREMENT attribute is used to generate unique numbers automatically for a column. It is typically applied to a primary key column to ensure that each record has a unique identifier.


-- change default delimiter
--  delimiter is a character or sequence of characters used to separate statements in a script or query. The default delimiter in most SQL systems is a semicolon (;), which signals the end of a statement. However, certain scenarios, such as defining procedures, functions, or triggers, may require changing the delimiter temporarily to avoid conflicts with semicolons used within the SQL code.
DELIMITER //

-- creating stored procedure 

create procedure CreateUserTable()
begin
create table if not exists user(
user_id int auto_increment primary key,
first_name varchar(255),
last_name varchar(255),
city varchar(255)
);
insert into user(first_name,last_name,city) values ("durgesh","jha","lucknow");
insert into user(first_name,last_name,city) values ("kaka","ji","up");
select*from user;
end //
-- call stored procedure
call CreateUserTable()//

show tables //
delimiter ;

select * from user;

-- varaible in stored procedure 
/*
Declare [variableName] dataType(size) [default value];
set variableName=value;
*/


