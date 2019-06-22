USE [library];

SELECT TOP 100 *
FROM   [subscriptions];

-----------------------------------------------------------------------------

USE [library];

WITH
    [cte_books_on_hands] AS
	(
	    SELECT
		    [sb_book] AS [book_id],
			COUNT(*) AS [quantity]
		FROM
		    [subscriptions]
		WHERE
		    [sb_is_active] = 'Y'
		GROUP BY
		    [sb_book]
	)
SELECT                     -- Question:
    CASE                   -- in the book solution contains FROM clause
		WHEN EXISTS        -- for this SELECT statement. Why?
		(
			SELECT --TOP 1 -- TOP 1 isn't necessary here
				[books].[b_id]
			FROM
				[books]
				LEFT JOIN [cte_books_on_hands] ON [books].[b_id] = [cte_books_on_hands].[book_id]
			WHERE
				[books].[b_quantity] - ISNULL([cte_books_on_hands].[quantity], 0) < 0
		)
		THEN 1
		ELSE 0
	END
    AS [Error Exists];