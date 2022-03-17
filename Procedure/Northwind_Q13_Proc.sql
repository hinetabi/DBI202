create proc q13NorthWind
@fromdate datetime, @todate datetime, @Tax varchar(50) output, @FreightTax money output
as
begin
select @Tax = IIF(Freight >= 100, '10%', '5%'), 
@FreightTax = IIF(Freight >= 100, Freight * 1.1, Freight * 1.05)  
from Orders where OrderDate between @fromdate and @todate
end

select *
from Orders