use Northwind

select * from Products
-- sum: unit in stock
select sum(UnitsInStock) from Products
-- count: number of unit: đếm số bản ghi
select count(UnitsInStock) as numberOfUnit from Products

-- max (int) không áp dụng cho chuỗi
select max(UnitsInStock) as MaxValueOfUnit from Products
select min(UnitsInStock) as MinValueOfUnit from Products
select avg(UnitsInStock) as AverageValueOfUnit from Products

---
select ProductName, max(UnitsInStock) as MaxValueOfUnit from Products

-- group by: cho phép các hàm theo nhóm các bản ghi cùng giá trị 
-- (gom nhóm các cái cùng giá trị về 1 nhóm)
-- foreign key, multi value
select * from Products

--total unit by category
select sum(UnitsInStock) as TotalValueoUnitByCategory from Products
group by CategoryID

-- các trường có mặt trong group by --> có mặt trong select (vì nó gom lại)
-- total unit by supplier
select SupplierID, sum(UnitsInStock) as TotalValueoUnitBySupplierID from Products
group by SupplierID

-- order by SupplierID and group by Category ID
select SupplierID, CategoryID, sum(UnitsInStock) as TotalValueoUnitBySupplierID from Products
group by CategoryID, SupplierID

-- order by SupplierID and group by Category ID
select SupplierID, CategoryID, sum(UnitsInStock) as TotalValueoUnitBySupplierID from Products
group by CategoryID, SupplierID
order by SupplierID

select TitleOfCourtesy, COUNT(TitleOfCourtesy) from Employees
group by TitleOfCourtesy

-- group by theo khoa chinh la vo nghia

--
select MONTH(BirthDate), COUNT(BirthDate) from Employees
group by MONTH(BirthDate)

use Northwind
select SupplierID, a.CategoryID, sum(UnitsInStock) as TotalValueoUnitBySupplierID 
from Products as A join Categories as B on A.CategoryID = b.CategoryID
group by a.CategoryID, b.CategoryName
order by SupplierID

