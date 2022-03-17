CREATE TRIGGER q4
ON Products
FOR UPDATE
AS
IF (select SupplierID from inserted) not in (select SupplierID from Suppliers)
BEGIN
PRINT N'Giá trị SupplierID khi update Products không tồn tại trên SupplierID của Supplier'
ROLLBACK TRANSACTION
END
