

-- 2
select *
from Student
where Email like '%fpt.vn%' or Email like '%fpt.com.vn%'

-- 3
use QLDIEM
select *
from Class
where CloseDate = '08-15-2008' and ClassCode not in (select ClassCode from Student)

-- 4
select * 
from Class 
where CloseDate < '10-20-2008'

-- 5
select ClassCode, 'Number of students' = COUNT(RollNo)
from Student
group by ClassCode

-- 6
select *
from Student
where ClassCode in (
						select ClassCode
						from Student
						group by ClassCode
						having COUNT(RollNo) >= 7
)
-- 7 Hiển thị  SubjectCode (mã môn học) , SubjectName 
-- (tên môn học) và số sinh viên đã thi môn đó với số sinh viên tham gia đông nhất.

-- mon hoc nhieu ng thi nhat
select count(RollNo)
from Mark
group by SubjectCode

--> ten mon hoc: 
select a.SubjectCode, a.SubjectName, 'Number of students'= count(b.RollNo)
from Subject a inner join Mark b on  a.SubjectCode = b.SubjectCode
group by a.SubjectCode, a.SubjectName
having count(b.RollNo) >= all (select count(RollNo)
								from Mark
								group by SubjectCode)



use QLDIEM
select * from Class
select * from Mark
select * from Student
select * from Subject

-- 