CREATE TABLE [dbo].[Nakliyeciler] (
    [NakliyeciID] INT           IDENTITY (1, 1) NOT NULL,
    [SirketAdi]   NVARCHAR (40) NOT NULL,
    [Telefon]     NVARCHAR (24) NULL,
    CONSTRAINT [PK_Nakliyeciler] PRIMARY KEY CLUSTERED ([NakliyeciID] ASC)
);

