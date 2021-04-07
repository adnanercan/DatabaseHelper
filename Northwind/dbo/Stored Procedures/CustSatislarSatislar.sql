
CREATE PROCEDURE CustSatislarSatislar @MusteriID nchar(5)
AS
SELECT SatisID, 
	SatisTarihi,
	OdemeTarihi,
	SevkTarihi
FROM Satislar
WHERE MusteriID = @MusteriID
ORDER BY SatisID
