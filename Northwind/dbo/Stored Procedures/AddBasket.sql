CREATE PROCEDURE [dbo].[AddBasket]
	@ProductId int,
	@CustomerId varchar(5),
	@Quantity int,
	@Price money

AS
Insert into Basket Values (@ProductId,@CustomerId,@Quantity,@Price)


