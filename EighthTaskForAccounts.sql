CREATE TRIGGER [dbo].[CHECK_ACCOUNT_BALANCE] 
ON [dbo].[Accounts]
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @AccountBalance MONEY
	DECLARE @CardsBalance MONEY
	DECLARE @AccountId INT

	SELECT @AccountId = (SELECT AccountId FROM DELETED)

	SELECT @AccountBalance = (SELECT Balance FROM INSERTED WHERE AccountId = @AccountId)

	SELECT @CardsBalance = (SELECT SUM(Cards.Balance) FROM Cards WHERE AccountId = @AccountId)


	IF @AccountBalance < @CardsBalance
		BEGIN
			PRINT 'something went wrong'
			ROLLBACK TRANSACTION 
		END
	ELSE
		PRINT 'chandged completelly'
END
