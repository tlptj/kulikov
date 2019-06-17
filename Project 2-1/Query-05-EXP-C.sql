-- Aggregate functions behavior on empty set:
-- all functions return NULL.

SELECT
    SUM([Quantity]) AS [Sum],
	AVG([Quantity]) AS [Avg],
	MIN([Quantity]) AS [Min],
	MAX([Quantity]) AS [Max]
FROM
    [Northwind].[dbo].[Order Details]
WHERE
    [Quantity] < 1;