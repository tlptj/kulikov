-- Variant 1

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
		    [g_id] = 2
			OR [g_id] = 5
			-- [g_id] IN (2, 5)
	);

-- Variant 2

SELECT DISTINCT -- Comment DISTINCT to see what will happen when seeking for books by 'Д. Карнеги' and 'Б. Страуструп'
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[books]
	INNER JOIN [library].[dbo].[m2m_books_authors] ON [books].[b_id] = [m2m_books_authors].[b_id]
	INNER JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
WHERE
	[authors].[a_name] = N'Д. Карнеги'
	OR [authors].[a_name] = N'Б. Страуструп'

--    [authors].[a_name] = N'А. Азимов'
--    OR [authors].[a_name] = N'А.С. Пушкин'
