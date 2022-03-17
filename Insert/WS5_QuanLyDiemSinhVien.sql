use master
go
if exists(select name from sysdatabases where name ='QuanLyDiemSV')
drop Database QuanLyDiemSV

create database QuanLyDiemSV
go

use QuanLyDiemSV
create table Khoa(MaKhoa int identity(1,1) primary key, 
TenKhoa varchar(50), SoCBGD varchar(20))

create table Lop(MaLop int identity(1,1) primary key, 
MaKhoa int foreign key references Khoa(MaKhoa),
TenLop varchar(50))

create table SinhVien(MaSV int identity(1,1) primary key,
HoTen nvarchar(50), Nu bit, NgaySinh datetime, 
MaLop int foreign key references Lop(MaLop), 
HocBong int, Tinh varchar(20))

create table MonHoc(MaMH int identity(1,1) primary key, 
TenMH varchar(50), SoTiet int)

create table KetQua(MaSV int foreign key references SinhVien(MaSV), 
MaMH int foreign key references MonHoc(MaMh),
DiemThi float, primary key (MaSV, MaMH))

use QuanLyDiemSV
insert into Khoa(TenKhoa, SoCBGD) 
values ('Computer Science', 'CS123'),
('Software Engineer', 'SE121'),
('Graphic Design', 'GD101')

insert into Lop(TenLop, MaKhoa) 
values ('SE1604', '1'),
('CS1642','1'),
('SE1621','2'),
('CS1521', '2'),
('GD1603', '3'),
('GD1652', '3')

insert into SinhVien( MaLop, HoTen, Nu, NgaySinh, HocBong, Tinh) 
values ( 1, 'Le Thanh Binh', 0, '4/11/2002', 1000, 'Vinh Phuc'),
( 1, 'Do Tien Dung', 1, '4/12/2002', 1000, 'Vinh Phuc'),
(2, 'Nguyen Tuan Vu', 0, '5/9/2002', 1000, 'Vinh Phuc'),
( 3, 'Le Duy Cuong', 0, '1/12/2002', 1000, 'Vinh Phuc'),
( 1, 'Le Phu Trong', 1, '2/11/2002', 1000, 'Vinh Phuc'),
( 2, 'Cao Tam Kien', 1, '10/16/2002', 1000, 'Vinh Phuc')

insert into MonHoc(TenMH, SoTiet) 
values ('DBI202', 29),
('PRF103', 30),
('SSG102', 30),
('PRP111', 29)

insert into KetQua(MaSV, MaMH, DiemThi)
values (1,1,8.5),(1,3,9),(2,3,10),(1,2,9.5),(2,1,9.5),(2,2,9.5),
(3,1,12)

select * from KetQua
select * from Khoa
select * from Lop
select * from MonHoc
select * from SinhVien