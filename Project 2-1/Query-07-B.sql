-- Show IDs and order dates of orders made in summer of 1997

-- Variant 1: using BETWEEN operator

SELECT
    [OrderID] AS [Order ID],
	[OrderDate] AS [Order Date]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [OrderDate] BETWEEN '1997-06-01 00:00:00.000' AND '1997.08.31 23:59:59.997'
ORDER BY
    [OrderDate];

-- Variant 2: using AND operator

SELECT
    [OrderID] AS [Order ID],
	[OrderDate] AS [Order Date]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [OrderDate] >= '1997-06-01 00:00:00.000'
	AND [OrderDate] < '1997.09.01 00:00:00.000'
ORDER BY
    [OrderDate];