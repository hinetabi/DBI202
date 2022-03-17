use WS3_BANHANG
select * from SANPHAM
select * from KHACHHANG
select * from HOADON
select * from CHITIETHOADON

-- 2
select *
from KHACHHANG
where DIACHI = 'Tan Binh'

-- 3
select *
from SANPHAM
where TENVT like '%gach%' and GIAMUA > 110

-- 4: List all orders with these customer, by ascending order of order date 
select b.MAHD, b.NGAY, a.TENKH, a.DIACHI, a.DT
from KHACHHANG a inner join HOADON b on a.MAKH = b.MAKH
order by b.NGAY

-- 5: List all customers that did not place order in June 2000 
select distinct a.MAKH, a.DIACHI, a.DT
from KHACHHANG a inner join HOADON b on a.MAKH = b.MAKH
where year(b.NGAY) != 2000 or MONTH(b.NGAY) != 6

-- 6: List all detail orders that have GIABAN >= GIAMUA. 
-- Note that: TriGiaMua = GIAMUA * SL, TriGiaBan = GIABAN * SL.  
--> having phai di cung group by, where thi ko can
select b.MAHD, b.MAVT, a.TENVT, a.DVT, b.GIABAN, a.GIAMUA, b.SL, 
'Tri gia mua' = a.GIAMUA * b.SL, 'Tri gia ban' = b.GIABAN * b.SL
from SANPHAM a inner join CHITIETHOADON b on a.MAVT = b.MAVT
where b.GIABAN >= a.GIAMUA





-- 7: List all orders which has maximum total value as following
-- gia tri
select GIABAN * SL
from CHITIETHOADON
-- gia tri lon nhat
select  a.MAHD, b.NGAY, b.MAKH, c.TENKH, c.DIACHI,  'Tong gia tri' = a.GIABAN * a.SL
from CHITIETHOADON a inner join HOADON b on a.MAHD = b.MAHD
					inner join KHACHHANG c on b.MAKH = c.MAKH
where  a.GIABAN * a.SL >= all (select GIABAN * SL
							from CHITIETHOADON)

-- 8: List all products which were bought in minimum number of orders as following:
-- so hoa don
(select count(MAHD)
from CHITIETHOADON
group by MAVT)
-- so hoa don nho nhat
select a.MAVT, a.TENVT, a.DVT, a.GIAMUA, 'So luong hoa don' = count(b.MAHD)
from SANPHAM a inner join CHITIETHOADON b on a.MAVT = b.MAVT
group by a.MAVT, a.TENVT, a.DVT, a.GIAMUA
having count(b.MAHD) <= all (select count(MAHD)
							from CHITIETHOADON
							group by MAVT)




