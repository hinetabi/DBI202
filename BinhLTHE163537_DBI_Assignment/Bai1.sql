--use AI1605

Create table NhanVien(maNV varchar(30) primary key, tenNV nvarchar(50) not null, diachi nvarchar(max), ngaysinh date)
go

create table DuAn(maDA varchar(20) primary key, tenDA nvarchar(5), ngayBD dateTime)
go

create table ThamGia(luong money, maNV varchar(30) foreign key references NhanVien(maNV), maDA varchar(20) foreign key references DuAn(maDA), primary key(maNV, maDA))