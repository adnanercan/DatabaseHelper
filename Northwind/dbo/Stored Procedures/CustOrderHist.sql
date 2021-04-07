CREATE PROCEDURE CustOrderHist @MusteriID nchar(5)
AS
SELECT UrunAdi, Total=SUM(Miktar)
FROM Urunler P, [Satis Detaylari] OD, Satislar O, Musteriler C
WHERE C.MusteriID = @MusteriID
AND C.MusteriID = O.MusteriID AND O.SatisID = OD.SatisID AND OD.UrunID = P.UrunID
GROUP BY UrunAdi
