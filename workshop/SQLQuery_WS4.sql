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

--- cau 25
select *
from DMSV
where Phai = N'Nữ' and TenSV like '%N%'

------- C
--- cau 26
select HoSV, TenSV, NoiSinh, NgaySinh
from DMSV
where MONTH(NgaySinh) = 2

--- cau 27
select HoSV + ' ' + TenSV as 'Họ tên sinh viên', DATEDIFF(year, NgaySinh, GETDATE()) as 'Tuổi',  HocBong
from DMSV
where DATEDIFF(year, NgaySinh, getDate()) > 20

--- cau 28
use QuanLyDiemSV_WS4
select HoSV + ' ' + TenSV as 'Họ tên sinh viên', DATEDIFF(year, NgaySinh, GETDATE()) as 'Tuổi',  HocBong
from DMSV
where DATEDIFF(year, NgaySinh, getDate()) > 20 and DATEDIFF(year, NgaySinh, GETDATE()) < 25

--- cau 29
select HoSV + ' ' + TenSV as 'Họ tên sinh viên', Phai, NgaySinh
from DMSV 
where MONTH(NgaySinh) <= 4 and MONTH(NgaySinh) >= 1 and YEAR(NgaySinh) = 1990

--- cau 30
select MaSV, Phai, MaKhoa, 
IIF (HocBong > 500 , N'Học bổng cao' , N'Mức trung bình')  as  N'Mức học bổng'
from DMSV

--- cau 32
select count(MaSV) as 'Tong so sinh vien'
from DMSV

--- cau 33
select count(MaSV) as 'Tong so sinh vien', sum(case Phai when N'Nữ' then 1 else 0 end) as 'So sinh vien nu'
from DMSV
--- cau 33 (c2)
select 'Tổng số sinh viên' = COUNT(MaSV), 'Nữ' = t.Nu 
from DMSV, (select COUNT(MaSV) as 'Nu' 
from DMSV
where Phai = N'Nữ') as T
group by T.Nu
-- chưa hiểu chỗ group by T.Nu

--- cau 34
select 'Ma khoa' = MaKhoa , 'So sinh vien' = count(MaSV)
from DMSV
group by MaKhoa

-- cau 35 (3 cach)
select mh.TenMH 'Ten mon hoc', 'So luong sinh vien' = count(distinct kq.MaSV)
from KetQua as kq, DMMH as mh
where kq.MaMH = mh.MaMH
group by mh.TenMH

select mh.TenMH 'Ten mon hoc', 'So luong sinh vien' = count(distinct kq.MaSV)
from KetQua as kq inner join DMMH as mh on kq.MaMH = mh.MaMH
group by mh.TenMH

select kq.MaMH 'Ma mon hoc', 'So luong sinh vien' = count(distinct kq.MaSV)
from KetQua as kq, DMMH as mh
where kq.MaMH = mh.MaMH
group by kq.MaMH

-- cau 36
select 'Tong so mon hoc' = count(distinct MaMH)
from KetQua

-- cau 37
select 'Ten khoa' = kh.TenKhoa, 'Hoc bong' = sum(sv.HocBong)
from DMSV as sv inner join DMKhoa as kh on sv.MaKhoa = kh.MaKhoa
group by kh.TenKhoa

-- cau 38
select 'Ten khoa' = kh.TenKhoa, 'Hoc bong cao nhat' = max(sv.HocBong)
from DMSV as sv inner join DMKhoa as kh on sv.MaKhoa = kh.MaKhoa
group by kh.TenKhoa

-- cau 39
select 'Ten khoa' = kh.TenKhoa, 'Sinh vien nam' = sum(case sv.Phai when 'Nam' then 1 else 0 end), 
'Sinh vien nu' = sum(case sv.Phai when N'Nữ' then 1 else 0 end)
from DMSV as sv inner join DMKhoa as kh on sv.MaKhoa = kh.MaKhoa
group by kh.TenKhoa

-- cau 40
select 'Tuoi' = year(GETDATE()) - year(NgaySinh), 'So luong' = count(MaSV) 
from DMSV
group by YEAR(GETDATE()) - year(NgaySinh)

-- cau 41: Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường. 
select 'Năm sinh' = year(NgaySinh), 'So luong' = count(MaSV)
from DMSV
group by year(NgaySinh)
having COUNT(MaSV) = 2

-- cau 42: Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường. 
select NoiSinh, 'So luong sinh vien' = COUNT(MaSV)
from DMSV
group by NoiSinh
having count(MaSV) >= 2

-- cau 43: Cho biết những môn nào có trên 3 sinh viên dự thi
select 'Ten mon hoc' = mh.TenMH, 'So sinh vien tham gia' = count (distinct MaSV) 
from KetQua as kq inner join DMMH as mh on kq.MaMH = mh.MaMH 
group by mh.TenMH
having COUNT(distinct MaSV) >= 3

