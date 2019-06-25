USE [library_02];

SELECT sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active
FROM   subscriptions;

UPDATE [subscriptions]
SET    [sb_finish] = DATEADD(day, 2, [sb_finish])
WHERE  [sb_subscriber] = 2 AND [sb_start] = CAST(N'2016-01-25' AS DATE);
--WHERE  [sb_subscriber] = 2 AND DATEDIFF(day, [sb_start], CAST(N'2016-01-25' AS DATE)) = 0;
--WHERE  [sb_subscriber] = 2 AND [sb_start] = CAST(N'2016-01-25 12:30' AS DATE);    -- Works too

SELECT sb_id, sb_subscriber, sb_book, sb_start, sb_finish, sb_is_active
FROM   subscriptions;