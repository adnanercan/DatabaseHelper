CREATE TABLE [dbo].[ProductImages]
(
	[Id] INT NOT NULL PRIMARY KEY Identity(1,1), 
    [ProductId] INT NOT NULL, 
    [ImagePath] VARCHAR(250) NULL, 
    [Description] VARCHAR(500) NULL, 
    CONSTRAINT [FK_Batuhan] FOREIGN KEY (ProductId) REFERENCES [Products](ProductID)
)
