SELECT
    [subscribers].[s_id] AS [ID],
	[subscribers].[s_name] AS [Name]
FROM
    [library].[dbo].[subscriptions]
	RIGHT JOIN [library].[dbo].[subscribers] ON [subscriptions].[sb_subscriber] = [subscribers].[s_id]
GROUP BY
    [subscribers].[s_id],
	[subscribers].[s_name]
HAVING
    COUNT
	(
	    CASE
		    WHEN [subscriptions].[sb_is_active] = 'Y' THEN [subscriptions].[sb_is_active]
			ELSE NULL
		END
	) = 0;