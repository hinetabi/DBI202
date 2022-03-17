create table NhomMonHocMo (Nhom_To varchar(50) primary key)
go

create table MonHoc(MaMH varchar(50), ten nvarchar(50), HeSoDKT float, HeSoDT float, soTinChi int, Nhom_To varchar(50) foreign key references NhomMonHocMo(Nhom_To), primary key (MaMH, Nhom_To))
go

create table HocKi (MaHK varchar(50), nam date, dot int, Nhom_To varchar(50) foreign key references NhomMonHocMo(Nhom_To), primary key (MaHK, Nhom_To))
go

create table SinhVien (MaSV varchar(50) primary key, tenSV nvarchar(50), diaChi nvarchar(50))
go

create table coDiem(Nhom_To varchar(50) foreign key references NhomMonHocMo(Nhom_To), MaSV varchar(50) foreign key references SinhVien(MaSV), DiemTongKet float, DiemThi float, DiemKT float, primary key (Nhom_To, MaSV))

create table khoa (MaKhoa varchar(50), ten nvarchar(50), MaSV varchar(50) foreign key references SinhVien(MaSV), primary key (MaKhoa, MaSV))