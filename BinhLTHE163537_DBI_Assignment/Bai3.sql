use Bai3
go
create table  MonHoc(maMH varchar(30) primary key,
ten nvarchar(max), soTinChi int)

create table KhoaHoc(maKH varchar(30) primary key, 
soHK int not null)



create table LenLich(maMH varchar(30) foreign key references MonHoc(maMH),
maKH varchar(30) references KhoaHoc(maKH))

create table TienQuyet (maMH1 varchar(30) foreign key references MonHoc(maMH),
maMH2 varchar(30) foreign key references MonHoc(maMH))

create table soHK(maKH varchar(30) primary key references KhoaHoc(maKH),
namHoc int not null, 
hocKy int not null)
