DECLARE @NumberOfAuthors AS tinyint = 1;

SELECT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name],
	COUNT([m2m_books_authors].[a_id]) AS [Number of Authors]
FROM
    [library].[dbo].[books]
	JOIN [library].[dbo].[m2m_books_authors] ON [books].[b_id] = [m2m_books_authors].[b_id]
GROUP BY
    [books].[b_id],
	[books].[b_name]
HAVING
    COUNT([m2m_books_authors].[a_id]) > @NumberOfAuthors;

GO