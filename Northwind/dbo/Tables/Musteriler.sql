CREATE TABLE [dbo].[Musteriler] (
    [MusteriID]     NCHAR (5)     NOT NULL,
    [SirketAdi]     NVARCHAR (40) NOT NULL,
    [MusteriAdi]    NVARCHAR (30) NULL,
    [MusteriUnvani] NVARCHAR (30) NULL,
    [Adres]         NVARCHAR (60) NULL,
    [Sehir]         NVARCHAR (15) NULL,
    [Bolge]         NVARCHAR (15) NULL,
    [PostaKodu]     NVARCHAR (10) NULL,
    [Ulke]          NVARCHAR (15) NULL,
    [Telefon]       NVARCHAR (24) NULL,
    [Faks]          NVARCHAR (24) NULL,
    CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED ([MusteriID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [Sehir]
    ON [dbo].[Musteriler]([Sehir] ASC);


GO
CREATE NONCLUSTERED INDEX [SirketAdi]
    ON [dbo].[Musteriler]([SirketAdi] ASC);


GO
CREATE NONCLUSTERED INDEX [PostaKodu]
    ON [dbo].[Musteriler]([PostaKodu] ASC);


GO
CREATE NONCLUSTERED INDEX [Bolge]
    ON [dbo].[Musteriler]([Bolge] ASC);

