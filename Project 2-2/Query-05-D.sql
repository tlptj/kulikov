SELECT DISTINCT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[books]
	JOIN [library].[dbo].[m2m_books_genres] ON [books].[b_id] = [m2m_books_genres].[b_id]
	JOIN [library].[dbo].[genres] ON [m2m_books_genres].[g_id] = [genres].[g_id]
WHERE
    [genres].[g_name] IN ('Классика', 'Программирование');