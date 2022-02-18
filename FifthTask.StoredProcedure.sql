CREATE PROCEDURE AddTenDollarsBySocialStatus @SocialStatus NVARCHAR(20)
AS
BEGIN
	UPDATE Accounts
	SET Accounts.Balance = Accounts.Balance + 10
	FROM SocialStatuses, Cards
	WHERE (SocialStatuses.Name = @SocialStatus) AND 
	(Cards.SocialStatusId = SocialStatuses.SocialStatusId) AND
	(Cards.AccountId = Accounts.AccountId)
END;