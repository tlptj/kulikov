USE [library_02];

SELECT * FROM [genres]
ORDER BY [g_id];

--Задание 2.3.4.TSK.A:
--добавить в базу данных жанры «Политика», «Пси-хология», «История».
MERGE INTO [genres]
USING (VALUES (N'Психология'), (N'Политика'), (N'История'), (N'Магия')) AS [new_genres] ([g_name])
ON [genres].[g_name] = [new_genres].[g_name]
WHEN NOT MATCHED THEN
    INSERT ([g_name])
	VALUES ([new_genres].[g_name]);
	
SELECT * FROM [genres]
ORDER BY [g_id];