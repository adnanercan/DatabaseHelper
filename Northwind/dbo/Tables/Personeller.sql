CREATE TABLE [dbo].[Personeller] (
    [PersonelID]         INT            IDENTITY (1, 1) NOT NULL,
    [SoyAdi]             NVARCHAR (20)  NOT NULL,
    [Adi]                NVARCHAR (10)  NOT NULL,
    [Unvan]              NVARCHAR (30)  NULL,
    [UnvanEki]           NVARCHAR (25)  NULL,
    [DogumTarihi]        DATETIME       NULL,
    [IseBaslamaTarihi]   DATETIME       NULL,
    [Adres]              NVARCHAR (60)  NULL,
    [Sehir]              NVARCHAR (15)  NULL,
    [Bolge]              NVARCHAR (15)  NULL,
    [PostaKodu]          NVARCHAR (10)  NULL,
    [Ulke]               NVARCHAR (15)  NULL,
    [EvTelefonu]         NVARCHAR (24)  NULL,
    [Extension]          NVARCHAR (4)   NULL,
    [Fotograf]           IMAGE          NULL,
    [Notlar]             NTEXT          NULL,
    [BagliCalistigiKisi] INT            NULL,
    [FotografPath]       NVARCHAR (255) NULL,
    CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED ([PersonelID] ASC),
    CONSTRAINT [CK_DogumTarihi] CHECK ([DogumTarihi]<getdate()),
    CONSTRAINT [FK_Personeller_Personeller] FOREIGN KEY ([BagliCalistigiKisi]) REFERENCES [dbo].[Personeller] ([PersonelID])
);


GO
CREATE NONCLUSTERED INDEX [SoyAdi]
    ON [dbo].[Personeller]([SoyAdi] ASC);


GO
CREATE NONCLUSTERED INDEX [PostaKodu]
    ON [dbo].[Personeller]([PostaKodu] ASC);

