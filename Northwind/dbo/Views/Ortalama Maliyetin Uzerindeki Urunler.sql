
create view "Ortalama Maliyetin Uzerindeki Urunler" AS
SELECT Urunler.UrunAdi, Urunler.BirimFiyati
FROM Urunler
WHERE Urunler.BirimFiyati>(SELECT AVG(BirimFiyati) From Urunler)
--ORDER BY Urunler.BirimFiyati DESC
