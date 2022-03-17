create proc q8
@n int
as
begin
select top (@n)* from NHANVIEN
order by LUONG desc
end
