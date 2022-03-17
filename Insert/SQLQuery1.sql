create database Demo1605
use demo1605

create table Class(classID varchar(30) primary key,className nvarchar(60) not null,
maxAmount int check(maxamount>=0 and maxAmount<=30), status bit default 1)

/*
insert into tableName values (paraList as field in design)
*/

insert into Class values('Class01', 'DBI', 29, 1)
go

select * from Class
-- problem

-- lack field
insert into Class values('Class03', 'java', 30)
go

/*
insert into tableName ([list of fields]) values (paraList of [list of fields])
*/

insert into Class(classID, className, maxAmount, status)
	values('class03', 'C', 28, 1)



insert into Class(className, classID, maxAmount, status)
	values('C++', 'class06', 28, 1),
	('C', 'class05', 26, 0)

--default 
insert into Class(classID, className, maxAmount)
	values('class08', 'HTML', 28)

--constaints
--primary key: not duplicate, not null

insert into Class(classID, className, maxAmount)
	values('class08', 'HTML', 28)

--not null : input require (class name not null)
insert into Class(classID, className)
	values('class09', 'Jupyter')

--check max amount > 0 and max amount <= 30
insert into Class(classID, className, maxAmount)
	values('class10', 'Jupyter', 31)
-- insert bên 1 trước bên nhiều sau
--foreign key 
--identity ~ auto number
--identity(start, increase)
--unique: not duplicate, can be null
-- getdate return the current date

create table Student(stuId int identity(1,1) primary key, 
studentName nvarchar(50) not null, email varchar(30) unique, 
birthday datetime default getdate(), description nvarchar(max),
classID varchar(30) foreign key references Class(classID))

/*
create table demo(key1 varchar(30), key2 varchar(40), unique(key1, key2), 
id int identity (1,1) primary key)
1 1 # 1 2 # 2 1
*/

--insert 
-- dont insert auto number (stuID)
insert into Student( studentName, email, birthday, description, classID) 
values ( 'A Hoang', 'HoangA@fpt.edu.vn', '2/17/2000', 'new student', 'class01')

--foreign key: giá trị của khóa ngoại chỉ được phép nhập các giá trị đã tồn tại ở khóa chính
insert into Student( studentName, email, birthday, description, classID) 
values ( 'Tran Thanh Tung', 'TungTT@fpt.edu.vn', '2/17/2000', 'new student', 'class02')

insert into Student( studentName, birthday, description, classID) 
values ( 'Tran The Tung', '2/17/2000', 'new student', 'class04')

select * from Class
select * from Student