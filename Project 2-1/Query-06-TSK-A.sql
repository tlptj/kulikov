-- Show employees in reverse alphabetical order

SELECT [LastName] + ' ' + [FirstName] AS [Employee]
FROM [Northwind].[dbo].[Employees]
ORDER BY [Employee] DESC;
--ORDER BY [LastName] + ' ' + [FirstName] DESC;