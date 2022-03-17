use QuanLyDiemSV_WS4
select * from KetQua
select * from DMKhoa
select * from DMMH
select * from DMSV
select * from KetQua

update DMMH set SoTiet = 45 where MaMH = '05'
update DMSV set NgaySinh = '05/07/1990' where MaSV = 'b02'

delete from DMSV where HocBong = 0
update DMSV set TenSV = 'Ky', Phai = 'Nam' where MaSV = 'b01'
update DMSV set HocBong = HocBong + 100000 where MaKhoa = 'AV'

delete from KetQua where LanThi = 2 and Diem < 5

