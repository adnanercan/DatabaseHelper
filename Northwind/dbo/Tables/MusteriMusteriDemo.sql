CREATE TABLE [dbo].[MusteriMusteriDemo] (
    [MusteriID]     NCHAR (5)  NOT NULL,
    [MusteriTypeID] NCHAR (10) NOT NULL,
    CONSTRAINT [PK_MusteriMusteriDemo] PRIMARY KEY NONCLUSTERED ([MusteriID] ASC, [MusteriTypeID] ASC),
    CONSTRAINT [FK_MusteriMusteriDemo] FOREIGN KEY ([MusteriTypeID]) REFERENCES [dbo].[MusteriDemographics] ([MusteriTypeID]),
    CONSTRAINT [FK_MusteriMusteriDemo_Musteriler] FOREIGN KEY ([MusteriID]) REFERENCES [dbo].[Musteriler] ([MusteriID])
);

