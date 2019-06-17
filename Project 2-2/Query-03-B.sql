-- Variant 1

SELECT DISTINCT
    [subscribers].[s_id] AS [ID],
	[subscribers].[s_name] AS [Name]
FROM
    [library].[dbo].[subscriptions], [library].[dbo].[subscribers]
WHERE
    [subscriptions].[sb_subscriber] = [subscribers].[s_id];

-- Variant 2

SELECT DISTINCT
    [subscribers].[s_id] AS [ID],
	[subscribers].[s_name] AS [Name]
FROM
    [library].[dbo].[subscribers]
WHERE
    [subscribers].[s_id] IN
	(
	    SELECT DISTINCT
		    [sb_subscriber]
        FROM
		    [library].[dbo].[subscriptions]
	);