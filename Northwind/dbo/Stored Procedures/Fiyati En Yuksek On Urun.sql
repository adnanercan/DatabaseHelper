
create procedure "Fiyati En Yuksek On Urun" AS
SET ROWCOUNT 10
SELECT Urunler.UrunAdi AS TenMostExpensiveUrunler, Urunler.BirimFiyati
FROM Urunler
ORDER BY Urunler.BirimFiyati DESC
