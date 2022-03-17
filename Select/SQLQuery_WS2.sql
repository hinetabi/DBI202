use BANHANG

select * from HoaDon
select * from KhachHang
select * from HoaDonChiTiet
select * from NhanVien
select * from NhaCungCap
select * from LoaiSanPham

-- cau

-- cau 9 Liệt kê danh sách tất cả các khách hàng đã mua hàng trong tháng  11/2006 và tổng số tiền mà học đã mua.
select a.maKH, a.TenKH, b.NgayLapHD
from KhachHang a inner join HoaDon b on a.maKH = b.MaKH
where month(b.NgayLapHD) = 12 and year(b.NgayLapHD) = 2007
group by a.maKH, a.TenKH, b.NgayLapHD

-- cau 10
select a.MaNV, a.HoTen,'tong so tien cua tung nhan vien' = sum(b.Tien)
from NhanVien a inner join HoaDon b on a.MaNV = b.MaNV
where year(b.NgayLapHD) = 2006
group by a.MaNV, a.HoTen
-- cau 12 - procedure

