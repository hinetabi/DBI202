Create table HanhKhach(maHK varchar(30) primary key,
ngaySinh date not null, phai nvarchar(max), hoTen nvarchar(30))
go


Create table TuyenBay(maTB varchar(30) primary key,
tenTPKhoiHanh nvarchar(max), tenTPDen nvarchar(max), donGiaVe money, soGioBay int)
go

Create table ChuyenBay(maCB varchar(30) primary key,
maTB varchar(30) foreign key references TuyenBay(maTB),
loaiMayBay nvarchar(max))
go

Create table DonViBay(maDVB varchar(30) primary key,
tenDonVi nvarchar(max))
go

create table PhiCong(MaPC varchar(30) primary key,
maDVB varchar(30) foreign key references DonViBay(maDVB),
hoTen nvarchar(max) not null, phai nvarchar(max) not null , ngaySinh date not null) 
go 

Create table VeMayBay(maVe varchar(30) primary key,
maHK varchar(30) foreign key references HanhKhach(maHK),
maCB varchar(30) foreign key references ChuyenBay(maCB))
go
