CREATE TABLE [dbo].[Tedarikciler] (
    [TedarikciID]   INT           IDENTITY (1, 1) NOT NULL,
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
    [WebSayfasi]    NTEXT         NULL,
    CONSTRAINT [PK_Tedarikciler] PRIMARY KEY CLUSTERED ([TedarikciID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [SirketAdi]
    ON [dbo].[Tedarikciler]([SirketAdi] ASC);


GO
CREATE NONCLUSTERED INDEX [PostaKodu]
    ON [dbo].[Tedarikciler]([PostaKodu] ASC);

