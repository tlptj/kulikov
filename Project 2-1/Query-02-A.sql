USE Northwind;

GO

-- Select all companies who made orders

SELECT DISTINCT Customers.CompanyName AS "Company Name"
FROM Customers INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID;