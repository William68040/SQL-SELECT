-- 1. Lägg till en ny kund som heter Systementor AB och ligger på Testgatan 12, 11222 Nacka.
-- Kunden har en kontaktperson som heter Stefan Holmberg. Du måste även lägga in ett kundid
-- och det skall vara SYAB.
INSERT INTO dbo.Customers (CustomerID, CompanyName, ContactName, Address, City, PostalCode)
VALUES ('SYAB', 'Systementor AB', 'Stefan Holmberg', 'Testgatan 12', 'Nacka', '11222');


-- 2. Lägg till en ny kund som heter Djurgårdens IF och har adressen Johanneshov
-- postnummer 11122  och ligger i Stockholm. Kunden har en kontaktperson som heter Anna
-- Persson . Du måste även lägga in ett kundid och det skall vara DJIF.
INSERT INTO dbo.Customers (CustomerID, CompanyName, ContactName, Address, City, PostalCode)
VALUES ('DJIF', 'Djurgårdens IF', 'Anna Persson', 'Johanneshov', 'Stockholm', '11122');


-- 3. Lägg till en ny kund som heter Elgiganten och har adressen Sicka Köpkvarter
-- och ligger i Nacka. Kunden har en kontaktperson som heter Malin Larsson. Du
-- måste även lägga in ett kundid och det skall vara ELSK.
INSERT INTO dbo.Customers (CustomerID, CompanyName, ContactName, Address, City)
VALUES ('ELSK', 'Elgiganten', 'Malin Larsson', 'Sicka Köpkvarter', 'Nacka');


-- 4. Försök att lägga in en kund utan att ange kundnamn. Vad händer? Varför får du det
-- felmeddelande som dyker upp
INSERT INTO dbo.Customers (CustomerID, ContactName, Address, City, PostalCode)
VALUES ('TEST', 'Test Person', 'Testgatan 1', 'Test City', '12345');
-- Felmeddelandet som dyker upp är "Cannot insert the value NULL into column
-- 'CompanyName', table 'Northwind.dbo.Customers'; column does not allow nulls. INSERT fails."