SELECT
    FORMAT
	(
	    (
			SELECT [sb_finish]
			FROM   [library_02].[dbo].[subscriptions]
			WHERE  [sb_id] = 99
		), 'dd-MM-yyyy, hh:mm:ss'
	)