create proc InsertKhoa
@TenKhoa varchar(50), @SoCBGD varchar (20)
as 
begin 
insert into Khoa(TenKhoa, SoCBGD)
values (@TenKhoa, @SoCBGD)
end