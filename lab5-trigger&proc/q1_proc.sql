create proc q1
@salary int
as
begin 
select * from NHANVIEN where LUONG >= @salary
end

