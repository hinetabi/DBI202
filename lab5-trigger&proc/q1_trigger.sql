
create trigger q1
on nhanvien 
for insert, update
as
if (select Quantity from inserted inner join NHANVIEN) < 2
begin 
print 'Quantity of product >= 2'
rollback transaction
end
