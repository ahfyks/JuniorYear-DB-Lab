-- EXERCISE

CREATE PROCEDURE proc_UPDATECustomer
	@cusNum int,
	@CusName nvarchar(255),
	@street nvarchar(255),
    @city nvarchar(100),
    @state nvarchar(30),
    @zip nvarchar(30),
    @balance money,
    @creditLine money,
    @repNum int
	
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
	 BEGIN TRANSACTION

	 UPDATE Customer
            SET CustomerName = @CusName,
                Street = @street,
                City = @city,
                State = @state,
                Zip = @zip,
                Balance = @balance,
                CreditLine = @creditLine,
                RepNum = @repNum
            WHERE CustomerNum = @cusNum
		COMMIT TRANSACTION;
	END TRY
BEGIN CATCH
        PRINT 'EROR'
        ROLLBACK TRANSACTION;
    END CATCH
END

GO;

EXEC proc_UPDATECustomer 998, 'ICT', 'Rama 6', 'Phayathai', 'BK', '10400', 5000, 7000, 20



BEGIN TRANSACTION TB
SELECT * FROM Customer

