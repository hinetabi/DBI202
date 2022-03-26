use PE_DBI202_F2019

-- Q6: 
select * from Departments
select * from Countries
select * from Locations

select * from Countries 
where CountryID not in (
select c.CountryID from Countries c
		inner join Locations l on l.CountryID = c.CountryID
		inner join Departments d on l.LocationID = d.LocationID)


--- Q7:
select e.EmployeeID, e.FirstName, e.LastName, e.LastName, e.DepartmentID, d.DepartmentName, t.NumberOdSubordinates 
from Employees e inner join (select e1.EmployeeID, 'NumberOdSubordinates' = count(e2.EmployeeID) 
								from Employees e1 
								left outer join Employees e2 on e1.EmployeeID = e2.ManagerID
								group by e1.EmployeeID) as t on e.EmployeeID = t.EmployeeID
					inner join Departments d on e.DepartmentID = d.DepartmentID
where t.NumberOdSubordinates > 0 or d.DepartmentName = 'IT'
order by t.NumberOdSubordinates desc









