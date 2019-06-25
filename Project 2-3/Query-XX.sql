USE [library_02];

-- Subscriptions to books that have more than one genre, and one of genres is "Классика"

WITH
    [classic_books] AS
	(
	    SELECT
		    [books].[b_id],
			[books].[b_name]
		FROM
		    [books]
			JOIN [m2m_books_genres] ON [books].[b_id] = [m2m_books_genres].[b_id]
			JOIN [genres] ON [m2m_books_genres].[g_id] = [genres].[g_id]
		WHERE
		    [genres].[g_name] LIKE N'%классика%'
	),
	[multigenre_books] AS
	(
	    SELECT
		    [b_id]
		FROM
		    [m2m_books_genres]
		GROUP BY
		    [b_id]
		HAVING
		    COUNT(*) > 1
	)
SELECT
    [sb_id],
	[sb_book],
	[sb_subscriber]
FROM
    [subscriptions]
WHERE
    [sb_book] IN (SELECT [b_id] FROM [classic_books])
	AND [sb_book] IN (SELECT [b_id] FROM [multigenre_books]);