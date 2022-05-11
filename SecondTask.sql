--ѕолучить список карточек с указанием имени владельца, баланса и названи€ банка

SELECT Cards.OwnerName, Cards.Balance, Banks.Name
FROM Cards INNER JOIN Banks ON Cards.BankId = Banks.BankId;