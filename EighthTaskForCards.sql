--Ќаписать триггер на таблицы Account/Cards чтобы нельз€ была занести значени€ в поле баланс если это противоречит 
--услови€м  (то есть нельз€ изменить значение в Account на меньшее, чем сумма балансов по всем карточкам. » соответственно 
--нельз€ изменить баланс карты если в итоге сумма на картах будет больше чем баланс аккаунта)

CREATE TRIGGER [dbo].[CHECK_CARDS_BALANCE]
ON [dbo].[Cards]
AFTER UPDATE, INSERT
AS
BEGIN
	DECLARE @CardsSum MONEY 
	DECLARE @AccountSum MONEY
	DECLARE @AccountId INT

	SELECT @AccountId = (SELECT AccountId FROM DELETED)

	SELECT @CardsSum = (SELECT SUM(Balance) FROM INSERTED WHERE AccountId = @AccountId)

	SELECT @AccountSum = (SELECT Accounts.Balance FROM Accounts WHERE Accounts.AccountId = @AccountId)

	IF @CardsSum > @AccountSum
		BEGIN
			PRINT 'something went wrong'
			ROLLBACK TRANSACTION
		END
	ELSE
		PRINT 'completed successfully'
END