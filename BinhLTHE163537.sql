
use Northwind
-- 1. 
select LOWER(LastName+' '+FirstName) as 'Full name', TitleOfCourtesy 
from Employees

-- 2. 
select UPPER(LastName+' '+FirstName) as 'Full name' 
from Employees

-- 3. 
select EmployeeID, LastName, FirstName, Title, City, Country
from Employees
where Country = 'USA'

-- 4. 
select CustomerID, CompanyName, ContactName, ContactTitle, Country
from Customers
where Country = 'UK'

-- 5. 
select CustomerID, CompanyName, Address, City, Country
from Customers
where Country = 'Mexico'

-- 6. 
select CustomerID, ContactName, Phone, Address, City
from Customers
where Country = 'Sweden'

-- 7. 
use Northwind
select ProductID, ProductName, UnitPrice, UnitsInStock
from Products
where UnitsInStock >= 5 and UnitsInStock <= 10

-- 8. 
select ProductID, ProductName, UnitPrice, ReorderLevel, UnitsOnOrder
from Products
where UnitsOnOrder >= 60 and UnitsOnOrder <= 100

-- 9.
select e.EmployeeID, e.LastName, e.FirstName, e.Title, YEAR(o.OrderDate) as 'year',
	   count(o.EmployeeID) as 'total orders'
from Employees e inner join Orders o
on e.EmployeeID = o.EmployeeID
group by e.EmployeeID, e.LastName, e.FirstName, e.Title, YEAR(o.OrderDate)
having YEAR(o.OrderDate) = 1996

-- 10. 
select e.EmployeeID, e.LastName, e.FirstName, e.City, e.Country ,
	   count(o.EmployeeID) as 'total orders'
from Employees e inner join Orders o
on e.EmployeeID = o.EmployeeID
group by e.EmployeeID, e.LastName, e.FirstName, e.City, YEAR(o.OrderDate), e.Country
having YEAR(o.OrderDate) = 1996

-- 11. 
select e.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone,
	   count(o.EmployeeID) as 'total orders'
from Employees e inner join Orders o on e.EmployeeID = o.EmployeeID
where o.OrderDate between '1998-01-01' AND '1998-07-31'
group by e.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone


-- 12. 
select e.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone, COUNT(o.EmployeeID) as 'total orders'
from Employees e inner join Orders o
on e.EmployeeID = o.EmployeeID
where o.OrderDate between '1997-01-01' and '1997-06-30'
group by e.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone


-- 13.
select OrderID, DAY(OrderDate), MONTH(OrderDate), YEAR(OrderDate), Freight,
	case 
		when Freight >= 100 then '10%'
		else '5%'
	end as Tax,
	case 
		when Freight >= 100 then cast((0.1*Freight + Freight) as float)
		else (0.05*Freight + Freight)
	end as 'Freight with Tax'
from Orders
where OrderDate between '1996-08-01' and '1996-08-05'

-- 14. Write a SELECT query to display the full name, title of courtesy and sex for all employees such that:
--	   If title of courtesy is ‘Mr.’ then sex is set to ‘Male’
--     If title of courtesy is ‘Ms.’ or ‘Mrs.’ then sex is set to ‘Female’

select 'full name'= LastName + ' ' + FirstName, TitleOfCourtesy, 
	case 
	when TitleOfCourtesy = 'Mr.'
	then 'Male'
	when TitleOfCourtesy = 'Mrs.' or TitleOfCourtesy = 'Ms.'
	then 'Female'
	end as Sex
from Employees
where TitleOfCourtesy != 'Dr.'

-- 15. 
select 'full name'= LastName + ' ' + FirstName, TitleOfCourtesy, 
	case 
	when TitleOfCourtesy = 'Dr.' or TitleOfCourtesy = 'Mr.'
	then 'M'
	when TitleOfCourtesy = 'Mrs.' or TitleOfCourtesy = 'Ms.'
	then 'F'
	end as Sex
from Employees
order by Sex desc

-- 16. 
select 'Full name' = LastName + ' ' + FirstName, TitleOfCourtesy,
	case 
		when TitleOfCourtesy = 'Mr.' then 'Male'
		when TitleOfCourtesy = 'Ms.' or  TitleOfCourtesy = 'Mrs' then 'Female'
		else 'Unknow'
	end as Sex
