USE library_02;

UPDATE subscriptions
SET    sb_start = DATEADD(day, -3, sb_start)
WHERE  sb_start < '2012-01-01'