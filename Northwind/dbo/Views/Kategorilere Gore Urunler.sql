
create view "Kategorilere Gore Urunler" AS
SELECT Kategoriler.KategoriAdi, Urunler.UrunAdi, Urunler.BirimdekiMiktar, Urunler.HedefStokDuzeyi, Urunler.Sonlandi
FROM Kategoriler INNER JOIN Urunler ON Kategoriler.KategoriID = Urunler.KategoriID
WHERE Urunler.Sonlandi <> 1
--ORDER BY Kategoriler.KategoriAdi, Urunler.UrunAdi