from Employees

-- 17. 
select LastName+' '+FirstName as 'full name', TitleOfCourtesy,
case 
	when TitleOfCourtesy = 'Mr.' then 1
	when TitleOfCourtesy = 'Ms.' or TitleOfCourtesy = 'Mrs.' then 0
	else 2
end as Sex
from Employees

-- 18. 
select LastName+' '+FirstName as 'full name', TitleOfCourtesy,
case 
	when TitleOfCourtesy = 'Mr.' then 'M'
	when TitleOfCourtesy = 'Ms.' or TitleOfCourtesy = 'Mrs.' then 'F'
	else 'N/A'
end as Sex
from Employees

-- 21. 
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName, 
				day(o.OrderDate) day,
				month(o.OrderDate) month,
				year(o.OrderDate) year,
				'Revenue' = od.Quantity * od.UnitPrice
from Categories c inner join Products p on c.CategoryID = p.CategoryID
				inner join [Order Details] od on p.ProductID = od.ProductID
				inner join Orders o on od.OrderID = o.OrderID
where o.OrderDate between '1996-07-01' and '1996-07-05'

-- 22. 
select e.EmployeeID, e.LastName, e.FirstName, o.OrderID, o.OrderDate, o.RequiredDate, o.ShippedDate 
from Employees e inner join Orders o
on e.EmployeeID = o.EmployeeID
where datediff(day,o.RequiredDate,o.ShippedDate) > 7
order by EmployeeID

-- 23. 
select CompanyName, Phone
from Customers
where CompanyName like 'w%'
union all
select LastName+' '+FirstName, HomePhone
from Employees

-- 24.
select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle
from Customers c inner join Orders o on c.CustomerID = o.CustomerID
where o.OrderID = 10643

-- 25.
select p.ProductID, p.ProductName, sum(od.Quantity) as 'Total Ordered'
from Products p inner join [Order Details] od
on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName
having sum(od.Quantity) >= 1200
order by sum(od.Quantity)

-- 26. 
select p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, sum(od.Quantity) as 'Total Ordered'
from Products p inner join [Order Details] od
on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName, p.SupplierID, p.CategoryID
having sum(od.Quantity) >= 1400
order by p.ProductID desc

-- 27. 
select top 1 c.CategoryID, c.CategoryName, count(p.CategoryID) as 'Total products'
from Categories c inner join Products p
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName
order by 'Total products' desc

-- 28. 
select c.CategoryID, c.CategoryName, count(p.CategoryID) as 'Total products'
from Categories c left outer join Products p
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName
having count(p.CategoryID) <= ALL
(
	select count(p.ProductID)
	from Categories c left outer join Products p
	on c.CategoryID = p.CategoryID
	group by p.CategoryID
)

-- 29. 
select sum([Total records]) as [Total records] from
(
	select count(*) as 'Total records' from Customers
	union all
	select count(*) as 'Total records' from Employees
) as a

-- 30. 
select e.LastName, e.FirstName, e.Title, count(o.OrderID) as [total orders] 
from Employees e inner join Orders o
on e.EmployeeID = o.EmployeeID
group by e.LastName, e.FirstName, e.Title
having count(o.OrderID) <= ALL
(
	select count(o.OrderID)
	from Employees e inner join Orders o
	on e.EmployeeID = o.EmployeeID
	group by o.EmployeeID
)


-- 39. Write a query to display product ids and product names of all products 
--     that have total ordered-units in five-highest level (top 5 to top 1)


-- top 5 to top 1
select top 5 p.ProductID 
from Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductID, od.ProductID
order by sum(od.Quantity) desc
-- ans: 
select p.ProductID, p.ProductName, 'Total Ordered' = sum(od.Quantity)
from Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName
having p.ProductID in (
							select top 5 p.ProductID 
							from Products p inner join [Order Details] od on p.ProductID = od.ProductID
							group by p.ProductID, od.ProductID
							order by sum(od.Quantity) desc
)
order by sum(od.Quantity) asc
