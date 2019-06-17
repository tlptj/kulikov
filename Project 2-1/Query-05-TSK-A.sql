-- Show odrers grouped by order date

SELECT *
FROM [Northwind].[dbo].[Orders]
ORDER BY [OrderDate] DESC;

-- Show the most recent order

SELECT 
    --[OrderID] AS [Order ID],
	MAX([OrderDate]) AS [Order Date]
FROM
    [Northwind].[dbo].[Orders];

-- Select the least recent order

SELECT
    MIN([OrderDate]) AS [Order Date]
FROM
    [Northwind].[dbo].[Orders];


------------------------------------------------------------------ Does not work
-- Show the least recent and the most recent orders

--SELECT
--    [OrderID] AS [Order ID],
--	[OrderDate] AS [Order Date]
--FROM
--    [Northwind].[dbo].[Orders]
--HAVING                                      -- HAVING is typically used with a GROUP BY clause.
    --[OrderDate] < GETDATE(); --= MAX([OrderDate]);         -- When GROUP BY is not used, there is an implicit single, aggregated group.