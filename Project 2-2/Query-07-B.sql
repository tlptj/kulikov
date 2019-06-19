
-- Variant 1 (using MAX)

USE library;

WITH [cte_subscriptions] AS
(
    SELECT
		[authors].[a_id] AS [author_id],
		[authors].[a_name] AS [author_name],
		COUNT([subscriptions].[sb_id]) AS [number_of_subscriptions]
	FROM
		[authors]
		JOIN [m2m_books_authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
		LEFT JOIN [subscriptions] ON [subscriptions].[sb_book] = [m2m_books_authors].[b_id]
	GROUP BY
		[authors].[a_id],
		[authors].[a_name]
)
SELECT
    [author_id],
	[author_name],
	[number_of_subscriptions]
FROM
    [cte_subscriptions]
WHERE
    [number_of_subscriptions] =
	(
	    SELECT MAX([number_of_subscriptions])
	    FROM   [cte_subscriptions]
	);

-- Variant 2 (using RANK)

USE library;

WITH [cte_subscriptions] AS
(
    SELECT
		[authors].[a_id] AS [author_id],
		[authors].[a_name] AS [author_name],
		COUNT([subscriptions].[sb_id]) AS [number_of_subscriptions],
		RANK() OVER (ORDER BY COUNT([subscriptions].[sb_id]) DESC) AS [rank]
	FROM
		[authors]
		JOIN [m2m_books_authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
		LEFT JOIN [subscriptions] ON [subscriptions].[sb_book] = [m2m_books_authors].[b_id]
	GROUP BY
		[authors].[a_id],
		[authors].[a_name]
)
SELECT
    [author_id],
	[author_name],
	[number_of_subscriptions]
FROM
    [cte_subscriptions]
WHERE
    [rank] = 1;

-- Variant 3 (using TOP ... WITH TIES)

USE library;

WITH [cte_subscriptions] AS
(
    SELECT
		[authors].[a_id] AS [author_id],
		[authors].[a_name] AS [author_name],
		COUNT([subscriptions].[sb_id]) AS [number_of_subscriptions],
		RANK() OVER (ORDER BY COUNT([subscriptions].[sb_id]) DESC) AS [rank]
	FROM
		[authors]
		JOIN [m2m_books_authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
		LEFT JOIN [subscriptions] ON [subscriptions].[sb_book] = [m2m_books_authors].[b_id]
	GROUP BY
		[authors].[a_id],
		[authors].[a_name]
)
SELECT TOP 1 WITH TIES
    [author_id],
	[author_name],
	[number_of_subscriptions]
FROM
    [cte_subscriptions]
ORDER BY
    [number_of_subscriptions] DESC;