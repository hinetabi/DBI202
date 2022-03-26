CREATE TRIGGER deleteSupplier
ON Suppliers
INSTEAD OF DELETE
AS
BEGIN
-- delete foreign key
	
	-- delete purchaseorderlines
	delete from PurchaseOrderLines 
	where PurchaseOrderID in (
						select PurchaseOrderID from PurchaseOrders 
						where SupplierID in (select SupplierID from deleted)
	) and ProductID in  (select ProductID from Products where SupplierID in (select SupplierID from deleted))
	----
	delete from SupplierTransactions 
	where PurchaseOrderID in (select PurchaseOrderID from PurchaseOrders 
							where SupplierID in (select SupplierID from deleted))
		and SupplierID in (select SupplierID from deleted)
	---
	delete from Products where SupplierID in (select SupplierID from deleted)
	delete from PurchaseOrders where SupplierID in (select SupplierID from deleted)
	---
	delete from Suppliers where SupplierID in (select SupplierID from deleted)
	---
	select d.SupplierID, d.SupplierName, d.SupplierCategoryID, sc.SupplierCategoryName from deleted d inner join SupplierCategories 
	sc on d.SupplierCategoryID = sc.SupplierCategoryID
END

