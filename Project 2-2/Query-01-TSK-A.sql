SELECT
    [books].[b_id] AS [Book ID],
    [b_name] AS [Book],
	COUNT([a_id]) AS [Number of Authors]
FROM
    [books]
	INNER JOIN [m2m_books_authors] ON [books].[b_id] = [m2m_books_authors].[b_id]
GROUP BY
    [books].[b_id],
	[b_name]
HAVING
    COUNT([a_id]) > 1;