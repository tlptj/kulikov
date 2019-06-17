-- Show all products with max number of units

SELECT
    [OrderID] AS [Order ID],
	[ProductID] AS [Product ID],
	[Quantity] AS [Quantity]
FROM
    [Northwind].[dbo].[Order Details]
WHERE
    [Quantity] = (SELECT MAX([Quantity]) FROM [Northwind].[dbo].[Order Details]);