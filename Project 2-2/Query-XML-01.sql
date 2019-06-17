--(SELECT TOP 10
--    [OrderID] AS [OrderID],
--	[CustomerID] AS [CustomerID],
--	[OrderDate] AS [OrderDate]
--FROM
--    [Northwind].[dbo].[Orders]
--FOR XML PATH).value('.', 'nvarchar(max)');

--------------------------------------------------------------------------

--WITH [prepared_data]
-- AS (SELECT [books].[b_id],
-- [b_name],
-- [a_name]
-- FROM [books]
-- JOIN [m2m_books_authors]
-- ON [books].[b_id] = [m2m_books_authors].[b_id]
-- JOIN [authors]
-- ON [m2m_books_authors].[a_id] = [authors].[a_id]
-- )
--SELECT [outer].[b_name]
-- AS [book],
-- STUFF ((SELECT ', ' + [inner].[a_name]
-- FROM [prepared_data] AS [inner]
-- WHERE [outer].[b_id] = [inner].[b_id]
-- ORDER BY [inner].[a_name]
-- FOR XML PATH(''), TYPE).value('.', 'nvarchar(max)'),
-- 1, 2, '')
-- AS [author(s)]
--FROM [prepared_data] AS [outer]
--GROUP BY [outer].[b_id],
-- [outer].[b_name]

 --------------------------------------------------------------------------

 WITH [prepared_data] AS (
     SELECT
	     [books].[b_id],
	     [b_name],
		 [a_name]
     FROM
	     [books]
		 JOIN [m2m_books_authors] ON [books].[b_id] = [m2m_books_authors].[b_id]
		 JOIN [authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
 )

 SELECT ', ' + [inner].[a_name]
 FROM [prepared_data] AS [inner]
 WHERE [prepared_data].[b_id] = [inner].[b_id]
 ORDER BY [inner].[a_name]
 FOR XML PATH(''), TYPE