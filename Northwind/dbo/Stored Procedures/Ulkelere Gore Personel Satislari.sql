
create procedure "Ulkelere Gore Personel Satislari" 
@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Personeller.Ulke, Personeller.SoyAdi, Personeller.Adi, Satislar.SevkTarihi, Satislar.SatisID, "Satis Alt Toplamlari".Subtotal AS SaleAmount
FROM Personeller INNER JOIN 
	(Satislar INNER JOIN "Satis Alt Toplamlari" ON Satislar.SatisID = "Satis Alt Toplamlari".SatisID) 
	ON Personeller.PersonelID = Satislar.PersonelID
WHERE Satislar.SevkTarihi Between @Beginning_Date And @Ending_Date
