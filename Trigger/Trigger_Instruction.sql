/*
create trigger CheckQuantity
on [order details]
for insert
as 
if (select Quantity from inserted) < 2
begin 
print 'Quantity of product >= 2'
rollback transaction
end
*/

/*
create trigger CheckUnitPrice
on [order details]
for insert
as 
if (select UnitPrice from inserted) <> (select UnitPrice from Products
										where ProductID = (select ProductID from inserted))
begin 
print 'Unit price must equal price of products'
rollback transaction
end
*/

/*
create trigger CheckUnitOnOrder
on Products
for UPDATE
as 
if (select UnitsOnOrder from inserted) < (select UnitsOnOrder from deleted)
begin 
print 'New Unit on Order > old Unit on Order '
rollback transaction
end
*/ 

/*
CREATE TRIGGER Check_EmployeeID
ON Employees
FOR UPDATE
AS
IF UPDATE(EmployeeID)
BEGIN
PRINT 'You cannot modify the ID of an employee'
ROLLBACK TRANSACTION
END

*/ 

CREATE TRIGGER Delete_Region
ON region
INSTEAD OF DELETE
AS
BEGIN
-- delete foreign key (nguyên tắc khi xóa: xóa bảng nhiều trước rồi xóa bảng 1)
delete from EmployeeTerritories where TerritoryID in 
(select TerritoryID from Territories 
where RegionID in (select RegionID from deleted))
-- delete foreign key
DELETE FROM Territories WHERE RegionID IN 
(SELECT RegionID FROM deleted)
-- delete primary key
DELETE FROM Region WHERE RegionID IN
(SELECT RegionID FROM deleted)
END

select * from Region
select * from Territories
delete from Region where RegionID = 1