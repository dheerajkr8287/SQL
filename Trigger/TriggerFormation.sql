-- create trigger :syntax trigger


/*
create trigger [trigger_name]
[event-before insert]
on [table] for each row

begin
.. body of trigger
end ;

*/
delimiter //
create trigger before_insert_user
before insert
on user for each row
begin
set new.total_salary=new.per_hour_salary*New.working_hours ;

end; //
delimiter ;


/*
NEWS ROWS                    OLD ROWS
--DEPEND WHAT TYPE TRIGGER CREATE KAR RHE HO??

-->INSERT-ONLY NEW ROWS ACCESS
-->NEW AND OLD ACCESS 
-->DELELTE-OLD ROWS ACCESS

*/


/*
-- CRETATE UPDATE TRIGGER
-- UPDATE TOTAL SALARY KO BASED ON UPDATION OF PERHOUR SALARY AND WORKING HOURS
*/


DELIMITER //
create trigger before_update_user
before update
on user for each row
begin
set new.total_salary=new.per_hour_salary*new.working_hours;
end;//
delimiter //

/*
 -- delete tigger 
 -- delete total salary ko based of   PERHOUR SALARY AND WORKING HOURS
*/ 


/*
why this table is being created user_log

The user_log table is introduced as a way to store information about deleted rows because once a row is deleted from the user table, its data is permanently removed unless it is backed up or logged somewhere else.

In your case, if you want to calculate total_salary during the deletion of a row and save that information, a log table like user_log is a common and practical approach.

Why is user_log Needed?
Purpose of Logging:
The user_log table stores details of users (like their calculated total_salary) before their data is deleted. This is useful for:

Auditing: Keeping track of deleted records.
Data Recovery: Restoring deleted data if needed.
Historical Tracking: Retaining a record of past actions for analysis.
Alternative to Modifying OLD:
Since the OLD pseudo-record is read-only during a DELETE operation, you cannot modify it to store calculated values (like total_salary). Instead, you log these values in another table.

If You Don't Want a Log Table
If you don’t want to create a log table and just want to calculate the total_salary during the delete operation, you can execute the calculation or log it via another mechanism, but the data will not persist after the DELETE.

*/
-- create trigger with want a log table
/*
create the log table (user_log):
This table will store details about the deleted user, including a calculated field (total_salary) and the deletion timestamp
*/

CREATE TABLE user_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(200),
    total_salary INT,
    deleted_at DATETIME
);


DELIMITER //

create trigger before_delete_user
before delete
on user for each row 
begin
declare total_salary int;
-- calculate total salary
set total_salary=old.per_hour_salary*old.working_hours;

-- insert data into the log table
insert into user_log (user_id,name,total_salary,deleted_at)values
(old.user_id,old.name,total_salary,now());

end;//
delimiter ;

DELETE FROM user WHERE user_id = 101;
SELECT * FROM user_log;
SHOW TRIGGERS WHERE `Table` = 'user';
DROP TRIGGER IF EXISTS before_delete_user;
DROP TRIGGER IF EXISTS before_delete_user1;
DROP TRIGGER IF EXISTS any_other_trigger_name;
show triggers;




-- ################  for trigger account purpose-----------#########

-- create trigger for update account count of user 

delimiter //
create trigger before_open_account
before insert 
on accounts for each row
begin
 update user set acc_count=acc_count+1 where user_id=new.user_id;
end;//
delimiter ;

-- create trigger for close account trigger

delimiter //
create trigger before_close_account
before delete
on accounts for each row
begin
update user set acc_count=acc_count-1 where user_id=old.user_id;

end;//
delimiter ;

