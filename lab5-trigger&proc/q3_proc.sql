create proc q3
@code int
as
begin 
select n.*,p.MAPHG, p.TENPHG from PHONGBAN p inner join NHANVIEN n on p.TRPHG = n.MANV
where p.TRPHG = @code
end