-- cau 44: Cho biết những sinh viên thi lại trên 2 lần. 
select 'Ten mon hoc' = mh.TenMH,'Ten sinh vien' = sv.HoSV + ' ' + sv.TenSV ,'So lan thi lai' = count (kq.MaSV) 
from KetQua as kq inner join DMSV as sv on kq.MaSV = sv.MaSV 
				 inner join DMMH as mh on kq.MaMH = mh.MaMH
group by mh.TenMH, sv.HoSV + ' ' + sv.TenSV
having COUNT(kq.MaSV) >= 2

-- cau 45: Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0 
select 'Ho ten sinh vien' = sv.HoSV + ' ' + sv.TenSV, 'Diem sinh vien' = kq.Diem, kq.LanThi, kq.MaMH
from KetQua as kq inner join DMSV as sv on kq.MaSV = sv.MaSV
where kq.LanThi = 1 and kq.Diem >= 7 and sv.Phai = 'Nam'
group by sv.HoSV + ' ' + sv.TenSV, kq.LanThi, kq.Diem, kq.MaMH

-- cau 46: Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
select sv.HoSV + ' ' + sv.TenSV as 'Ho ten sinh vien', 
'So mon thi truot' = sum(case when kq.diem < 5 and kq.LanThi = 1 then 1 else 0 end)

from KetQua kq inner join DMSV sv on kq.MaSV = sv.MaSV
group by sv.HoSV + ' ' + sv.TenSV
having sum(case when kq.diem < 5 and kq.LanThi = 1 then 1 else 0 end) >= 2

-- cau 47 - Cho biết danh sách những khoa có sinh viên nam 
select DMKhoa.TenKhoa, 'So sinh vien nam' = sum(case when DMSV.Phai = 'Nam' then 1 else 0 end)
from DMSV inner join DMKhoa on DMSV.MaKhoa = DMKhoa.MaKhoa
group by DMKhoa.TenKhoa
having sum(case when DMSV.Phai = 'Nam' then 1 else 0 end) >= 1

-- cau 48: Cho biết những khoa có 2 sinh đạt học bổng từ 100.000 đến 200.000. 
select DMKhoa.TenKhoa, 'So sinh vien dat hoc bong 100-200k' = sum(case when DMSV.HocBong > 100000 and DMSV.HocBong < 200000 then 1 else 0 end)
from DMSV inner join DMKhoa on DMSV.MaKhoa = DMKhoa.MaKhoa
group by DMKhoa.TenKhoa
having sum(case when DMSV.HocBong > 100000 and DMSV.HocBong < 200000 then 1 else 0 end) > 0

--49. Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 1. 
select DMMH.TenMH, 
sum(case when KetQua.Diem < 5 and KetQua.LanThi = 1 then 1 else 0 end) as 'Số sinh viên rớt môn lần 1',
sum(case when KetQua.Diem >= 5 and KetQua.LanThi = 1 then 1 else 0 end) as 'Số sinh viên đậu môn lần 1'
from KetQua inner join DMMH on KetQua.MaMH = DMMH.MaMH
group by DMMH.TenMH
-- cau 50: Lap lai cau 39
-- cau 51: Cho biết sinh viên nào có học bổng cao nhất. 
--a: danh sach hoc bong
--b: hoc bong cao nhat
select HocBong
from DMSV
--
select * from DMSV
where HocBong >= all(select HocBong from DMSV)

-- cau 52: Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
-- diem thi va lan 1
select Diem
from KetQua
where LanThi = 1
-- sinh vien diem thi cao nhat
select *
from DMSV as a inner join KetQua as b on a.MaSV = b.MaSV
where LanThi = 1 and b.Diem >= all (select Diem from KetQua where LanThi = 1) 

-- cau 53: Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
-- chon tuoi tu khoa anh van
select year(GETDATE()) - year(NgaySinh)
from DMSV
where MaKhoa = 'AV'
-- sinh vien tuoi lon nhat
select * 
from DMSV
where MaKhoa = 'AV' and 
year(GETDATE()) - year(NgaySinh) >= all(select year(GETDATE()) - year(NgaySinh) 
										from DMSV
										where MaKhoa = 'AV')
-- cau 54: Cho biết khoa nào có đông sinh viên nhất. 
--tong sinh vien tung khoa
select count(MaSV) as 'so luong sinh vien' 
from DMSV
group by MaKhoa
--chon khoa sinh vien dong nhat
select b.TenKhoa, count(a.MaSV) as 'so luong sinh vien'
from DMSV as a inner join DMKhoa as b on a.MaKhoa = b.MaKhoa
group by a.MaKhoa, b.TenKhoa
having count(a.MaSV) >= all (select count(MaSV) as 'so luong sinh vien' 
							from DMSV
							group by MaKhoa)

