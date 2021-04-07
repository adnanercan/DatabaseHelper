CREATE PROCEDURE SalesByKategori
    @KategoriAdi nvarchar(15), @OrdYear nvarchar(4) = '1998'
AS
IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998' 
BEGIN
	SELECT @OrdYear = '1998'
END

SELECT UrunAdi,
	TotalPurchase=ROUND(SUM(CONVERT(decimal(14,2), OD.Miktar * (1-OD.İndirim) * OD.BirimFiyati)), 0)
FROM [Satis Detaylari] OD, Satislar O, Urunler P, Kategoriler C
WHERE OD.SatisID = O.SatisID 
	AND OD.UrunID = P.UrunID 
	AND P.KategoriID = C.KategoriID
	AND C.KategoriAdi = @KategoriAdi
	AND SUBSTRING(CONVERT(nvarchar(22), O.SatisTarihi, 111), 1, 4) = @OrdYear
GROUP BY UrunAdi
ORDER BY UrunAdi
