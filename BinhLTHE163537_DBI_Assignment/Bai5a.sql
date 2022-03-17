use AI1605
go
create table TuyenBay(MaTB varchar(30) primary key,
tenTPKhoiHanh nvarchar(max) not null, tenTPDen nvarchar(max) not null,
donGiaVe float, soGioBay float)

create table DonViBay(maDonViBay varchar(30) primary key,
TenDonVi nvarchar(max) not null)

create table PhiCong(maDonViBay varchar(30) foreign key references DonViBay(MaDonViBay),
maPhiCong varchar(30) primary key, hoTen nvarchar(max), 
Phai nvarchar(max), ngaySinh date)

create table ChuyenBay(maCB varchar(30) primary key,  
maTB varchar(30) foreign key references TuyenBay(MaTB),
LoaiMayBay nvarchar(max))

create table HanhKhach(MaHK varchar(30) primary key, 
MaCB varchar(30) foreign key references ChuyenBay(maCB), 
NgaySinh date, Phai nvarchar(max),  Hoten nvarchar(max)
)

create table DieuKhien(MaCB varchar(30) foreign key references ChuyenBay(maCB),
maPhiCong varchar(30) foreign key references PhiCong(maPhiCong))