USE [library];

SELECT
    [sb_id] AS [Subscription ID],
	[s_name] AS [Subscriber],
	[b_name] AS [Book],
	[sb_start] AS [Subscription Start],
	[sb_finish] AS [Subscription Finish]
FROM
    [subscriptions]
	JOIN [subscribers] ON [subscriptions].[sb_subscriber] = [subscribers].[s_id]
	JOIN [books] ON [subscriptions].[sb_book] = [books].[b_id];