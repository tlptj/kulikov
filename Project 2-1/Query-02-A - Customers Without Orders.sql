USE Northwind;

GO

-- Select all customers who don't have orders

SELECT Customers.CompanyName AS "Company Name"
FROM Orders RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderID IS NULL;