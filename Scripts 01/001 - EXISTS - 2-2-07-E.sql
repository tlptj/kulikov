USE [library];

SELECT
    CASE
	    WHEN (EXISTS(SELECT * FROM [books])) THEN 1
		ELSE 0
	END
AS [Books Exist]