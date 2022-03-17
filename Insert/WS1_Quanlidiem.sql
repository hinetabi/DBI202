--use master
--drop database QLDIEM
--create database QLDIEM
use QLDIEM
create table Class(ClassCode varchar(10) primary key, 
HeadTeacher varchar(30), Room varchar(30), TimeSlot varchar(30),
CloseDate datetime)

create table Student(RollNo varchar(10) primary key, 
ClassCode varchar(10) foreign key references Class(ClassCode), 
FullName varchar(30), Male bit, 
BirthDate datetime, Address varchar(30), Province char(2), Email varchar(30))

create table Subject(SubjectCode varchar(10) primary key, 
SubjectName varchar(40), 
Wtest bit, Ptest bit, 
Wtest_per smallint, Ptest_per int)

create table Mark(RollNo varchar(10) foreign key references Student(RollNo),
SubjectCode varchar(10) foreign key references Subject(SubjectCode), 
WMark float, PMark float, Mark float)

insert into Class(ClassCode, HeadTeacher, Room, TimeSlot, CloseDate) 
values ('C0609M', 'Nguyen Trung', 'Class 2, Lab 2', '19:30 - 21:30', '9/25/2008'), 
('C0611L', 'Phan Dang', 'Class 1, Lab 1', '17:30 - 19:30', '10/21/2008'),
('T0611H', 'Vu Tran', 'Class 2, Lab 2', '9:30 - 11:30', '8/15/2008')

insert into Subject(SubjectCode, SubjectName, Wtest, Ptest, Wtest_per, Ptest_per)
values ('C', 'Elementary Programming with C', 1, 1, 40, 60), 
('CF', 'Computer Fundamentals', 1, 0, 100, 0),
('DWMX', 'Web Page Designing with Dreamweaver MX', 1, 1, 40, 60),
('HDJ', 'HTML, DHTML & Java Script', 1, 1, 40, 60),
('SQL1', 'SQL 1', 1, 0, 100, 0),
('SQL2', 'SQL 2', 1, 1, 40, 60)

insert into Student(RollNo, ClassCode, FullName, Male, BirthDate, Address, Province, Email) 
values ('A01', 'C0611L', 'Nguyen Hung', 1, '11/23/1982', '65 Hoang Hoa', 'HN', null),
('A02', 'C0611L', 'Thanh Trong', 1, '10/21/1983', '', 'HT', 'trong@fpt.com.vn'),
('A03', 'C0611L', 'Dinh Dung', 1, '10/19/1986', '6 Tran Phu', 'HN', 'dung@fpt.vn'),
('A04', 'C0611L', 'Xuan Nam', 1, '1/20/1985', '3 Kim Ma', 'HN', null),
('A05', 'C0611L', 'Dinh Hieu', 1, '10/10/1984', '', 'HP', null), 
('A06', 'C0611L', 'Huong Thao', 0, '9/11/1986', '', 'ND', 'thao@yahoo.com'),
('A07', 'C0611L', 'Thu Huong', 0, '10/22/1986', '', 'ND', null),
('B01', 'C0609M', 'Nguyen Hung', 1, '11/23/1982', '65 Hoang Hoa', 'HN', null),
('B02', 'C0609M', 'Thanh Binh', 1, '10/21/1983', '', 'HT', null)

insert into Mark(RollNo, SubjectCode, WMark, PMark, Mark) 
values ('A01', 'C', 20, 10, 14),
 ('A01', 'CF', 20, 0, 8),
 ('A01', 'HDJ', 18, 12, 14.4),
 ('A02', 'C', 23, 15, 18.2),
 ('A02', 'CF', 23, 0, 9.2)

select * from Class
select * from Subject
select * from Student
select * from Mark