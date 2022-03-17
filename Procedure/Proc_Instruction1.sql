/* 
create procedure | Proc ProcName
[List of parameters]
as 
statements
Lưu ý: 1 Procedure là 1 file -> Procedure ở đầu file	
Tham số thêm @ ở đằng trước (2 tham số cách nhau bởi dấu ,)
*/
create proc listAllProcQuantity1
@quantityFrom smallint, @quantityTo smallint
as
select * from Products where UnitsInStock between @quantityFrom and @quantityTo

exec listAllProcQuantity1 10, 20












