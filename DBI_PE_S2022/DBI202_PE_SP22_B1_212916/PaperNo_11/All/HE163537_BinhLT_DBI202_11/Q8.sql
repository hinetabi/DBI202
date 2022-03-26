create proc Proc1
@productId int, @fromDate date, @toDate date, @totalOrderedQuantity int output
as
begin
select @totalOrderedQuantity = sum(pol.OrderedQuantity) 
from Products p inner join PurchaseOrderLines pol 
on p.ProductID = pol.ProductID
				inner join PurchaseOrders po on pol.PurchaseOrderID = po.PurchaseOrderID
where p.ProductID = @productId and po.OrderDate between @fromDate and @toDate
group by p.ProductID
end

