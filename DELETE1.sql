-- 1. Kunden med kundid ”ELSK” skall ta bort. Radera denna kund från tabellen.
DELETE FROM Customers
WHERE CustomerID = 'ELSK';

-- 2. Ta bort alla kunder som har kundnamn Systementor AB.
DELETE FROM Customers
WHERE CompanyName = 'Systementor AB';

-- 3. Ta bort alla kunder som har city lika med Stockholm
DELETE FROM Customers
WHERE City = 'Stockholm';