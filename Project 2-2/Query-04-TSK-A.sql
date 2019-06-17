
-- Vaniant 1: without JOIN

SELECT
    [b_id] AS [ID],
	[b_name] AS [Name]
FROM
    [library].[dbo].[books]
WHERE
    [b_id] NOT IN
	(
	    SELECT
		    [sb_book]
		FROM
		    [library].[dbo].[subscriptions]
		WHERE
		    [sb_is_active] = 'Y'
	);

-- Variant 2: with JOIN

SELECT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[subscriptions]
	RIGHT JOIN [library].[dbo].[books] ON [subscriptions].[sb_book] = [books].[b_id]
GROUP BY
    [books].[b_id],
	[books].[b_name]
HAVING
    COUNT
	(
	    CASE
		    WHEN [subscriptions].[sb_is_active] = 'Y' THEN [subscriptions].[sb_is_active]
			ELSE NULL
		END
	) = 0;