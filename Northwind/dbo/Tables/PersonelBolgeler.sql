CREATE TABLE [dbo].[PersonelBolgeler] (
    [PersonelID]  INT           NOT NULL,
    [TerritoryID] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_PersonelBolgeler] PRIMARY KEY NONCLUSTERED ([PersonelID] ASC, [TerritoryID] ASC),
    CONSTRAINT [FK_PersonelBolgeler_Bolgeler] FOREIGN KEY ([TerritoryID]) REFERENCES [dbo].[Bolgeler] ([TerritoryID]),
    CONSTRAINT [FK_PersonelBolgeler_Personeller] FOREIGN KEY ([PersonelID]) REFERENCES [dbo].[Personeller] ([PersonelID])
);

