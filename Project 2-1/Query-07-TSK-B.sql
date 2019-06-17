-- Show IDs and order dates of orders made during the first (1996) year

SET STATISTICS TIME ON

SELECT
    [OrderID] AS [Order ID],
	[OrderDate] AS [Order Date]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [OrderDate] < '1997-01.01 00:00:00.000';

SET STATISTICS TIME OFF

---------------------------------------------------------

SET STATISTICS TIME ON

SELECT
    [OrderID] AS [Order ID],
	[OrderDate] AS [Order Date]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [OrderDate] < (DATEADD(year, 1, (SELECT MIN([OrderDate]) FROM [Northwind].[dbo].[Orders])));

SET STATISTICS TIME OFF

---------------------------------------------------------

DECLARE @date AS datetime = DATEADD(year, 1, (SELECT MIN([OrderDate]) FROM [Northwind].[dbo].[Orders]));

SELECT
    [OrderID] AS [Order ID],
	[OrderDate] AS [Order Date]
FROM
    [Northwind].[dbo].[Orders]
WHERE
    [OrderDate] < @date;