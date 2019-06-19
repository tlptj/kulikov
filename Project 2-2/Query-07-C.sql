USE [library];

SELECT
    AVG(CAST([number_of_subscriptions] AS FLOAT)) AS [Average number of subscriptions per author]
FROM
(
    SELECT
		COUNT([subscriptions].[sb_id]) AS [number_of_subscriptions]
	FROM
		[authors]
		JOIN [m2m_books_authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
		LEFT JOIN [subscriptions] ON [subscriptions].[sb_book] = [m2m_books_authors].[b_id]
	GROUP BY
		[authors].[a_id]
) AS [subscriptions_per_author]; -- Does not work without "AS [subscriptions_per_author]"