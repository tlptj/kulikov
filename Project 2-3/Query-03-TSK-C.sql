--Задание 2.2.3.TSK.C:
--удалить информацию обо всех выдачах книг,
--произведённых после 20-го числа любого месяца любого года.

--USE [library_02];

--SELECT
--    [subscriptions].[sb_id],
--	  [subscriptions].[sb_start]
--FROM
--    [subscriptions]
--WHERE
--    DATEPART(day, [sb_start]) > 20;

USE [library_02];

DELETE FROM
    [subscriptions]
WHERE
    DATEPART(day, [sb_start]) > 20;