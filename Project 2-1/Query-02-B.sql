USE Northwind;

GO

---- Select Contacts with the same name

--SELECT Customers.ContactName AS "Contact Name", COUNT(*) AS "Number of Contacts"
--FROM Customers
--GROUP BY Customers.ContactName;

-- Count customers from the same City

SELECT Customers.City AS "City", COUNT(*) AS "Number of Customers"
FROM Customers
GROUP BY Customers.City;