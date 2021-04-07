CREATE TABLE [dbo].[Satislar] (
    [SatisID]       INT           IDENTITY (1, 1) NOT NULL,
    [MusteriID]     NCHAR (5)     NULL,
    [PersonelID]    INT           NULL,
    [SatisTarihi]   DATETIME      NULL,
    [OdemeTarihi]   DATETIME      NULL,
    [SevkTarihi]    DATETIME      NULL,
    [ShipVia]       INT           NULL,
    [NakliyeUcreti] MONEY         CONSTRAINT [DF_Satislar_NakliyeUcreti] DEFAULT ((0)) NULL,
    [SevkAdi]       NVARCHAR (40) NULL,
    [SevkAdresi]    NVARCHAR (60) NULL,
    [SevkSehri]     NVARCHAR (15) NULL,
    [SevkBolgesi]   NVARCHAR (15) NULL,
    [SevkPostaKodu] NVARCHAR (10) NULL,
    [SevkUlkesi]    NVARCHAR (15) NULL,
    CONSTRAINT [PK_Satislar] PRIMARY KEY CLUSTERED ([SatisID] ASC),
    CONSTRAINT [FK_Satislar_Musteriler] FOREIGN KEY ([MusteriID]) REFERENCES [dbo].[Musteriler] ([MusteriID]),
    CONSTRAINT [FK_Satislar_Nakliyeciler] FOREIGN KEY ([ShipVia]) REFERENCES [dbo].[Nakliyeciler] ([NakliyeciID]),
    CONSTRAINT [FK_Satislar_Personeller] FOREIGN KEY ([PersonelID]) REFERENCES [dbo].[Personeller] ([PersonelID])
);


GO
CREATE NONCLUSTERED INDEX [MusteriID]
    ON [dbo].[Satislar]([MusteriID] ASC);


GO
CREATE NONCLUSTERED INDEX [MusterilerSatislar]
    ON [dbo].[Satislar]([MusteriID] ASC);


GO
CREATE NONCLUSTERED INDEX [PersonelID]
    ON [dbo].[Satislar]([PersonelID] ASC);


GO
CREATE NONCLUSTERED INDEX [PersonellerSatislar]
    ON [dbo].[Satislar]([PersonelID] ASC);


GO
CREATE NONCLUSTERED INDEX [SatisTarihi]
    ON [dbo].[Satislar]([SatisTarihi] ASC);


GO
CREATE NONCLUSTERED INDEX [SevkTarihi]
    ON [dbo].[Satislar]([SevkTarihi] ASC);


GO
CREATE NONCLUSTERED INDEX [NakliyecilerSatislar]
    ON [dbo].[Satislar]([ShipVia] ASC);


GO
CREATE NONCLUSTERED INDEX [SevkPostaKodu]
    ON [dbo].[Satislar]([SevkPostaKodu] ASC);

