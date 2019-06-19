SELECT *
FROM
    [library].[dbo].[books]
	JOIN [library].[dbo].[m2m_books_authors] ON [books].[b_id] = [m2m_books_authors].[b_id]
	JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id];

--

SELECT
    [authors].[a_id] AS [ID],
	[authors].[a_name] AS [Name],
	SUM(ISNULL([books].[b_quantity], 0)) AS [Number of Books]
FROM
    [library].[dbo].[books]
	JOIN [library].[dbo].[m2m_books_authors] ON [books].[b_id] = [m2m_books_authors].[b_id]
	RIGHT JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
GROUP BY
    [authors].[a_id],
	[authors].[a_name];