CREATE TABLE [dbo].[Basket]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [ProductId] INT NULL, 
    [CustomerId] NCHAR(5) NULL, 
    [Quantity] INT NULL, 
    [Price] MONEY NULL, 
    [CreateDate] DATETIME NULL Default Getdate()
)
