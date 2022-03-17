create proc q5
@code int
as
begin 
select n.TEN, n.MANV, p.THOIGIAN from NHANVIEN n inner join PHANCONG p on n.MANV = p.MA_NVIEN
end
