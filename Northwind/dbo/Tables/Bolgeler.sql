CREATE TABLE [dbo].[Bolgeler] (
    [TerritoryID]     NVARCHAR (20) NOT NULL,
    [TerritoryTanimi] NCHAR (50)    NOT NULL,
    [BolgeID]         INT           NOT NULL,
    CONSTRAINT [PK_Bolgeler] PRIMARY KEY NONCLUSTERED ([TerritoryID] ASC),
    CONSTRAINT [FK_Bolgeler_Bolge] FOREIGN KEY ([BolgeID]) REFERENCES [dbo].[Bolge] ([BolgeID])
);

