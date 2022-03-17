CREATE TRIGGER q3
ON Products
FOR UPDATE
AS
IF (select CategoryID from inserted) not in (select CategoryID from Categories)
BEGIN
PRINT N'Giá trị CatagoryID khi thêm mới Products không tồn tại trên CategoryID của Category'
ROLLBACK TRANSACTION
END