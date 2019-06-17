SELECT *
FROM   [library].[dbo].[subscriptions];

-- Variant 1

SELECT
    [subscribers].[s_id] AS [ID],
	[subscribers].[s_name] AS [Name],
	COUNT([subscriptions].[sb_book]) AS [Books on Hands]
FROM
    [library].[dbo].[subscribers]
	JOIN [library].[dbo].[subscriptions] ON [subscribers].[s_id] = [subscriptions].[sb_subscriber]
WHERE
    [subscriptions].[sb_is_active] = 'Y'
GROUP BY
    [subscribers].[s_id],
	[subscribers].[s_name]
HAVING
    COUNT([subscriptions].[sb_book]) > 1;

-- Variant 2

SELECT
    [s_id] AS [ID],
	[s_name] AS [Name]
FROM
    [library].[dbo].[subscribers]
WHERE
    [s_id] IN
	(
	    -- IDs of subscribers who have more than one active subscription
	    SELECT   [sb_subscriber]
		FROM     [library].[dbo].[subscriptions]
		WHERE    [sb_is_active] = 'Y'
		GROUP BY [sb_subscriber]
		HAVING   COUNT(sb_book) > 1
	);