/*
trigger: it is stored program which is automatically excecuted in renspose to specfic event(insert,update,delete)

type of trigger:

before insert
after insert
before update
after update
before delete 
after delete
 
*/
create database triggers;
use triggers;

create table user (

user_id int primary key,
name varchar(200),
per_hour_salary int default 0,
working_hours int default 0,
total_salary int default 0
);
insert into user (user_id ,name,per_hour_salary, working_hours) values
(101,"kaka",800,8);
insert into user (user_id ,name,per_hour_salary, working_hours) values
(102,"raja",1000,10),(103,"ojha",900,9);

update user set working_hours=12,per_hour_salary=400 where user_id=102;

alter table user add column acc_count int default 0;


select *from user;

