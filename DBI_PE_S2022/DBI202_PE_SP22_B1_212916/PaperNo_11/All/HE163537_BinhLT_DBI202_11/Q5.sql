select s.SupplierID, s.SupplierName, t.NumberOfPurchaseOrders, t.TotalOrderedQuantity
from Suppliers s inner join 
(select s.SupplierID, 'NumberOfPurchaseOrders' = count(distinct po.PurchaseOrderID), 
'TotalOrderedQuantity' = SUM(pol.OrderedQuantity) from Suppliers s left outer join PurchaseOrders po on s.SupplierID = po.SupplierID
						left outer join PurchaseOrderLines pol on po.PurchaseOrderID = pol.PurchaseOrderID
group by s.SupplierID) as t on s.SupplierID = t.SupplierID
order by t.NumberOfPurchaseOrders desc, s.SupplierName asc