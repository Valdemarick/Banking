DROP PROCEDURE TransferMoneyFromAccountToCard
GO
CREATE PROCEDURE TransferMoneyFromAccountToCard
(@AccountId INT, @CardId INT, @Sum MONEY)
AS
BEGIN
	DECLARE @AccountSum MONEY
	
	--IF NOT EXISTS (SELECT Cards.CardId FROM Cards WHERE Cards.CardId = @CardId AND Cards.AccountId = @AccountId)
	--	BEGIN
	--		PRINT 'There is not a account with card id' + CAST(@CardId AS nvarchar)
	--		RETURN;
	--	END;

	SET @AccountSum = (SELECT Accounts.Balance FROM Accounts WHERE Accounts.AccountId = @AccountId)

	IF @Sum > @AccountSum
		BEGIN
			PRINT 'It is impossible to transfer the amount of money that are more than the account balance'
			RETURN;
		END;

	BEGIN TRANSACTION

	UPDATE Accounts 
	SET Balance = Balance - @Sum
	WHERE Accounts.AccountId = @AccountId

	UPDATE Cards
	SET Balance = Balance + @Sum
	WHERE Cards.CardId = @CardId AND Cards.AccountId = @AccountId

	IF @@TRANCOUNT = 2
		BEGIN
			PRINT 'The transaction completed successfully'
			COMMIT TRANSACTION 
		END
	ELSE
		BEGIN
			PRINT 'The transaction rolled back'
			ROLLBACK TRANSACTION
		END
END;