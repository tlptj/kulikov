-- Variant 1

SELECT
    [authors].[a_id] AS [ID],
	[authors].[a_name] AS [Name],
	COUNT([subscriptions].[sb_id]) AS [Number of Subscriptions]
FROM
    [library].[dbo].[subscriptions]
	JOIN [library].[dbo].[m2m_books_authors] ON [subscriptions].[sb_book] = [m2m_books_authors].[b_id]
	RIGHT JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
GROUP BY
    [authors].[a_id],
	[authors].[a_name];

-- Variant 2 (*)

SELECT
    [a_id] AS [ID],
	[a_name] AS [Name],
    (
	    SELECT
		    COUNT(*)
		FROM
		    [library].[dbo].[subscriptions]
			JOIN [library].[dbo].[m2m_books_authors] ON [subscriptions].[sb_book] = [m2m_books_authors].[b_id]
		WHERE
		    [m2m_books_authors].[a_id] = [outer].[a_id]
	) AS [Number of Subscriptions]
FROM
    [library].[dbo].[authors] AS [outer];