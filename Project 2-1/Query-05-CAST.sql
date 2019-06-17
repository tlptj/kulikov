-- Casting

SELECT
    SUM([Quantity]) AS [Sum],
	MIN([Quantity]) AS [Min],
	MAX([Quantity]) AS [Max],
	AVG([Quantity]) AS [Avg (no casting - small int)],
	AVG(CAST([Quantity] AS FLOAT)) AS [Avg (casting to float)]
FROM
    [Northwind].[dbo].[Order Details];