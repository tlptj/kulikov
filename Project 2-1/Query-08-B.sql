-- Show any order with max number of units

SELECT TOP 1
    [OrderID] AS [Order ID],
	SUM([Quantity]) AS [Quantity]
FROM
    [Northwind].[dbo].[Order Details]
GROUP BY
    [OrderID]
ORDER BY
    [Quantity] DESC;

--------------------------------------------------------

SELECT TOP 1
    [OrderID] AS [Order ID],
	[Quantity] AS [Quantity]
FROM
    [Northwind].[dbo].[Order Details]
ORDER BY
    [Quantity] DESC;