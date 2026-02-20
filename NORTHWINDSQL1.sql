-- Hej

-- Jag heter Richard och jag är din nya chef här på Northwind.
-- Jag har fått höra att du är expert i vår databas och därför vänder jag mig till dig.

-- Kan du vara snäll och svara på några frågor gällande vår data?
-- Det är lite bråttom eftersom styrelsen vill ha dessa svar innan dagen är slut.

-- ===============================================================================
-- Min första fråga är rätt enkel:
-- 1. Kan du ge mig en tabell med alla kolumner från kundtabellen i vår databas?
SELECT *
FROM Customers;


-- ===============================================================================
-- Tack. Det blev bra men egenligen behöver jag inte alla kolumner. Förlåt.
-- 2. Kan du ge mig samma tabell fast med endast kolumnerna 
--		KundId, Bolagsnamn och kontaktpersonen?
SELECT CustomerID, CompanyName, Contactname
FROM Customers;

-- ===============================================================================
-- Du var verkligen rätt person att prata med! 
-- 3. Nu behöver jag samma tabell fast nu inkludera även en ny kolumn som du själv 
-- skapar. Kolumnen ska heta 'PostAdress' och inkluderar data från postnummer 
-- och stad. 
-- Gärna i detta format är du snäll. 
--		12209, Berlin
SELECT
	CustomerID,
	CompanyName,
	Contactname,
	CONCAT(Postalcode, ', ', City) AS PostAdress
	FROM Customers;


-- ===============================================================================
-- Helt underbart! Just det! Jag glömde en liten sak.
-- 4. Kan du vara snäll och sortera denna tabell på den nya kolumnen du skapade 
-- precis (PostAdress)? Det blir så svårt för mig att hitta annars.
SELECT
	CustomerID,
	CompanyName,
	Contactname,
	CONCAT(Postalcode, ', ', City) AS PostAdress
	FROM Customers
	ORDER BY PostAdress;


-- ===============================================================================
-- Jag är överlycklig! du verkar verkligen förstå vår databas.
-- Nu behöver jag veta lite kring våra produkter.
-- 5. Kan du vara snäll och plocka fram alla produkter och sortera på leverantörsId?
SELECT *
FROM Products
ORDER BY SupplierID;


-- ===============================================================================
-- Nu känner jag mig lite dum. Jag missade några detaljer i min fråga. Förlåt.
-- 6. Kan du ge mig samma tabell fast sortera leverantörsId i fallande ordning
-- och sedan sortera även på produktnamnet fast denna gång stigande ordning? 
-- Du är en klippa!
SELECT *
FROM Products
ORDER BY SupplierID DESC, ProductName ASC;


-- ===============================================================================
-- Perfekt. Tack! Alla har verkligen rätt. Du är superduktig!
-- 7. Jag skulle behöva en ny tabell som visar alla produkter som vi har
-- slutat sälja. Du behöver inte visa alla kolumner. Det räcker med:
--		Produktid, 
--		namn, 
--		vad de kostar
--		kolumnen som bevisar att vi har slutat sälja dem

-- du får gärna sortera ascending på produktid tack.
SELECT ProductID, ProductName, UnitPrice, Discontinued
FROM Products
WHERE Discontinued = 1
ORDER BY ProductID ASC;


-- ===============================================================================
-- 8. Jag är lite nyfiken. Vad är högsta, lägsta och genomsnittspriser på de 
-- produkter som vi inte sälja längre? Jag vill ha 3 kolumner i tabellen.
-- en som heter 'MinPris', en som heter 'MaxPris' och den sista får heta 'GenomsnittsPris'. 
-- Tack så mycket
SELECT 
	MIN(UnitPrice) AS MinPris,
	MAX(UnitPrice) AS MaxPris,
	AVG(UnitPrice) AS GenomsnittsPris
	FROM Products



-- ===============================================================================
-- 9. Jag måste vara trött idag. du skapade en tabell till mig tidigare (punkt 7).
-- Den var perfekt förutom att jag inte är intresserad i alla produktnamn.
-- Det finns en produkt som heter något med 'Alice'. Jag minns inte exakt.
-- Hur som helst visa inte några rader som innehålla ordet 'Alice' i produktnamnet.
-- Annars är tabellen perfekt så du kan använda din förra syntax från punkt 7 antar jag...
-- ... bara fixa till den lite liksom :)
-- En baggis för en expert som du!
SELECT ProductID, ProductName, UnitPrice, Discontinued
FROM Products
WHERE Discontinued = 1
AND ProductName NOT LIKE '%Alice%'
ORDER BY ProductID ASC;


