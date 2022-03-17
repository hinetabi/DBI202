create trigger q2
on Products
for UPDATE
as 
if (select UnitPrice from inserted)= 0 and (select UnitsInStock from deleted) > 0
begin 
print N'Không cho update unitPrice=0 nếu UniInstock >0'
rollback transaction
end