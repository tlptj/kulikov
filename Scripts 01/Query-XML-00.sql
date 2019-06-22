-- FOR XML RAW

SELECT TOP 10
    [OrderID] AS [Order ID],
	[CustomerID] AS [Customer ID],
	[OrderDate] AS [Order Date]
FROM
    [Northwind].[dbo].[Orders]
FOR XML RAW;

-- FOR XML AUTO

SELECT TOP 10
    [OrderID] AS [Order ID],
	[CustomerID] AS [Customer ID],
	[OrderDate] AS [Order Date]
FROM
    [Northwind].[dbo].[Orders]
FOR XML AUTO;

-- FOR XML PATH

SELECT TOP 10
    [OrderID] AS [OrderID],
	[CustomerID] AS [CustomerID],
	[OrderDate] AS [OrderDate]
FROM
    [Northwind].[dbo].[Orders]
FOR XML PATH('');

----------------------------------------

SELECT TOP 10
    [OrderID] AS [OrderID],
	[CustomerID] AS [CustomerID],
	[OrderDate] AS [OrderDate]
FROM
    [Northwind].[dbo].[Orders]
FOR XML PATH('');