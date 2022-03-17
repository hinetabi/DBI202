create proc q6
as
begin
select p.MAPHG, p.TENPHG,'So nhan vien' =  count(n.MANV) from PHONGBAN p inner join NHANVIEN n on p.MAPHG = n.PHG
group by n.PHG, p.MAPHG, p.TENPHG
end
