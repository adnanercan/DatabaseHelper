CREATE TABLE [dbo].[ProductCategory] (
    [ProductId]  INT NOT NULL,
    [CategoryID] INT NOT NULL,
    CONSTRAINT [PK_ProductCategory_1] PRIMARY KEY CLUSTERED ([ProductId] ASC, [CategoryID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProductCategory]
    ON [dbo].[ProductCategory]([CategoryID] ASC, [ProductId] ASC);

