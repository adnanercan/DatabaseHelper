CREATE TABLE [dbo].[MusteriDemographics] (
    [MusteriTypeID] NCHAR (10) NOT NULL,
    [MusteriDesc]   NTEXT      NULL,
    CONSTRAINT [PK_MusteriDemographics] PRIMARY KEY NONCLUSTERED ([MusteriTypeID] ASC)
);

