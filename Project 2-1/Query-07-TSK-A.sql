-- Show orders with freight less than average

-- Variant 1: using Between

SELECT
    [OrderID] AS [Oredr ID],
    [Freight] AS [Freight]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [Freight] BETWEEN 0.0 AND (SELECT AVG([Freight]) FROM [Northwind].[dbo].[Orders])
ORDER BY
    [Freight] DESC;

-- Variant 2: using "<"

SELECT
    [OrderID] AS [Order ID],
	[Freight] AS [Freight]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [Freight] < (SELECT AVG([Freight]) FROM [Northwind].[dbo].[Orders])
ORDER BY
    [Freight] DESC;

-- Variant 3: using a variable

DECLARE @average_freight AS money = (SELECT AVG([Freight]) FROM [Northwind].[dbo].[Orders]);

SELECT
    [OrderID] AS [Order ID],
	[Freight] AS [Freight]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [Freight] < @average_freight
ORDER BY
    [Freight] DESC;

----------------------------------------------------------------------

GO

-- Show average freight
SELECT AVG([Freight]) AS [Average Freight]
FROM [Northwind].[dbo].[Orders];

GO

-- Store average freight in a variable (1) - assign a value in SELECT statement
DECLARE @average_freight AS money;
SELECT @average_freight = AVG([Freight]) FROM [Northwind].[dbo].[Orders];
SELECT @average_freight AS [Average Freight]; -- Show the variable value

GO

-- Store average freight in a variable (2) - assign a value in SET statement
DECLARE @average_freight AS money;
SET @average_freight = (SELECT AVG([Freight]) FROM [Northwind].[dbo].[Orders]);
SELECT @average_freight AS [Average Freight]; -- Show the variable value

GO

-- Store average freight in a variable (3) - assign a value when declaring a variable
DECLARE @average_freight AS money = (SELECT AVG([Freight]) FROM [Northwind].[dbo].[Orders]);
SELECT @average_freight AS [Average Freight]; -- Show the variable value