WITH [books_on_hands] AS
(
    /*
	How many books are on hands now?

	[books].[b_id]     [quantity]
	--------------     ----------
	             1              0   <-- '0' if there are no active subscriptions for the book
	             3              2
	*/
    SELECT
	    [books].[b_id],
		  --[subscriptions].[sb_book],
		--[books].[b_name],
		COUNT
		(
		    CASE
			    WHEN [sb_is_active] = 'Y' THEN [sb_is_active]
				ELSE NULL
			END
		) AS [quantity]
	FROM
	    [library].[dbo].[books]
		LEFT JOIN [library].[dbo].[subscriptions] ON [books].[b_id] = [subscriptions].[sb_book]
	GROUP BY
	    [books].[b_id]--,
		  --[subscriptions].[sb_book],
		--[books].[b_name]
)

SELECT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name],
	[books].[b_quantity] AS [Total Quantity],
	[books_on_hands].[quantity] AS [On Hands],
	[books].[b_quantity] - [books_on_hands].[quantity] AS [Actual Quantity]
FROM
    [library].[dbo].[books]
	JOIN [books_on_hands] ON [books].[b_id] = [books_on_hands].[b_id];

-------------------------------------------------------------------------------------------

WITH [books_on_hands] AS
(
    /*
	How many books are on hands now?

	[b_id]     [quantity]
	------     ----------
	     2              1   <-- A book isn't included if there are no active subscriptions for the book
	     3              2
	*/
	SELECT
	    [sb_book] AS [b_id],
		COUNT(*) AS [quantity]
	FROM
	    [library].[dbo].[subscriptions]
	WHERE
	    [sb_is_active] = 'Y'
	GROUP BY
	    [sb_book]
)

SELECT 
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name],
	[books].[b_quantity] AS [Quantity],
	ISNULL([books_on_hands].[quantity], 0) AS [On Hands],
	[books].[b_quantity] - ISNULL([books_on_hands].[quantity], 0) AS [Actual Quantity]
FROM
    [library].[dbo].[books]
	LEFT JOIN [books_on_hands] ON [books].[b_id] = [books_on_hands].[b_id];

-------------------------------------------------------------------------------------------

-- Variant 3 (correlated subquery)


