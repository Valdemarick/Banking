--via GROUP BY
SELECT SocialStatuses.Name AS SocialStatus, COUNT(Cards.CardId) AS AmountOfCards
FROM Cards INNER JOIN SocialStatuses ON Cards.SocialStatusId = SocialStatuses.SocialStatusId
GROUP BY SocialStatuses.Name;

--via SUBQUERY
SELECT SocialStatuses.Name,
(SELECT COUNT(Cards.CardId) FROM Cards WHERE Cards.SocialStatusId = SocialStatuses.SocialStatusId) AS AmountOfCards
FROM SocialStatuses;