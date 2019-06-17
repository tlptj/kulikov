SELECT DISTINCT
    [subscribers].[s_id] AS [ID],
	[subscribers].[s_name] AS [Name]
FROM
    [library].[dbo].[subscribers]
WHERE
    [subscribers].[s_id] NOT IN
	(
	    SELECT DISTINCT
		    [subscriptions].[sb_subscriber]
		FROM
		    [library].[dbo].[subscriptions]
	);