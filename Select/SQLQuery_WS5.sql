use QuanLyDiemSV

-- 1 Liệt kê danh sách các lớp của khoa, thông tin cần Malop, TenLop, MaKhoa
select * 
from Lop

-- 2: Lập danh sách sinh viên gồm: MaSV, HoTen, HocBong
select MaSV, HoTen, HocBong
from SinhVien

-- 3: Lập danh sách sinh viên có học bổng. Danh sách cần MaSV, Nu, HocBong
select MaSV,  Nu,  HocBong
from SinhVien
where HocBong > 0

-- 4: Lập danh sách sinh viên nữ. Danh sách cần các thuộc tính của quan hệ sinhvien
select *
from SinhVien
where Nu = 0

-- 5: Lập danh sách sinh viên có họ ‘Trần’
select *
from SinhVien
where  HoTen like N'%Trần%'

--6: Lập danh sách sinh viên nữ có học bổng
select *
from SinhVien
where Nu = 0 and HocBong > 0

--7: Lập danh sách sinh viên nữ hoặc danh sách sinh viên có học bổng
select *
from SinhVien
where Nu = 0 or HocBong > 0

-- Câu8: Lập danh sách sinh viên có năm sinh từ 1978 đến 1985. Danh sách cần các thuộc tính của quan hệ SinhVien
select *
from SinhVien
where YEAR(NgaySinh) >= 1978 and YEAR(NgaySinh) <= 1985

--Câu9: Liệt kê danh sách sinh viên được sắp xếp tăng dần theo MaSV
select *
from SinhVien
order by MaSV

-- Câu10: Liệt kê danh sách sinh viên được sắp xếp giảm dần theo HocBong
select *
from SinhVien
order by HocBong desc

-- Câu 11: Lập danh sách sinh viên có điểm thi môn CSDL>=8
select c.MaSV, c.HoTen, c.NgaySinh, b.DiemThi
from MonHoc a inner join KetQua b on a.MaMH = b.MaMH
				inner join SinhVien c on b.MaSV = c.MaSV
where b.MaMH in (select	MaMH
				from MonHoc
				where TenMH = 'DBI202')

-- Câu 12: Lập danh sách sinh viên có học bổng của khoa CNTT. Thông tin cần: MaSV, HoTen, HocBong,TenLop
--  khoa CNTT (ma lop)
select MaKhoa
from Khoa 
where TenKhoa = 'Software Engineer'
-- cac lop khoa cntt
-- sinh vien lop va co hoc bong -> join sinh vien vs lop
select a.MaSV, a.HoTen, a.HocBong, b.TenLop
from SinhVien a inner join Lop b on a.MaLop = b.MaLop
where HocBong > 0 and b.MaKhoa in  (select MaKhoa
									from Khoa 
									where TenKhoa = 'Software Engineer')

-- 13: Lập danh sách sinh viên có học bổng của khoa CNTT. Thông tin cần: MaSV, HoTen, HocBong,TenLop, TenKhoa
select a.MaSV, a.HoTen, a.HocBong, b.TenLop, c.TenKhoa
from SinhVien a inner join Lop b on a.MaLop = b.MaLop
				inner join Khoa c on b.MaKhoa = c.MaKhoa
where HocBong > 0 and c.TenKhoa = 'Software Engineer'

-- 14: Cho biết số sinh viên của mỗi lớp
select b.MaLop, b.TenLop, 'So sinh vien trong lop'= count (a.MaSV)
from SinhVien a full join Lop b on a.MaLop = b.MaLop
--where a.Nu = 0
group by b.MaLop, b.TenLop
-- 15: Cho biết số lượng sinh viên của mỗi khoa. (chưa in ra được khoa nào có 0 học sinh)
select c.MaKhoa, c.TenKhoa , 'So sinh vien trong khoa'= count (a.MaSV)
from SinhVien a full join Lop b on a.MaLop = b.MaLop
				full join Khoa c on b.MaKhoa = c.MaKhoa
group by c.MaKhoa, c.TenKhoa

-- 16: Cho biết số lượng sinh viên nữ của mỗi khoa.
select c.MaKhoa, c.TenKhoa , 'So sinh vien nu trong khoa'= count (a.MaSV)
from SinhVien a full join Lop b on a.MaLop = b.MaLop
				full join Khoa c on b.MaKhoa = c.MaKhoa
where a.Nu = 0
group by c.MaKhoa, c.TenKhoa


select * from SinhVien
select * from Lop
select * from Khoa
select * from MonHoc
select * from KetQua