-- ===============================================================================
-- 10. Jag hörde precis att Edwin på kundavdelningen har glömt lägga till en av våra 
-- bästa kunder. Kan du vara snäll och lägga till en ny kund?

-- Kunden ska heta 'Fish & Chips AB' och ligger på Kungsgatan 22, 11346 Stockholm.
-- Kunden har en kontaktperson som heter David Selenius. Glöm inte att lägga in 
-- ett kundid. Det skall vara FISCH. Tack för hjälpen.
INSERT INTO Customers (CustomerID, CompanyName, ContactName, Address, PostalCode, City)
VALUES ('FISCH', 'Fish & Chips AB', 'David Selenius', '
Kungsgatan 22', '11346', 'Stockholm');


-- ===============================================================================
-- 11. Edwin hat klantat till det igen! Han glömde ge oss telefonnumret till
-- 'Fish & chips AB'. Kan du vara snäll och lägga till detta telefonummer?
--		08-282618
-- Han gav mig även faxnumret... används sällan men vem vet. Lägg till den också.
--		08-282619
-- Använd kundid för att hitta kunden. Vi vet att id:et är unikt.
UPDATE Customers
SET Phone = '08-282618', Fax = '08-282619'
WHERE CustomerID = 'FISCH';


-- ===============================================================================
-- 12. Edwin har bestämt sig att gå vidare. Han tar med sig alla sina kunder också!
-- Det betyder att vi har förlorat 'Fish & Chips AB'
-- Kan du radera kunden helt från vår databas? Gör en hard delete!
DELETE FROM Customers
WHERE CustomerID = 'FISCH';


-- ===============================================================================
-- 13. Personalavdelningen undrar ett par saker och de har bett mig kolla med dig.
-- Ryktet sprider sig att du är den bästa personen att prata med om vår databas!
-- De undrar hur många anställda vi har idag. 
-- Döp gärna kolumnen till något vettigt.
-- Ingen tabell egentligen bara en siffra.
SELECT COUNT(*) AS AntalAnstallda
FROM Employees;


-- ===============================================================================
-- 14. Hur många av dessa anställda finns i amerika?
-- Döp gärna kolumnen till något vettigt.
-- Ingen tabell egentligen bara en siffra.
SELECT COUNT(*) AS AntalAnstalldaUSA
FROM Employees
WHERE Country = 'USA';


-- ===============================================================================
-- 15. Hmmmm. Det blev lite konstigt med 2 tabeller. Kan du istället ge mig en tabell
-- som visar hur många anställda finns i varje land? 
-- Tabellen har 2 kolumner. En kolumn med namet på land och en till kolumn med antalet.
-- Tack så mycket.
SELECT Country, COUNT(*) AS AntalAnstallda
FROM Employees
GROUP BY Country
ORDER BY AntalAnstallda DESC;


-- ===============================================================================
-- 16. Jag skulle vilja se alla ordrar i en tabell tillsammans med kundnamnet!
-- Problemet är att kundnamnet finns inte i ordertabellen. Endast kundid finns!
-- Jag har ingen aning hur man skulle kunna lägga ihop två tabeller...
-- Jag vill endast se våra tyska kunder sorterad på datum ordern gjordes.
-- Ordrar innan 1997 är inte relevant för mig.
-- Kan du visa endast dessa kolumner (i denna ordning)? You rock!!!
--		orderid
--		orderdatum
--		kundid
--		kundnamn (namnge 'Customer Name')
-- Kan du hjälpa mig?
SELECT o.OrderID, o.OrderDate, o.CustomerID, c.CompanyName AS 'Customer Name'
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany'
AND o.OrderDate >= '1997-01-01'
ORDER BY o.OrderDate ASC;


-- ===============================================================================
-- Jag har bara en fråga kvar för idag. Jag måste hämta sonen från skolan :)
-- Nu vet jag att man kan lägga ihop olika tabeller! Jag hade ingen aning!
-- Är det största fördelen med relational databaser kanske?

-- Denna gång tror jag att du måste lägga ihop flera tabeller.
-- Det blir en rolig utmaning (sedan kan vi diskuterar löneförhöjning!)

-- 17. Visa mig alla produkter som kunden 'Around the Horn' köpt. 
-- Visa kundnamn, gatuadress, postort, postnr, produktens namn, orderid, 
-- orderdatum och hur många av produkten köptes i beställningen.
SELECT c.CompanyName, c.Address, c.City, c.PostalCode, p.ProductName, o.OrderID, o.OrderDate, od.Quantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE c.CompanyName = 'Around the Horn'
ORDER BY o.OrderDate ASC;


-- ===============================================================================
-- Tack så otroligt mycket för din hjälp!
-- Nu får du åka hem och titta på Netflix!