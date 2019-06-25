--������� 2.3.4.TSK.B:
--����������� (��� ����������) � ���� ������ �����������
--���������� ������� subscribers �� ���� ������ �������� ����������;
--� ������ ���������� ��������� ������ �������� � ����-��������� ����� �������� ����� � [OLD]�.

-- 1. Insert some records into big_library_02.subscribres

SET IDENTITY_INSERT [big_library_02].[dbo].[subscribers] ON;

INSERT INTO [big_library_02].[dbo].[subscribers] ([s_id], [s_name])
    SELECT TOP 4       --
	    [s_id],        -- <-- No "VALUES (SELECT ...)", only "SELECT ..."
	    [s_name]       --
	FROM
	    [library_02].[dbo].[subscribers];

SET IDENTITY_INSERT [big_library_02].[dbo].[subscribers] OFF;

SELECT * FROM [big_library_02].[dbo].[subscribers];

INSERT INTO [big_library_02].[dbo].[subscribers] ([s_name])
VALUES (N'������ �.�.'), (N'����� �.�.'), (N'�������� �.�.'), (N'������ �.�.'), (N'�������� �.�.');

SELECT * FROM [big_library_02].[dbo].[subscribers];

-- 2. Solution

SET IDENTITY_INSERT [big_library_02].[dbo].[subscribers] ON;

SELECT * FROM [big_library_02].[dbo].[subscribers]
ORDER BY [s_id];

MERGE INTO [library_02].[dbo].[subscribers] AS [destination]
USING [big_library_02].[dbo].[subscribers]  AS [source]
ON [destination].[s_id] = [source].[s_id]
WHEN MATCHED THEN
    UPDATE SET [destination].[s_name] = CONCAT([destination].[s_name], N' [OLD]')
WHEN NOT MATCHED THEN
    INSERT ([s_id], [s_name])
	VALUES ([source].[s_id], [source].[s_name]);

SELECT * FROM [big_library_02].[dbo].[subscribers]
ORDER BY [s_id];

SET IDENTITY_INSERT [big_library_02].[dbo].[subscribers] OFF;