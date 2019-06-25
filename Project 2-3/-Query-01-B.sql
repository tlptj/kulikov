USE library_02;

INSERT INTO subscriptions
(
    sb_subscriber,
	sb_book,
	sb_start,
	sb_finish,
	sb_is_active
)
VALUES
(
    2,
	1,
	CAST('2016-01-25' AS DATE),
	CAST('2016-04-30' AS DATE),
	N'N'
),
(
    2,
	3,
	CAST('2016-01-25' AS DATE),
	CAST('2016-04-30' AS DATE),
	N'N'
),
(
    2,
	5,
	CAST('2016-01-25' AS DATE),
	CAST('2016-04-30' AS DATE),
	N'N'
);