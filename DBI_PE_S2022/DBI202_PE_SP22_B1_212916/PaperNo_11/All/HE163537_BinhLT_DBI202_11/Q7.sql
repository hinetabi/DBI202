
select p.ProductID,p.ProductName, p.UnitPrice, p.Color,t.TotalOrderedQuantity, t.NumberOfPurchaseOrders 
from Products p left outer join 
(select p.ProductID,  
'TotalOrderedQuantity' = sum(pol.OrderedQuantity), 'NumberOfPurchaseOrders' = count(po.PurchaseOrderID)
from Products p inner join PurchaseOrderLines pol on p.ProductID = pol.ProductID								
				inner join PurchaseOrders po on pol.PurchaseOrderID = po.PurchaseOrderID
where month(po.OrderDate) = 5 and year(po.OrderDate) = 2013  
group by p.ProductID) as t on p.ProductID = t.ProductID
where (p.Color = 'black' or p.Color = 'white')
order by t.TotalOrderedQuantity desc, p.ProductName

