SELECT
    [b_id] AS [ID],
	[b_name] AS [Name]
FROM
    [library].[dbo].[books]
WHERE
    [b_id] IN
	(
	    SELECT DISTINCT -- DISTINCT, because a book may have~ multiple genres
		    [b_id]
		FROM
		    [library].[dbo].[m2m_books_genres]
		WHERE
		    [g_id] IN
			(
				SELECT [g_id]
				FROM   [library].[dbo].[genres]
				WHERE  [g_name] IN ('Классика', 'Программирование')
			)
	);