-- Задание 2.2.3.TSK.B:
-- удалить все книги, относящиеся к жанру «Классика».

USE [library_02];

DELETE FROM [books]
WHERE
    [b_id] IN
	(
	    SELECT
		    [books].[b_id]
			--,[books].[b_name],
			--[genres].[g_name]
		FROM
		    [books]
			JOIN [m2m_books_genres] ON [books].[b_id] = [m2m_books_genres].[b_id]
			JOIN [genres] ON [m2m_books_genres].[g_id] = [genres].[g_id]
		WHERE
		    [genres].[g_name] LIKE N'%класс%'
	);