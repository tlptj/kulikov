USE [library_02];

MERGE INTO [genres]
USING
(
    VALUES
	    (N'���������'),
		(N'��������'),
		(N'��������')
) AS [new_genres] ([g_name])
ON [genres].[g_name] = [new_genres].[g_name]
WHEN NOT MATCHED THEN
    INSERT ([g_name])
	VALUES ([new_genres].[g_name]);

SELECT
    [g_id],
	[g_name]
FROM
    [genres]
ORDER BY
    [g_id];

DELETE FROM [genres]
WHERE ([g_name] LIKE N'%������%') OR ([g_name] LIKE N'%�������%');