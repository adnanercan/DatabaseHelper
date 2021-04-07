
create view "Alfabetik Sirali Urunler Listesi" AS
SELECT Urunler.*, Kategoriler.KategoriAdi
FROM Kategoriler INNER JOIN Urunler ON Kategoriler.KategoriID = Urunler.KategoriID
WHERE (((Urunler.Sonlandi)=0))
