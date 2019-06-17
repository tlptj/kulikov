-- Variant 1: with JOIN

SELECT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[books]
	LEFT JOIN [library].[dbo].[subscriptions] ON [books].[b_id] = [subscriptions].[sb_book]
WHERE
    [subscriptions].[sb_id] IS NULL;

-- Variant 2: without JOIN

SELECT
    [b_id] AS [ID],
	[b_name] AS [Name]
FROM
    [library].[dbo].[books]
WHERE
    [b_id] NOT IN
	(
	    SELECT DISTINCT
		    [sb_book]
		FROM
		    [library].[dbo].[subscriptions]
	);