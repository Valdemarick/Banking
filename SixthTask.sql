--Получить список доступных средств для каждого клиента. То есть если у клиента на банковском аккаунте 
--60 рублей, и у него 2 карточки по 15 рублей на каждой, 
--то у него доступно 30 рублей для перевода на любую из карт

SELECT Clients.Name, Clients.Surname, Accounts.Balance - SUM(Cards.Balance) AS AvailableSum
FROM Accounts INNER JOIN Clients ON Accounts.CLientId = Clients.ClientId
			 INNER JOIN Cards ON Cards.AccountId = Accounts.AccountId
GROUP BY Clients.Name, Clients.Surname, Accounts.Balance
HAVING Accounts.Balance - SUM(Cards.Balance) > 0;