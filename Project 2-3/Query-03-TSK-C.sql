--������� 2.2.3.TSK.C:
--������� ���������� ��� ���� ������� ����,
--������������ ����� 20-�� ����� ������ ������ ������ ����.

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