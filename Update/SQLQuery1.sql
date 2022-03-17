use Demo1605
select * from Class
select * from Student
/*
condition express: fileName operator value
operator: > < >= <= <> = 
logic: NOT AND OR (! && ||) - khong su dung cai nay
*/

/*
update tableName set fieldName1 = express1, field2 = express2 
[where conditionExpress] 
-- nếu không có condition --> update toàn bộ các bản ghi
- có condition: chỉ update các bản ghi thỏa mãn điều kiện

*/
-- không có condition
-- đặt maxAccount của tất cả các lớp là 30

update Class set maxAmount = 30

--có điều kiện
-- đặt maxAmount của bản ghi có status = 0 về 0
update Class set maxAmount = 0 where status = 0

-- đổi tên lớp
update Class set className = 'PRO192' where classID = 'class02'
-- giảm số lượng sinh viên lớp HTML 10% và đổi tên lớp thành WED201c
update Class set className = 'WED201C',maxAmount = maxAmount * 0.9 where className = 'HTML'
select * from Class

-- đổi trạng thái của lớp web về 1 nếu status = 0
update Class set status = 1 where className = 'C' and status = 0

/*
Toàn vẹn khóa ngoại (foreign key constraint): 
- Nếu cái giá trị khóa chính đã tồn tại trên khóa ngoại thì không được sửa giá trị khóa chính
- Nếu update giá trị khóa ngoại --> giá trị sau khi update cũng phải tồn tại trên khóa chính
*/

update Class set classID='class001' where classID='class01'

/*
delete TableName [where condition]
- khong co condition
- co condition: xoa cac ban ghi thoa man
- ko xóa được các bản ghi khóa chính mà bị references ở khóa ngoại
*/
select * from Class 
select * from Student

delete from Class where classID = 'class001'
delete from Class where classID = 'class06'

/*
-- xóa toàn bộ bảng
truncate table tableName
*/
truncate table Student