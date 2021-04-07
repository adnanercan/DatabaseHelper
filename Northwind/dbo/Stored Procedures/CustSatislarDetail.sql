
CREATE PROCEDURE CustSatislarDetail @SatisID int
AS
SELECT UrunAdi,
    BirimFiyati=ROUND(Od.BirimFiyati, 2),
    Miktar,
    İndirim=CONVERT(int, İndirim * 100), 
    ExtendedPrice=ROUND(CONVERT(money, Miktar * (1 - İndirim) * Od.BirimFiyati), 2)
FROM Urunler P, [Satis Detaylari] Od
WHERE Od.UrunID = P.UrunID and Od.SatisID = @SatisID
