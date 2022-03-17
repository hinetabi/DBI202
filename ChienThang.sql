use DBI_EXAM_SPRING_2017
-- ===================
-- Q1> 
select SSN, FName, LName, Address, Salary, Sex 
from Employee
where Sex = 0

-- ===================
-- Q2> 
--select project chưa được hoàn thiên -> join 3 bảng dept, pro, và employee với nhau.
select b.SSN, c.FName + ' ' + c.LName as 'Full Name',  
b.Position, b.ProNo, a.Name, a.StartDate
-- inner join 3 bảng lại
from Project as a inner join Emp_WorkOn_Pro as b on a.ProNo = b.ProNo
				inner join Employee as c on b.SSN = c.SSN
-- ở vị trí endDate Null -> project chưa hoàn thiện -> chọn ra
where a.EndDate IS NULL
-- ===================

-- Q3> Sử dụng left join để join 2 bảng Employee lại
-- chọn ra các fields mà đề bài yêu cầu cần phải chọn
select 'Staff SSN' = a.SSN, a.FName + ' ' + a.LName as 'Staff Full Name', 
'Supervisor SSN' = b.SSN, b.FName + ' ' + b.LName as 'Supervisor Full Name'
-- left join 2 bảng ở vị trí cái a.SSNSupervisor = b.SSN là được
from Employee a left join Employee b on a.SSNSupervisor = b.SSN

-- ===================
-- Q4> chọn ra các người ko có người thân trong bảng
-- select not in
select SSN, FName + ' ' + LName as 'Full Name'
from Employee
-- chọn ra người not in bảng (mà người có người thân)
where SSN not in (select SSN		-- chọn ra các người có người thân
					from Dependence )

-- ===================
-- Q5> 
-- select ssn who have dependence
select a.SSN, a.FName + ' ' + a.LName as 'Full Name', count(b.Name) as 'Number of Members'
from Employee a inner join Dependence b on a.SSN = b.SSN
group by b.SSN, a.SSN, a.LName, a.FName
having count(b.Name) >= 2

-- ===================
-- Q6> 
-- chọn ra các người mà làm cả 4 project -> count project = 4 là được
select SSN, FName, LName
from Employee
where SSN in (
				select SSN
				from Emp_WorkOn_Pro
				group by SSN
				having COUNT(ProNo) = 4)