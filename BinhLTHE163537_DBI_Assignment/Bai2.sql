create table MatHang(MaMH varchar(30) primary key, Gia money, MoTa nvarchar(100), TinhTrang varchar(50))
go

create table LoaiMatHang (MaLMH varchar(50), TenLoai nvarchar(50), MaMH varchar(30) foreign key references MatHang(MaMH), primary key (MaLMH, MaMH))
go

create table KhachHang(MaKH varchar(50), Ten nvarchar(50), DiaChi nvarchar(30), MaMHMua varchar(30) foreign key references MatHang(MaMH), MaMHBan varchar(30) foreign key references MatHang(MaMH), primary key(MaKH,MaMHMua, MaMHBan) )