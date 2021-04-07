
create view "Biten Urunler Listesi" AS
SELECT Urun_List.UrunID, Urun_List.UrunAdi
FROM Urunler AS Urun_List
WHERE (((Urun_List.Sonlandi)=0))
--ORDER BY Urun_List.UrunAdi
