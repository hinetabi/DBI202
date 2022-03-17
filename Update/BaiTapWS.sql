use WS_07022022
---WS1----------------------------------------------

where closeDate < Convert(Datetime,'01-01-2005') 
select * from Class

--ws2--------------------------------------------
update HoaDonChiTiet set ThanhTien=DonGia*SoLuong*(1-GiamGia)

--w3-------------------------------------------------


---ws4----------------------------------------------
--cau2:Cập nhập số tiết  môn học có mã 05 thành 45
update DMMH set SoTiet='45' where MaMH='05'

--cau5:Thay đổi ngày sinh sinh viên có mã b02 thành '05/07/1990’
update DMSV set NgaySinh='05/07/1990' where MaSV='B02'

--cau3,4:cập nhập sinh viên có mã b01 với tensv là Kỳ, phái là Nam
update DMSV set TenSV='Ky',Phai='Nam' where MaSV='B01'

--cau6:Tăng học bổng sin viên có makhoa Av thêm 100000
update DMSV set HocBong=HocBong+100000 where MaKhoa='AV'

--cau7: Xoa danh sach ket qua co lan thi =2 va diem <5
delete from KetQua where LanThi=2 AND Diem<5

--cau8: Xoa danh sach sinh vien khong co hoc bong
select * from DMSV
delete from KetQua where MaSV='B01'
delete from DMSV where HocBong=0

--cau80:Xoá tất cả những sinh viên chưa dự thi môn nào. 
delete from KetQua where LanThi=0

--ws5------------------------------------