
create table user_details  (
uid varchar(50),
fullName varchar(200),
firstName varchar(50),
lastName varchar(50),
nic varchar(30),
gender varchar(10),
dateOfBirth varchar(20),
age varchar(10),
slAddress varchar(300),
emergencyContact varchar(20),
passportNo varchar(30) primary key,
uaeAddress varchar(300),
uaeMobileNo varchar(20),
empAddress varchar(300),
empContact varchar(30),
salary varchar(30),
slContactName varchar(100),
slContactNo varchar(20),
uaeContactName varchar(100),
uaeContactNo varchar(20),
passCode varchar(100),
createDate datetime,
updateDate datetime
);

create table service_details (
embassy_name varchar(20),
service_name varchar(20),
start_time varchar(20),
end_time varchar(20),
duration varchar(20),
t_interval varchar(20)
);


create table appointment_details (
appoint_id varchar(30),
appoint_date varchar(30),
appoint_time varchar(30),
service_catagory varchar(30),
service_type varchar(30),
appoint_user varchar(30),
appoint_stat varchar(30),
createDate datetime,
updated_user varchar(30),
updateDate datetime
);

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'slt@$rt!123$$'