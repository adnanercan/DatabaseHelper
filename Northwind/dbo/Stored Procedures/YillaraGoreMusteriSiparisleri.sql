Create procedure YillaraGoreMusteriSiparisleri
(@yil int)
as
Begin
Select top 5  c.CompanyName,count(*) 
from Customers c
inner join Orders o on  c.CustomerID = o.CustomerID
Where year(o.OrderDate) = @yil
Group by c.CompanyName
Order by 2 desc 

End
