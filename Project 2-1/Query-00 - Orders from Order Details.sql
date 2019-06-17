SELECT
    [OrderID] AS [Order ID],
	SUM([Quantity]) AS [Quantity]
FROM
    [Northwind].[dbo].[Order Details]
GROUP BY
    [OrderID];