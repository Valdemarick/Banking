--Покажи мне список банков у которых есть филиалы в городе X (выбери один из городов)

SELECT DISTINCT Banks.Name
FROM Banks INNER JOIN Filials ON Banks.BankId = Filials.BankId
		   INNER JOIN Cities ON Cities.CityId = Filials.CityId
WHERE Cities.Name = 'Gomel';