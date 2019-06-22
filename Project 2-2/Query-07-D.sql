USE [library];

WITH
    [cte_subscriptions_per_author] AS
	(
		SELECT
			[authors].[a_id] AS [author_id],        -- Just for clarity, not needed
			[authors].[a_name] AS [author_name],    -- Just for clarity, not needed
			COUNT([subscriptions].[sb_id]) AS [number_of_subscriptions]
		FROM
			[subscriptions]
			JOIN [m2m_books_authors] ON [subscriptions].[sb_book] = [m2m_books_authors].[b_id]
			RIGHT JOIN [authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
		GROUP BY
			[authors].[a_id],
			[authors].[a_name]                      -- Just for clarity, not needed
	),
	[cte_data_for_median] AS
	(
	    SELECT
		    ROW_NUMBER() OVER(ORDER BY [number_of_subscriptions]) AS [row_number],
			[number_of_subscriptions],
			(SELECT COUNT(*) FROM [cte_subscriptions_per_author]) AS [number_of_rows]
		FROM
		    [cte_subscriptions_per_author]
	)
--SELECT * FROM [cte_data_for_median];
SELECT
    AVG([number_of_subscriptions]) AS [median]
	--[number_of_subscriptions]
	--*
FROM
    [cte_data_for_median]
WHERE
    [row_number] IN
	(
	    ([number_of_rows] + 1) / 2,
		([number_of_rows] + 3) / 2
	);

-----------------------------------------------------------------------------
-- Without selecting redundant fields
-----------------------------------------------------------------------------

-- Variant 1 (SELECT COUNT(*) FROM ...)   -- (*)

USE [library];

WITH
    [cte_subscriptions_per_author] AS
	(
		SELECT
			COUNT([subscriptions].[sb_id]) AS [number_of_subscriptions]
		FROM
			[subscriptions]
			JOIN [m2m_books_authors] ON [subscriptions].[sb_book] = [m2m_books_authors].[b_id]
			RIGHT JOIN [authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
		GROUP BY
			[authors].[a_id]
	),
	[cte_data_for_median] AS
	(
	    SELECT
		    ROW_NUMBER() OVER(ORDER BY [number_of_subscriptions]) AS [row_number],
			[number_of_subscriptions],
			(SELECT COUNT(*) FROM [cte_subscriptions_per_author]) AS [number_of_rows]   -- (*)
		FROM
		    [cte_subscriptions_per_author]
	)
SELECT
    AVG([number_of_subscriptions]) AS [median]
FROM
    [cte_data_for_median]
WHERE
    [row_number] IN
	(
	    ([number_of_rows] + 1) / 2,
		([number_of_rows] + 3) / 2
	);

-- Variant 2 (SELECT COUNT(*) FROM ...)    -- (**)

USE [library];

WITH
    [cte_subscriptions_per_author] AS
	(
		SELECT
			COUNT([subscriptions].[sb_id]) AS [number_of_subscriptions]
		FROM
			[subscriptions]
			JOIN [m2m_books_authors] ON [subscriptions].[sb_book] = [m2m_books_authors].[b_id]
			RIGHT JOIN [authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
		GROUP BY
			[authors].[a_id]
	),
	[cte_data_for_median] AS
	(
	    SELECT
		    ROW_NUMBER() OVER(ORDER BY [number_of_subscriptions]) AS [row_number],
			[number_of_subscriptions],
			COUNT(*) OVER (PARTITION BY NULL) AS [number_of_rows]   -- (**)
		FROM
		    [cte_subscriptions_per_author]
	)
SELECT
    AVG([number_of_subscriptions]) AS [median]
FROM
    [cte_data_for_median]
WHERE
    [row_number] IN
	(
	    ([number_of_rows] + 1) / 2,
		([number_of_rows] + 3) / 2
	);