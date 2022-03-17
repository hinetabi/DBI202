-- sort
use Northwind
select * from Products
order by UnitPrice asc
go
select * from Products
order by UnitPrice desc

-- sắp xếp theo 2 fields lần lượt
select * from Products
order by UnitsInStock, UnitPrice desc

select * from Employees
order by FirstName, LastName 
