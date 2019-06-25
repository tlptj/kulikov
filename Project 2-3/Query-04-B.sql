-- Preparation:
-- Add some genres to the big_library_02

INSERT INTO [big_library_02].[dbo].[genres]
    ([g_name])
VALUES
    (N'История'),
    (N'Фигня'),
	(N'Наука'),
	(N'Псевдонаука'),
	(N'Классика'),
	(N'Справочник'),
	(N'Учебник'),
	(N'Энциклопедия')

--Задача 2.3.4.b:
--скопировать (без повторений) в базу данных «Библиотека»
--содержимое таблицы genres из базы данных «Большая библиотека»;
--в случае совпадения первичных ключей добавить к существующему имени жанра слово « [OLD]».

MERGE INTO [library_02].[dbo].[genres] AS [destination]
USING [big_library_02].[dbo].[genres]  AS [source]
ON [destination].[g_name] = [source].[g_name]
WHEN MATCHED THEN
    UPDATE SET [destination].[g_name] = CONCAT([destination].[g_name], N' [OLD]')
WHEN NOT MATCHED THEN
    INSERT ([g_name]) VALUES ([source].[g_name]);

-------------------------------------------------------------------------

SELECT *
FROM [library_02].[dbo].[genres]
ORDER BY [g_id];

SELECT *
FROM [big_library_02].[dbo].[genres]
ORDER BY [g_id];

DELETE FROM [library_02].[dbo].[genres]
WHERE [g_id] > 10;