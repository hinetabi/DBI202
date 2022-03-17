create proc q10
as
begin
delete from PHONGBAN where 
MAPHG not in (select distinct MAPHG from NHANVIEN)
end
