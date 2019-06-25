
DECLARE @SubscriberId1 AS int = 5;
DECLARE @SubscriberId2 AS int = 6;
DECLARE @SubscriberId3 AS int = 7;

DECLARE @BookId AS int = 6;

DECLARE @StartDate AS date = CAST(N'2016-01-30' AS date);
DECLARE @EndDate AS date = DATEADD(MONTH, 1, @StartDate);

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
    @SubscriberId1,
	@BookId,
	@StartDate,
	@EndDate,
	'N'
);

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
    @SubscriberId2,
	@BookId,
	@StartDate,
	@EndDate,
	'N'
);

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
    @SubscriberId3,
	@BookId,
	@StartDate,
	@EndDate,
	'N'
);

SELECT * FROM subscriptions;