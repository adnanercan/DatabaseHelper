
create procedure "Yillik Satislar" 
	@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Satislar.SevkTarihi, Satislar.SatisID, "Satis Alt Toplamlari".Subtotal, DATENAME(yy,SevkTarihi) AS Year
FROM Satislar INNER JOIN "Satis Alt Toplamlari" ON Satislar.SatisID = "Satis Alt Toplamlari".SatisID
WHERE Satislar.SevkTarihi Between @Beginning_Date And @Ending_Date
