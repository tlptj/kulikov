USE [library]

SELECT
    [b_name] AS [Name],
	[b_year] AS [Year],
	[a_name] AS [Author],
	[g_name] AS [Genre]
FROM
    [books]
	JOIN [m2m_books_authors] ON [books].[b_id] = [m2m_books_authors].[b_id]
	JOIN [m2m_books_genres] ON [books].[b_id] = [m2m_books_genres].[b_id]
	JOIN [authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
	JOIN [genres] ON [m2m_books_genres].[g_id] = [genres].[g_id];