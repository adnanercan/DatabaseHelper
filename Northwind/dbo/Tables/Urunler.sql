CREATE TABLE [dbo].[Urunler] (
    [UrunID]                   INT           IDENTITY (1, 1) NOT NULL,
    [UrunAdi]                  NVARCHAR (40) NOT NULL,
    [TedarikciID]              INT           NULL,
    [KategoriID]               INT           NULL,
    [BirimdekiMiktar]          NVARCHAR (20) NULL,
    [BirimFiyati]              MONEY         CONSTRAINT [DF_Urunler_BirimFiyati] DEFAULT ((0)) NULL,
    [HedefStokDuzeyi]          SMALLINT      CONSTRAINT [DF_Urunler_HedefStokDuzeyi] DEFAULT ((0)) NULL,
    [YeniSatis]                SMALLINT      CONSTRAINT [DF_Urunler_YeniSatis] DEFAULT ((0)) NULL,
    [EnAzYenidenSatisMikatari] SMALLINT      CONSTRAINT [DF_Urunler_EnAzYenidenSatisMikatari] DEFAULT ((0)) NULL,
    [Sonlandi]                 BIT           CONSTRAINT [DF_Urunler_Sonlandi] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED ([UrunID] ASC),
    CONSTRAINT [CK_EnAzYenidenSatisMikatari] CHECK ([EnAzYenidenSatisMikatari]>=(0)),
    CONSTRAINT [CK_HedefStokDuzeyi] CHECK ([HedefStokDuzeyi]>=(0)),
    CONSTRAINT [CK_Urunler_BirimFiyati] CHECK ([BirimFiyati]>=(0)),
    CONSTRAINT [CK_YeniSatis] CHECK ([YeniSatis]>=(0)),
    CONSTRAINT [FK_Urunler_Kategoriler] FOREIGN KEY ([KategoriID]) REFERENCES [dbo].[Kategoriler] ([KategoriID]),
    CONSTRAINT [FK_Urunler_Tedarikciler] FOREIGN KEY ([TedarikciID]) REFERENCES [dbo].[Tedarikciler] ([TedarikciID])
);


GO
CREATE NONCLUSTERED INDEX [KategorilerUrunler]
    ON [dbo].[Urunler]([KategoriID] ASC);


GO
CREATE NONCLUSTERED INDEX [KategoriID]
    ON [dbo].[Urunler]([KategoriID] ASC);


GO
CREATE NONCLUSTERED INDEX [UrunAdi]
    ON [dbo].[Urunler]([UrunAdi] ASC);


GO
CREATE NONCLUSTERED INDEX [TedarikciID]
    ON [dbo].[Urunler]([TedarikciID] ASC);


GO
CREATE NONCLUSTERED INDEX [TedarikcilerUrunler]
    ON [dbo].[Urunler]([TedarikciID] ASC);

