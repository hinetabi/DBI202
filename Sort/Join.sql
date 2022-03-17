/*
Join: kết nối các dữ liệu (bản ghi) của các bảng có mối quan hệ thành các bản ghi mới 
bản ghi mới = tổng hợp dữ liệu của các bảng
-  kết nối thông thường dùng giá trị khóa chính và khóa ngoại

*/

/*
Cross join: kết hợp giữa các bảng không có điều kiện kết nối
A CrossJoin B --> mỗi bản ghi bên A sẽ kết hợp với tất cả các bản ghi bên B 
để tạo thành bản ghi mới --> A có N bản ghi, B có M bản ghi --> N * M bản ghi mới.

*/
use Northwind

-- cross join
select * from Products, Customers

/*
Inner join (default join): kết hợp bản ghi chứa khóa chính với các bản ghi chứa khóa ngoại tương ứng
để tạo thành bản ghi mới
- nếu khóa chính không có khóa ngoại tương ứng thì không tạo thành bản ghi mới.
- Trong lệnh join thứ tự các bảng không quan trọng 
--> thông thường nếu mối quan hệ được đảm bảo tính toàn vẹn thì số lượng bản ghi trả về bằng số 
lượng bên nhiều
*/
select *
from Categories inner join Products on Categories.CategoryID = Products.CategoryID
--
select Categories.CategoryID, CategoryName, ProductID, ProductName, UnitPrice, UnitsInStock
from Categories inner join Products on Categories.CategoryID = Products.CategoryID

-- dat categories = A, Products = b
select A.CategoryID, CategoryName, ProductID, ProductName, UnitPrice, UnitsInStock
from Categories as A join Products as B on A.CategoryID = B.CategoryID

select * from Products
select * from Categories

-- multi join
select a.OrderID, a.OrderDate, c.FirstName + ' ' + c.LastName employeeName,
		e.ProductID, e.ProductName, d.Quantity, d.UnitPrice, subtotal = d.Quantity * d.UnitPrice
from Orders as a join Customers as b on a.CustomerID = b.CustomerID
				join Employees as c on a.EmployeeID = c.EmployeeID
				join [Order Details] as d on a.OrderID = d.OrderID
				join Products as e on d.ProductID = e.ProductID

/*
Left outer join = inner Join + nếu giá trị khóa của cửa hàng bên trái không có giá trị khóa tương ứng 
ở bảng bên phải thì kết hợp thành bảng ghi mới, trong đó giá trị của bảng bên phải là null

*/
select * from Categories
select A.CategoryID, CategoryName, ProductID, ProductName, UnitPrice, UnitsInStock
from Categories as A left outer join Products as B on A.CategoryID = B.CategoryID

-- right outer join: nguoc lai cua left outer join -- neu ben phai co ban ghi ma trai khong co ban ghi
---> doi duoc lai thanh null
select A.CategoryID, CategoryName, ProductID, ProductName, UnitPrice, UnitsInStock
from Categories as A right outer join Products as B on A.CategoryID = B.CategoryID
--insert into Categories(CategoryName, Description, Picture) values ('Demo', 'No', 'hello')

-- full outer join = left + right


