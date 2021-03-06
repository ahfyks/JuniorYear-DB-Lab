USE [PremierProduct11]
GO
/****** Object:  StoredProcedure [dbo].[proc_InsertOrder]    Script Date: 4/8/2020 10:43:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Declare var

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_InsertOrder] 
	-- Add the parameters for the stored procedure here
	@amount int,
	@partNum nvarchar(10),
	@customerNum int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Declare var
	DECLARE @newOrderNum int; 
	SELECT @newOrderNum = (MAX(OrderNum)+1) FROM  Orders;
	DECLARE @total money; 
	SELECT @total = (@amount*Price) FROM Part WHERE PartNum = @partNum;
    -- Insert statements for procedure here
	INSERT INTO Orders
	VALUES (@newOrderNum, GETDATE(), @customerNum);
	INSERT INTO OrderLine
	VALUES (@newOrderNum, @partNum, @amount,@total )
	

END

DECLARE	@return_value int

EXEC	@return_value = [dbo].[proc_InsertOrder]
		@amount = 2,
		@partNum = N'DR93',
		@customerNum = 608

SELECT	'Return Value' = @return_value

GO
	-- USE THIS IF YA NEED IT THO
DELETE FROM Orders 
WHERE OrderNum = 21624
DELETE FROM OrderLine
WHERE OrderNum = 21624

SELECT * FROM Orders
SELECT * FROM OrderLine
