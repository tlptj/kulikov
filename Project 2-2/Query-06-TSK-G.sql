SELECT *
FROM [library].[dbo].[subscriptions];

-- Variant 1

SELECT
    [subscribers].[s_id] AS [ID],
	[subscribers].[s_name] AS [Name],
	COUNT(*) AS [Books on Hands]
FROM
    [library].[dbo].[subscribers]
    JOIN [library].[dbo].[subscriptions] ON [subscribers].[s_id] = [subscriptions].[sb_subscriber]
WHERE
    [subscriptions].[sb_is_active] = 'Y'
GROUP BY
    [subscribers].[s_id],
	[subscribers].[s_name];

-- Variant 2

SELECT
    [s_id] AS [ID],
	[s_name] AS [Name],
	(
	    SELECT COUNT(*)
		FROM   [library].[dbo].[subscriptions]
		WHERE  [sb_is_active] = 'Y' AND [sb_subscriber] = [outer].[s_id]
	) AS [Books on Hands]
FROM
    [library].[dbo].[subscribers] AS [outer]
WHERE -- Show only subscribers that have taken books
    [s_id] IN
	(
	    SELECT [sb_subscriber]
		FROM   [library].[dbo].[subscriptions]
		WHERE  [sb_is_active] = 'Y' -- Select only subscribers with active subscriptions
	);