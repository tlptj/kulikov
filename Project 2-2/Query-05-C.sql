SELECT DISTINCT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[books]
	INNER JOIN [library].[dbo].[m2m_books_genres] ON [books].[b_id] = [m2m_books_genres].[b_id]
WHERE
    [m2m_books_genres].[g_id] IN (2, 5);