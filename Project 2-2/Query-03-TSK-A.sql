-- Variant 1: using JOIN

SELECT DISTINCT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[subscriptions]
	JOIN [library].[dbo].[books] ON [subscriptions].[sb_book] = [books].[b_id];

-- Variant 2: without JOIN

SELECT DISTINCT
    [b_id] AS [ID],
	[b_name] AS [Name]
FROM
    [library].[dbo].[books]
WHERE
    [b_id] IN
	(
	    SELECT DISTINCT
		    [sb_book]
		FROM
		    [library].[dbo].[subscriptions]
	);