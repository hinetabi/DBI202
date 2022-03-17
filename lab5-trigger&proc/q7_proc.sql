create proc q7
as
begin
select * from NHANVIEN n
inner join (select n.PHG, 'trung binh luong' =  avg(n.LUONG) 
from NHANVIEN n group by n.PHG) as t on n.PHG = t.PHG
where n.LUONG > t.[trung binh luong]
end

