-- Show orders from 1997 to 1998 with freight > 30

-- Variant 1: using AND operator

SELECT
    [OrderID] AS [Odrer ID],
	[OrderDate] AS [Order Date],
	[Freight] AS [Freight]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [OrderDate] > '1997-01-01 00:00:00.000'
	AND [OrderDate] < '1998-10-01 00:00:00.000'
	AND [Freight] > 30
ORDER BY
    [Freight];

-- Variant 2: using BETWEEN operator:

SELECT
    [OrderID] AS [Odrer ID],
	[OrderDate] AS [Order Date],
	[Freight] AS [Freight]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [OrderDate] BETWEEN '1997-01-01 00:00:00.000' AND '1998-10-01 00:00:00.000'
	AND [Freight] > 30
ORDER BY
    [Freight];