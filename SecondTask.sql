SELECT Cards.OwnerName, Cards.Balance, Banks.Name
FROM Cards INNER JOIN Banks ON Cards.BankId = Banks.BankId;