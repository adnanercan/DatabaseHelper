
create view "Satislar Sorgusu" AS
SELECT Satislar.SatisID, Satislar.MusteriID, Satislar.PersonelID, Satislar.SatisTarihi, Satislar.OdemeTarihi, 
	Satislar.SevkTarihi, Satislar.ShipVia, Satislar.NakliyeUcreti, Satislar.SevkAdi, Satislar.SevkAdresi, Satislar.SevkSehri, 
	Satislar.SevkBolgesi, Satislar.SevkPostaKodu, Satislar.SevkUlkesi, 
	Musteriler.SirketAdi, Musteriler.Adres, Musteriler.Sehir, Musteriler.Bolge, Musteriler.PostaKodu, Musteriler.Ulke
FROM Musteriler INNER JOIN Satislar ON Musteriler.MusteriID = Satislar.MusteriID
