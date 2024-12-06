
create database dk;

use dk;


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

select*from student;

-- while table creation 
/*
create table [laptop](lid int,model varchar(30) not null,price int,st_id int,
foreign key(st_id ) references [main table Student] ([main_table primary key_id]);
*/


-- After table creation 

-- constraints
/*
--> ADD
alter table[tablename] add  constransts fk_students foreign key(this_col_name) references
[parent_table](parent_primary_key_col);

-- In SQL, MUL appears when a column is part of a non-unique index (like in foreign keys or indexed columns with duplicate values).

-->DROP foreign key:
alter table [tablename] drop foreign key[constraint name];

*/

create table laptop(
lp_id int primary key,
model varchar(30),
price int not null,
st_id int );

drop table laptop;
alter table laptop add constraint fk_student foreign key
(st_id) references student(rollno);

INSERT INTO LAPTOP VALUES (2323,"HP 323",33330,102),(2422,"ASUS ROG",43433,102);
INSERT INTO LAPTOP VALUES (323,"HP222323",33430,104),(3322,"MACKBOOK",10433,103);
select * FROM LAPTOP;

create table qualifications(
q_id int primary key auto_increment,
pass_year varchar(4) not null,
name varchar(500) not null,
about varchar(100),
st_id int,
foreign key(st_id) references student(rollno));

insert into qualifications(q_id,pass_year,name,about,st_id) values (11,"2022","b.tech","from iimt",102),(22,"2033","m.tech","from iit",102);
select*from qualifications;
desc laptop;
desc qualifications;

select rollno,name,city,lp_id,model,price,st_id from student as a left join laptop as b
on a.rollno=b.st_id
union
select rollno,name,city,lp_id,model,price,st_id from student as a 
right join laptop as b
on a.rollno=b.st_id;

