use pubs
-----Question Set1: 
--1
select au_id from authors
where state != 'CA'
--2
select au_lname from authors
where au_lname like 'D%'
--3
select state from authors
group by state
having count(au_id) = 2

----Question set 4:
--1
select t.pub_id, p.pub_name,'Number of titles: ' = count(title_id) from titles t 
inner join publishers p on t.pub_id = p.pub_id
group by t.pub_id, p.pub_name
having count(title_id) >= all ( select count(title_id) from titles
								group by pub_id )

--2
select 'Algodata Infosystems Titles' = sum(iif(p.pub_name = 'Algodata Infosystems', 1, 0)), 
'Binnet & Hardley' = sum(iif(p.pub_name = 'Binnet & Hardley', 1, 0)), 
'New Moon Books' = sum(iif(p.pub_name = 'New Moon Books', 1, 0))
from publishers p inner join titles t on p.pub_id = t.pub_id

-----Question set 5: 
--1
create VIEW MostReps AS
select p.pub_name
from employee e inner join publishers p on e.pub_id = p.pub_id
group by e.pub_id, p.pub_name
having count(emp_id) >= all (	select count(emp_id) from employee
								group by pub_id)

--2
create VIEW TopEmployees AS
select e.emp_id, e.lname, e.fname, e.job_lvl from jobs j inner join employee e on j.job_id = e.job_id
where max_lvl >= all (select max_lvl from jobs)

--3
select p.pub_name from employee e inner join publishers p on e.pub_id = p.pub_id
where e.pub_id in (select pub_id from employee			--pub_id --> ten = Rita Muller
					where emp_id in (
					select emp_id from employee
					where fname = 'Rita' and lname = 'Muller'))
group by e.pub_id, p.pub_name
having count(e.emp_id) = 1					-- only represented by Rita Muller

--4
select e.emp_id, e.lname, p.pub_name from employee e inner join publishers p on e.pub_id = p.pub_id
order by e.lname

--5
select job_desc from jobs
where min_lvl > 100 and max_lvl < 200

--6
CREATE VIEW TopAdvances as
select a.au_fname, a.au_lname, t.advance from titles t inner join titleauthor ta on t.title_id = ta.title_id
						inner join authors a on ta.au_id = a.au_id
where t.advance > 10000

--7
select t.title from titles t inner join sales s on t.title_id = s.title_id
group by t.title

-- 8
select s.ord_num from sales s inner join titles t on s.title_id = t.title_id
--select ord_num having s.title = all TC3218 and TC4203
where s.ord_num not in (select s.ord_num from sales s inner join titles t on s.title_id = t.title_id
						group by s.ord_num
						having sum(iif(s.title_id = 'TC3218',1, 0)) >= 1 and sum(iif(s.title_id = 'TC4203',1, 0)) >= 1 )
and (s.title_id = 'TC3218' or s.title_id = 'TC4203')

-- 9
select stor_id
from sales
group by stor_id
having count(ord_num) >= 5

-- 10
select t.title, t.ytd_sales, s.ord_date
from sales s inner join titles t on s.title_id = t.title_id
where s.ord_date in(
select min(ord_date) from sales)

---- Question Set 3:
--1: 
select 'Name' = fname + ' ' + lname from employee 
where pub_id = '0877'
--2:
select pi.pr_info, p.pub_name from publishers p inner join pub_info pi on p.pub_id = pi.pub_id
where p.pub_id = '0736'
--3: 
select au_fname, au_lname from authors where state = 'TN' or state = 'UT'
--4:
select au_fname, au_lname from authors 
where address in (
					select address from authors
					group by address
					having count(au_id) > 1)

--5: 
select pub_name, state from publishers
where state != 'DC'
--6:
select t.title from publishers p inner join titles t on p.pub_id = t.pub_id
where p.state != 'CA' 

--7: Which stores have at least 5 orders?
select * from stores where stor_id in (
										select stor_id from sales
										group by stor_id
										having count(ord_num) >= 5)
-- 8. Which Stores have at most 2 orders?
select * from stores where stor_id in (
										select stor_id from sales
										group by stor_id
										having count(ord_num) <= 2)
-- 9. Which Stores have exactly 4 orders?
select * from stores where stor_id in (
										select stor_id from sales
										group by stor_id
										having count(ord_num) = 4)

--10. Which orders are for only books with title=BU1111 and exactly one book?
select * from sales
where title_id = 'BU1111' and qty = 1

--11. Which type of book have a price of either 10.95 or 7.00 but not both?
select type from titles
where type not in (select type from titles
					group by type
					having sum(iif(price = 10.95, 1, 0)) > 0 and sum(iif(price = 7, 1, 0)) > 0)
group by type
having sum(iif(price = 10.95, 1, 0)) > 0 or sum(iif(price = 7, 1, 0)) > 0

--12. Which title_id, and order number have the highest quantity?
select title_id, ord_num from sales 
where title_id in (
					select title_id from sales
					group by title_id
					having sum(qty) >= all (select sum(qty) from sales 
											group by title_id))


--13: Which stores have sold every book?
select * from stores













