SELECT *
FROM   [library].[dbo].[subscriptions]
WHERE  [sb_is_active] = 'Y';

-- Variant 1

SELECT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Title],
	COUNT(*) AS [On Hands]
FROM
    [library].[dbo].[books]
	JOIN [library].[dbo].[subscriptions] ON [books].[b_id] = [subscriptions].[sb_book]
WHERE
    [subscriptions].[sb_is_active] = 'Y'
GROUP BY
    [books].[b_id],
	[books].[b_name];

-- Variant 2

WITH [books_on_hands] AS
(
    SELECT                              
	    [sb_book] AS [book],
		COUNT(*)  AS [quantity]
	FROM
	    [library].[dbo].[subscriptions]
	WHERE
	    [sb_is_active] = 'Y'
	GROUP BY
	    [sb_book]
)
SELECT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Title],
	[books_on_hands].[quantity] AS [Quantity]
FROM
    [library].[dbo].[books]
	JOIN [books_on_hands] ON [books].[b_id] = [books_on_hands].[book]