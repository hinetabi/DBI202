--drop trigger q1
CREATE TRIGGER q1
ON Products
FOR update
AS
IF (select UnitsInStock from deleted) = 0 and (select UnitPrice from inserted) > 0
BEGIN
PRINT N'Không cho phép nhập unitPrice >0 nếu unitInstock = 0'
ROLLBACK TRANSACTION
END