--- cau 55: Cho biết khoa nào có đông nữ nhất. 
--so luong sinh vien nu tung khoa 
select count(MaSV)
from DMSV 
where Phai = N'Nữ'
group by MaKhoa
--tim so khoa dong nguoi nhat
select b.TenKhoa, count(a.MaSV) as 'Số lượng sinh viên nữ'
from DMSV as a inner join DMKhoa as b on a.MaKhoa = b.MaKhoa
where Phai = N'Nữ'
group by a.MaKhoa, b.TenKhoa
having count(a.MaSV) >= all (select count(MaSV)
							from DMSV 
							where Phai = N'Nữ'
							group by MaKhoa)
--56. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất. 

select mamh
from ketqua 
where lanthi=1 and diem<5
group by mamh
having count(diem)>=all (select count(diem)
							from ketqua
							where lanthi=1 and diem<5
							group by mamh)

--57. Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn điểm thi văn 
--phạm của sinh viên học khoa anh văn. 
select distinct  kq.masv
from ketqua kq, dmsv sv
where sv.masv=kq.masv and mamh='05' and makhoa not like 'av' and diem>(
																	select diem
																	from ketqua kq, dmsv sv
																	where sv.masv=kq.masv and mamh='05' and makhoa='av'
																	)

--G.  Truy vấn con trả về nhiều giá trị, sử dụng lượng từ all, any, union, top. 
--58. Cho biết sinh viên có nơi sinh cùng với Hải. 
select masv,hosv+' '+tensv
from dmsv
where noisinh=( select noisinh
				from dmsv
				where tensv=N'hải')
--59. Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của sinh viên thuộc khoa anh văn 
select masv
from dmsv
where hocbong>=all (select hocbong from dmsv where makhoa='av')
--60. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên học khóa anh văn 
select masv,hocbong
from dmsv
where hocbong>=any (select hocbong from dmsv where makhoa='av')
--61. Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần 1 
--môn cơ sở dữ liệu của những sinh viên khác. 
select masv
from ketqua
where mamh='01' and lanthi=2 and diem>=all(select diem from ketqua where mamh='01' and lanthi=1)
--62. Cho biết những sinh viên đạt điểm cao nhất trong từng môn. 
select  masv,ketqua.mamh,diem
from ketqua, (select mamh, max(diem) as maxdiem
	from ketqua
	group by mamh) a
where ketqua.mamh=a.mamh and diem=a.maxdiem
--63. Cho biết những khoa không có sinh viên học. 	
select *
from dmkhoa
where  not exists (select distinct makhoa
						from ketqua,dmsv where ketqua.masv=dmsv.masv and makhoa=dmkhoa.makhoa)
--64. Cho biết sinh viên chưa thi môn cơ sở dữ liệu. 
select *
from dmsv
where not exists
(select  distinct*
from ketqua
where mamh = '01' and masv=dmsv.masv)
--65. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2. 
select masv
from ketqua kq
where lanthi=2 and not exists
(select *
from ketqua
where lanthi=1 and masv=kq.masv)
--66. Cho biết môn nào không có sinh viên khoa anh văn học. 
select tenmh
from dmmh
where
not exists
(select mamh
from ketqua kq,dmsv sv 
where sv.masv=kq.masv and sv.makhoa='av' and dmmh.mamh=mamh)

--67. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm. 
Select MaSV
	From DMSv dmsv
	Where   MaKhoa='AV' And Not Exists (Select *
											From KetQua
											Where MaMH='05' And MaSV=dmsv.MaSV		
										)


--68. Cho biết những sinh viên không rớt môn nào. 
Select MaSV
	From DMSV dmsv
	Where Not Exists (Select *
							From KetQua
							Where Diem<=5 And MaSV=dmsv.MaSV				
						)



--69. Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên chưa bao 
--giờ rớt.
Select MaSV,MaKhoa,HocBong
	From DMSv dmsv
	Where MaKhoa='AV' And HocBong>0 And Not Exists (Select *
														From KetQua
														Where Diem<5 And MaSV=dmsv.MaSV													
													)


--70. Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa nào có ít 
--sinh viên nhận học bổng nhất. 
Select MaKhoa,count(MaSV)'So Luong SV'
	From DMSV
	Where HocBong>0
	Group By MaKhoa
	Having count(MaSV)>=All (Select count(MaSV)
								From DMSv
								where hocbong>0
								Group By MaKhoa
							)
UNION
Select MaKhoa,count(MaSV)'So Luong SV'
		From DMSV
		Where HocBong>0
		Group By MaKhoa
		Having count(MaSV)<=All (Select count(MaSV)
									From DMSV
									where hocbong>0
									Group By MaKhoa
								)


--71. Cho biết 3 sinh viên có học nhiều môn nhất. 
 
Select top 3 MaSV,Count(Distinct MaMH)'Số môn học'
	From KetQua
	Group By MaSV
	Having Count(Distinct MaMH)>=All(Select count( distinct MaMH)
										From KetQua										
										Group By MaSV
									)





select * from KetQua
select * from DMSV


use QuanLyDiemSV_WS4
select * from DMKhoa
select * from DMSV
select * from DMMH
select * from KetQua
