SELECT * FROM Accounts;

DECLARE @SocialStatus NVARCHAR (20);
SET @SocialStatus = 'disabled';

EXEC AddTenDollarsBySocialStatus @SocialStatus;

SELECT * FROM Accounts;