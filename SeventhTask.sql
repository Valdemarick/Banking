--Написать процедуру которая будет переводить определённую сумму со счёта на карту этого аккаунта.  
--При этом будем считать что деньги на счёту все равно останутся, просто сумма средств на карте увеличится. 
--Например, у меня есть аккаунт на котором 1000 рублей и две карты по 300 рублей на каждой. Я могу перевести 
--200 рублей на одну из карт, при этом баланс аккаунта останется 1000 рублей, а на картах будут суммы 300 и 500 
--рублей соответственно. После этого я уже не смогу перевести 400 рублей с аккаунта ни на одну из карт, так как останется 
--всего 200 свободных рублей (1000-300-500). Переводить БЕЗОПАСНО. То есть использовать транзакцию

SELECT * FROM Accounts;
SELECT * FROM Cards;

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

	--Removed because the task condition has changed. 29.03.2022
	--UPDATE Accounts 
	--SET Balance = Balance - @Sum
	--WHERE Accounts.AccountId = @AccountId

	UPDATE Cards
	SET Balance = Balance + @Sum
	WHERE Cards.CardId = @CardId AND Cards.AccountId = @AccountId

	IF @@TRANCOUNT = 1
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

GO
EXEC TransferMoneyFromAccountToCard 1, 1, 5
GO

SELECT * FROM Accounts;
SELECT * FROM Cards;