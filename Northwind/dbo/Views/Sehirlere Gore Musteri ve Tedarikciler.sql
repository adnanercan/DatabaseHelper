
create view "Sehirlere Gore Musteri ve Tedarikciler" AS
SELECT Sehir, SirketAdi, MusteriAdi, 'Musteriler' AS Relationship 
FROM Musteriler
UNION SELECT Sehir, SirketAdi, MusteriAdi, 'Tedarikciler'
FROM Tedarikciler
--ORDER BY Sehir, SirketAdi
