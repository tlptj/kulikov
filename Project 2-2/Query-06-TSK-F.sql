-- Variant 1

SELECT
    [authors].[a_id] AS ID,
	[authors].[a_name] AS [Name],
	COUNT(*) AS [Titles]
FROM
    [library].[dbo].[authors]
	JOIN [library].[dbo].[m2m_books_authors] ON [authors].[a_id] = [m2m_books_authors].[a_id]
GROUP BY
    [authors].[a_id],
	[authors].[a_name];

-- Variant 2

SELECT
    [a_id] AS [ID],
	[a_name] AS [Name],
	(
	    -- Number of books that have current author in their authors list
		SELECT COUNT([a_id])
		FROM   [library].[dbo].[m2m_books_authors]
		WHERE  [m2m_books_authors].[a_id] = [outer].[a_id]
	) AS [Titles]
FROM
    [library].[dbo].[authors] AS [outer];