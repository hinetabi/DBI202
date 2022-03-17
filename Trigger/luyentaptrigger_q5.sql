create trigger q5
on [order details]
for insert
as 
if (select Quantity from inserted) > (select UnitsInStock from Products)
begin 
print 'Quantity must < UnitsInStock'
rollback transaction
end

select * from Products
where ProductID = '71'