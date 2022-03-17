use Northwind
/*
subquery: trong sql cho phép viết các câu lệnh select bên trong các câu lệnh khác
(inser, update, delete, select)
subquery: select --> table result, values --> đầu vào cho câu lệnh khác
subquery chạy trước --> lệnh bên ngoài
*/
--
select * from Products

-- products unitprice is max
-- 1. maxprice = ?
-- 2. product : price = maxprice
--1
select max(UnitPrice) from Products
--
select * from Products
where UnitPrice = (select max(UnitPrice) from Products)
--
-- fix code (lay 2 san pham)
select top 2 * from Products order by UnitPrice desc

-- danh sach cac mat hang da ban ?
-- mat hang ban duoc --> productid có mặt trên order_detail
--1. danh sách product id đã có trên order_detail
-- 2. cac product nào có pid trong 1 ---> bán
--1
select distinct ProductID from [Order Details]
--2
select * from Products
where ProductID in (select distinct ProductID from [Order Details])
-- chua ban bao gio (not in)
select * from Products
where ProductID not in (select distinct ProductID from [Order Details])
--
select * from Employees

select EmployeeID, FirstName, LastName, ReportsTo from Employees
-- danh sach cac quản lý: quản lý --> ID có trong report to
-- 1. ID có trong reportTo
-- 2: employee có id trong 1
select distinct ReportsTo from Employees

select EmployeeID, FirstName, LastName, ReportsTo from Employees
where EmployeeID in (select distinct ReportsTo from Employees)
-- dem so luong san pham theo category
select a.CategoryID, a.CategoryName, count(b.CategoryID)
from Categories as a join Products as b on a.CategoryID = b.CategoryID
group by a.CategoryID, a.CategoryName
order by count(b.CategoryID) desc
-- chon ra category co so luong max 
-- nếu làm như này thì sẽ không chạy được
select max(count(b.CategoryID))
from Categories as a inner join Products as b on a.CategoryID = b.CategoryID
group by b.CategoryID

-- thay vì dùng max, mình sẽ dùng >= all
select a.CategoryID, a.CategoryName, count(b.CategoryID)
from Categories as a join Products as b on a.CategoryID = b.CategoryID
group by a.CategoryID, a.CategoryName
having count(b.CategoryID)>= all( select count(b.CategoryID)
from Categories as a join Products as b on a.CategoryID = b.CategoryID
group by a.CategoryID)

-- min (<all)
select a.CategoryID, a.CategoryName, count(b.CategoryID)
from Categories as a join Products as b on a.CategoryID = b.CategoryID
group by a.CategoryID, a.CategoryName
having count(b.CategoryID)<= all( select count(b.CategoryID)
from Categories as a join Products as b on a.CategoryID = b.CategoryID
group by a.CategoryID)

-- < max = (< any)
select a.CategoryID, a.CategoryName, count(b.CategoryID)
from Categories as a join Products as b on a.CategoryID = b.CategoryID
group by a.CategoryID, a.CategoryName
having count(b.CategoryID)< any( select count(b.CategoryID)
from Categories as a join Products as b on a.CategoryID = b.CategoryID
group by a.CategoryID)