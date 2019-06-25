USE [library_02];

UPDATE [subscriptions]
SET    [sb_finish] = GETDATE(),
       [sb_is_active] = 'N'
WHERE  [sb_id] = 99;

UPDATE [subscriptions]
SET    [sb_finish] = CAST(N'2019-06-24' AS DATE),
       [sb_is_active] = 'N'
WHERE  [sb_id] = 99;

UPDATE [subscriptions]
SET    [sb_finish] = CONVERT(DATE, GETDATE()),
       [sb_is_active] = 'Y'
WHERE  [sb_id] = 99;