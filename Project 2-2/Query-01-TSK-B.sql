USE [library];

SELECT
    [books].[b_id] AS [Book ID],
	[b_name] AS [Book]
FROM
    [books]
	INNER JOIN [m2m_books_genres] ON [books].[b_id] = [m2m_books_genres].[b_id]
GROUP BY
    [books].[b_id],
	[b_name]
HAVING
    COUNT([g_id]) = 1;