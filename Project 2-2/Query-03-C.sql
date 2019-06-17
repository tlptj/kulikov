SELECT DISTINCT
    [subscribers].[s_id] AS [ID],
	[subscribers].[s_name] AS [Name]
FROM
    [library].[dbo].[subscriptions]
	RIGHT JOIN [library].[dbo].[subscribers] ON [subscriptions].[sb_subscriber] = [subscribers].[s_id]
WHERE
    [subscriptions].[sb_id] IS NULL;