create proc q9
@A nvarchar(50)
as
begin
update NHANVIEN
set LUONG = LUONG * 1.1
where DCHI like '%'+@A+'%'
end