-- Show total number of units per order

SELECT
    [OrderID] AS [Order ID],
	SUM([Quantity]) AS [Total]
FROM [Order Details]
GROUP BY OrderID;