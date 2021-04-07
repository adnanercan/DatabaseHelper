CREATE TABLE [dbo].[Order Details] (
    [OrderID]   INT      NOT NULL,
    [ProductID] INT      NOT NULL,
    [UnitPrice] MONEY    CONSTRAINT [DF_Order_Details_UnitPrice] DEFAULT ((0)) NOT NULL,
    [Quantity]  SMALLINT CONSTRAINT [DF_Order_Details_Quantity] DEFAULT ((1)) NOT NULL,
    [Discount]  REAL     CONSTRAINT [DF_Order_Details_Discount] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [CK_Discount] CHECK ([Discount]>=(0) AND [Discount]<=(1)),
    CONSTRAINT [CK_Quantity] CHECK ([Quantity]>(0)),
    CONSTRAINT [CK_UnitPrice] CHECK ([UnitPrice]>=(0)),
    CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID]),
    CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
);


GO
CREATE NONCLUSTERED INDEX [OrderID]
    ON [dbo].[Order Details]([OrderID] ASC);


GO
CREATE NONCLUSTERED INDEX [OrdersOrder_Details]
    ON [dbo].[Order Details]([OrderID] ASC);


GO
CREATE NONCLUSTERED INDEX [ProductID]
    ON [dbo].[Order Details]([ProductID] ASC);


GO
CREATE NONCLUSTERED INDEX [ProductsOrder_Details]
    ON [dbo].[Order Details]([ProductID] ASC);


GO
CREATE TRIGGER  InsertOrders   ON  [Order Details]   
AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	-- 
    -- Sql Server arka planda sanal ik adet tablo tutar .
	-- 1. Tablo inserted tablosudur 
	-- 2. Tablo Deleted tablosudur 
	-- Ornegin update isleminde hem deleted tablosu tetiklenir hemde inserted   tablosu tetiklenir
	-- Insert sirasinda inserted tablodu tetiklenir
	declare @ProductId int 
	declare @Quantity smallint
	
	/*Order Detail tablosuna eklene yeni kayi icerisindeki productId ve Qantity alani secilir*/
	Select	@ProductId =i.ProductID,
			@Quantity=i.Quantity  
	from inserted i 

	Update Products 
	set UnitsInStock=UnitsInStock - @Quantity 
	Where ProductID = @ProductId


END
