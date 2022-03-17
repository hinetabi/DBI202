
use BANHANG 

-- create other...create database workshop02
use BANHANG
create table NhanVien(
	MaNV nvarchar(10) primary key, 
	HoTen nvarchar(30), 
	ChucDanh nvarchar(30),
	NgaySinh smalldatetime,
	NgayNhanViec smalldatetime,
	DiaChi nvarchar(50),
	Phone nvarchar(30),
	Photo image,
	GhiChu ntext
)

use BANHANG
create table KhachHang(
	maKH nvarchar(10) primary key,
	TenKH nvarchar(30),
	DiaChi ntext,
	Phone nvarchar(24),
	Email nvarchar(30)
)
create table HoaDon(
	MaHD nvarchar(10) primary key,
	MaKH nvarchar(10) foreign key references KhachHang(MaKH),
	MaNV nvarchar(10) foreign key references NhanVien(MaNV),
	NgayLapHD smalldatetime,
	NgayNhanHang smalldatetime,
	Tien int, 
	Thue real,
	TongSoTien int
)

create table LoaiSanPham(
	MaLoaiSP nvarchar(10) primary key,
	TenLoaiSp nvarchar(15),
	MoTa ntext,
) 

create table NhaCungCap(
	MaNhaCC nvarchar(10) primary key,
	TenNhaCC nvarchar(40),
	DiaChi nvarchar(60),
	Phone nvarchar(24),
	Fax nvarchar(24),
	HomePage ntext,
)

create table SanPham(
	MaSp nvarchar(10) primary key,
	TenSp nvarchar(40),
	MaNhaCC nvarchar(10) foreign key references NhaCungCap(MaNhaCC),
	MaLoaiSP nvarchar(10) foreign key references LoaiSanPham(MaLoaiSp),
	DVT nvarchar(20),
	DonGia smallint,
	SoLuong smallint,
	SoLuongTT smallint,
	Discontinued bit
)

create table HoaDonChiTiet(
	MaHD nvarchar(10) foreign key references HoaDon(MaHD),
	MaSP nvarchar(10) foreign key references SanPham(MaSP),
	DonGia int,
	SoLuong smallint,
	GiamGia real,
	ThanhTien int,
)

insert into NhaCungCap(MaNhaCC,TenNhaCC,DiaChi,Phone,HomePage)
values ('BAN','Cong ty Ban mai','64 Hang Bun','048286745','www.binhminh.com'),
		('OCE','Cong ty Ocean','26 Tran Quy Cao','048924712','www.ocean.com'),
		('RDO','Cong ty Rang Dong','97 Hoang Hoa Tham','048923711','www.rdong.com')
select * from NhaCungCap

insert into KhachHang(MaKH,TenKH,DiaChi,Phone,Email)
values ('01','Hoa Binh','Ha Noi','0913567222','hb@fpt.vn'),
		('02','Quang Long','Ha Noi','048123445','qlong@Yahoo.com'),
		('03','Nguyen Tuan','Hai Phong','098467231','Tuan@yahoo.com')
select * from KhachHang

insert into NhanVien(MaNV,HoTen,ChucDanh,NgaySinh,NgayNhanViec,DiaChi,Phone)
values ('01','Lan Huong','Ban Hang','11/23/1980','1/15/2004','Hoa Binh','0912349865'),
		('02','Bich Hue','Tiep thi','12/31/1979','1/22/2001','Quang Binh','098768324'),
		('03','Tung Chi','Ban hang','8/9/1986','1/14/2005','Hai Phong','098568253'),
		('04','Kien Cuong','Thu kho','9/19/1979','1/22/2003','Ha Noi','0912367299')	
select * from NhanVien

insert into LoaiSanPham(MaLoaiSP,TenLoaiSp)
values ('DL','Dien lanh'),
		('DT','Dien tu'),
		('MP','hang my pham')
insert into LoaiSanPham(MaLoaiSP,TenLoaiSp, MoTa)
values ('TD','hang tieu dung','')
select * from LoaiSanPham

insert into SanPham(MaSp, TenSp, MaNhaCC, MaLoaiSP, DVT, DonGia, SoLuong,SoLuongTT,
Discontinued)
values ('001','VoTuyen','BAN','DT','Chiec',4000,25,5,0),
	   ('002','Radio','BAN','DT','Chiec',200,150,20,0),
	   ('003','CD player','BAN','DT','Chiec',2000,45,10,0),
	   ('004','Tu lanh','RDO','DL','Chiec',6000,22,5,0),
       ('005','May lam kem','RDO','DL','Chiec',7000,19,4,0),
	   ('007','May dieu hoa','RDO','DL','Chiec',9000,38,7,0),
       ('008','Xa phong thom','OCE','TD','Banh',6,200,50,0),
	   ('009','Duong','OCE','TD','Kg',9,550,50,0),
	   ('010','Sua','OCE','TD','Hop',120,80,20,0),
	   ('011','Mi miliket','OCE','TD','Thung',200,56,8,0)
select*from SanPham

insert into HoaDon(MaHD, MaKH, MaNV, NgayLapHD, NgayNhanHang,Tien, Thue,TongSoTien)
values ('01','02','01','12/14/2007','12/15/2007',0,0.05,0),
        ('02','01','01','1/19/2006','2/15/2006',0,0.05,0),
		('03','02','02','10/30/2006','1/1/2006',0,0.1,0)
select*from HoaDon

insert into HoaDonChiTiet(MaHD, MaSP, DonGia, SoLuong, GiamGia,ThanhTien)
values ('03','003',0,3,0.02,0),
       ('03','007',0,2,0.01,0),
	   ('03','011',0,10,0,0),
	   ('02','010',0,11,0.04,0),
	   ('02','002',0,2,0.01,0),
	   ('03','004',0,1,0.05,0),
	   ('01','009',0,15,0.02,0)
select*from HoaDonChiTiet