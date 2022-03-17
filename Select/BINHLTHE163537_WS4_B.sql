use QuanLyDiemSV_WS4

-- cau 9
select MaSV, HoSV, TenSV, HocBong
from DMSV
order by MaSV
go
--- cau 10
select MaSV, HoSV + ' ' + TenSV as 'Họ tên sinh viên', Phai, NgaySinh
from DMSV
order by Phai
go
--- cau 11
select MaSV, HoSV + ' ' + TenSV as 'Họ tên sinh viên', NgaySinh, HocBong
from DMSV
order by NgaySinh asc, HocBong desc
go
--- cau 12
select MaMH, TenMH, SoTiet
from DMMH
where TenMH like 'T%'
go
--- cau 13
select HoSV + ' ' + TenSV as 'Họ tên sinh viên', NgaySinh, Phai
from DMSV
where TenSV like '%I'
go
--- cau 14
select MaKhoa, TenKhoa
from DMKhoa
where TenKhoa like '_N%'
go
--- cau 15: unicode -> add N
select *
from DMSV
where HoSV like N'%Thị%'
go
--- cau 16
select MaSV, HoSV + ' ' + TenSV as 'Họ tên sinh viên', Phai, HocBong
from DMSV
where TenSV like '[a-m]%'
go
--- cau 17
select MaSV, HoSV + ' ' + TenSV as 'Họ tên sinh viên', NgaySinh, NoiSinh, HocBong
from DMSV
where TenSV like '%[a-m]%'
order by TenSV, HoSV
go
--- cau 18
select MaSV, HoSV + ' ' + TenSV as 'Họ tên sinh viên', MaKhoa, HocBong
from DMSV
where HocBong > 100000
order by MaKhoa desc
go
--- cau 19
select MaSV, HoSV + ' ' + TenSV as 'Họ tên sinh viên', MaKhoa, NoiSinh, HocBong
from DMSV
where HocBong > 150000 and NoiSinh = N'Hà Nội'
go
--- cau 20
select MaSV, MaKhoa, Phai
from DMSV
where MaKhoa = 'AV' or MaKhoa = 'VL'
go
select * from DMSV
--- cau 21
use QuanLyDiemSV_WS4
select MaSV, NgaySinh, NoiSinh, HocBong
from DMSV
where NgaySinh > '01/01/1991' and NgaySinh < '06/05/1992'

--- cau 22
select MaSV, NgaySinh, Phai, MaKhoa
from DMSV
where HocBong > 80000 and HocBong < 150000
go

--- cau 23
select MaMH, TenMH, SoTiet
from DMMH
where SoTiet > 30 and SoTiet < 45
go

--- cau 24
select MaSV, HoSV + ' ' + TenSV as 'Họ tên sinh viên', DMKhoa.TenKhoa, Phai
from DMSV, DMKhoa 
where Phai = 'Nam' and (DMSV.MaKhoa = 'AV' or DMSV.MaKhoa = 'TH') and DMSV.MaKhoa = DMKhoa.MaKhoa

select * from DMKhoa
select * from DMSV
select * from DMMH
--- cau 25
select *
from DMSV
where Phai = N'Nữ' and TenSV like '%N%'
