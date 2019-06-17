SELECT *
FROM   [library].[dbo].[m2m_books_genres];

DECLARE @NumberOfGenres AS tinyint = 1;

-- Variant 1

SELECT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Title]--,
	--COUNT([m2m_books_genres].[g_id])
FROM
    [library].[dbo].[books]
	JOIN [library].[dbo].[m2m_books_genres] ON [books].[b_id] = [m2m_books_genres].[b_id]
GROUP BY
    [books].[b_id],
	[books].[b_name]
HAVING
    COUNT([m2m_books_genres].[g_id]) > @NumberOfGenres;

-- Variant 2

SELECT
    [b_id] AS [ID],
	[b_name] AS [Title]
FROM
    [library].[dbo].[books]
WHERE
    [b_id] IN
	(
	    -- IDs of books with more than 1 genre
	    SELECT   [b_id]
		FROM     [library].[dbo].[m2m_books_genres]
		GROUP BY [b_id]
		HAVING   COUNT(g_id) > 1
	);