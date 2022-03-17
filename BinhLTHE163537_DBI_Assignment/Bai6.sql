create table BenhNhan(MaBN varchar(30) primary key,
tenBN nvarchar(50) not null)
go
create table BacSi(MaBS varchar(30) primary key, TenBS nvarchar(50), chuyenmon nvarchar(50), MaBN varchar(30) foreign key references BenhNhan(MaBN) )
go
create table DieuTri(MaBS varchar(30) foreign key references BacSi(MaBS),MaBN varchar(30) foreign key references BenhNhan(MaBN), primary key(MaBS, MaBN),LanDieuTri varchar(30) )
go
create table LanDieuTri(MaBS varchar(30) foreign key references BacSi(MaBS),MaBN varchar(30) foreign key references BenhNhan(MaBN), primary key(MaBS, MaBN), Ngay date, thoigian time)