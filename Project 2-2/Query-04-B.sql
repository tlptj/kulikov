SELECT DISTINCT
	[s_id] AS [ID],
	[s_name] AS [Name]
FROM
	[library].[dbo].[subscribers]
WHERE
	[s_id] NOT IN
	(
	    SELECT DISTINCT
			[subscribers].[s_id]
		FROM
			[library].[dbo].[subscribers]
			JOIN [library].[dbo].[subscriptions] ON [subscribers].[s_id] = [subscriptions].[sb_subscriber]
		WHERE
			[subscriptions].[sb_is_active] = 'Y'
	);