use Northwind
-- all fields, all record
select * from Products
go
select * from Employees
go
select * from Customers
--some fileds
select *,ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder
from Products
go
-- alias: đặt bí danh cho các trường
-- Nếu có dấu cách -> viết trong dạng chuỗi, còn ko thì thôi
-- có as hay ko đều được
select ProductID as 'Ma san pham', ProductName 'Ten san pham',
		UnitPrice as 'Gia san pham', UnitsInStock SoLuongTonKho, UnitsOnOrder 'Số Lượng bán'
from Products 
-- new fileds: tạo ra các trường mới = cách +,-,*,/, ghép tên...
select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder,
UnitsInStock + UnitsOnOrder as totalUbits
from Products

-- tạo ra 1 trường mới tên là NameCard
select * from Employees
select TitleOfCourtesy + FirstName + ' ' + LastName as NameCard
from Employees

-- top records
select top 13 * from Products
select top 10 percent * from Products -- chọn 10% đầu tiên

--not duplicate
select distinct CategoryID from Products
--
select distinct TitleOfCourtesy from Employees

--note
select 1+1
select GETDATE()
select MONTH(getdate())
select SQRT(89)
select 1 + 'A' -- error
select '1' + 'A'
-----select from where condition
/*
operator: > < >= <= <> = NOT AND OR
toán tử 'like': String
*/
-- %: thay thế cho 0 hoặc chuỗi ký tự bất kỳ
select * from Products where  ProductName = 'Chai' -- so sanh tuyet doi
-- 
select * from Products where  ProductName = 'Cha' -- so sanh tuyet doi
------- like %
select * from Products where ProductName like 'Cha%' -- bắt đầu bằng Cha
select * from Products where ProductName like '%a%' -- tồn tại a
select * from Products where ProductName like '%%%' -- tồn tại dãy có dấu %
select * from Products where ProductName like '%Cha' -- kết thúc là Cha
-------- like _: thay thế cho 1 và chỉ 1 ký tự

-- bắt đầu bằng Cha và sau đó chỉ có 1 ký tự
select * from Products where ProductName like 'cha_'
-- bắt đầu bằng Cha và sau đó chỉ có 2 ký tự
select * from Products where ProductName like 'cha__'

-------- special: đặc tả
-- bắt đầu bằng A hoặc C hoặc G
select * from Products where ProductName like '[ACG]%'
-- bắt đầu bằng A đến G
select * from Products where ProductName like '[A-G]%'
-- bắt đầu bằng A đến G hoặc T hoặc X
select * from Products where ProductName like '[A-GTX]%'
order by ProductID