CREATE TABLE [dbo].[Kategoriler] (
    [KategoriID]  INT           IDENTITY (1, 1) NOT NULL,
    [KategoriAdi] NVARCHAR (15) NOT NULL,
    [Tanimi]      NTEXT         NULL,
    [Resim]       IMAGE         NULL,
    CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED ([KategoriID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [KategoriAdi]
    ON [dbo].[Kategoriler]([KategoriAdi] ASC);

