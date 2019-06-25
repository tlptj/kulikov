USE library_02;

UPDATE subscriptions
SET    sb_is_active = N'N'
WHERE  sb_id <= 50;