USE library_02;

DELETE FROM subscriptions
WHERE
    sb_subscriber = 4
	AND sb_book = 3
	AND sb_start = CAST('2016-01-15' AS DATE);