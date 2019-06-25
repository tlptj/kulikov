USE [library_02];

INSERT INTO [subscriptions]
(
    [sb_subscriber],
	[sb_book],
	[sb_start],
	[sb_finish],
	[sb_is_active]
)
VALUES
(
    4,
	3,
	N'2016-01-15 00:00:00.000', -- CAST(N'2016-01-15' AS DATE),
	N'2016-01-30 00:00:00.000',
	N'N'
);

SELECT
    sb_id,
	sb_subscriber,
	sb_book,
	FORMAT(sb_start, 'dd-MM-yyyy, hh:mm:ss') AS [sb_start],
	sb_finish,
	sb_is_active
FROM
    [subscriptions];