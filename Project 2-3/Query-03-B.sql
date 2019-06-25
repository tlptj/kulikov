USE [library_02];

DELETE FROM [subscriptions]
WHERE
    [sb_subscriber] = 3
	AND DATEPART(weekday, [sb_start]) = 1;