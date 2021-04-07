
create view "Her Uc Aylik Satislar" AS
SELECT DISTINCT Musteriler.MusteriID, Musteriler.SirketAdi, Musteriler.Sehir, Musteriler.Ulke
FROM Musteriler RIGHT JOIN Satislar ON Musteriler.MusteriID = Satislar.MusteriID
WHERE Satislar.SatisTarihi BETWEEN '19970101' And '19971231'
