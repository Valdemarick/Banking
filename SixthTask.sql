SELECT Clients.Name, Clients.Surname, Accounts.Balance - SUM(Cards.Balance) AS AvailableSum
FROM Accounts INNER JOIN Clients ON Accounts.CLientId = Clients.ClientId
			 INNER JOIN Cards ON Cards.AccountId = Accounts.AccountId
GROUP BY Clients.Name, Clients.Surname, Accounts.Balance
HAVING Accounts.Balance - SUM(Cards.Balance) > 0;