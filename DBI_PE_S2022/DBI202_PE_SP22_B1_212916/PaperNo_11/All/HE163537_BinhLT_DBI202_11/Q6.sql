select s.SupplierID, s.SupplierName, 'NumberOfProducts' = count(distinct p.ProductID) from Suppliers s inner join Products p 
on s.SupplierID = p.SupplierID 
group by s.SupplierID, s.SupplierName
having count(distinct p.ProductID) >= all (
select count(distinct p.ProductID) from Suppliers s inner join Products p 
on s.SupplierID = p.SupplierID
group by s.SupplierID)
-- select * from Products


