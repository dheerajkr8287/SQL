create table accounts(
account_no int primary key,
user_id int,
balance int default 0
);
insert into accounts (account_no,user_id,balance) values (201,102,4000);
insert into accounts (account_no,user_id,balance) values (202,102,9000);
insert into accounts (account_no,user_id,balance) values (203,103,80000);
DELETE FROM accounts WHERE account_no = 201;
select* from accounts;
