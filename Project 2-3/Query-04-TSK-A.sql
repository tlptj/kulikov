USE [library_02];

SELECT * FROM [genres]
ORDER BY [g_id];

--������� 2.3.4.TSK.A:
--�������� � ���� ������ ����� ���������, ����-��������, ���������.
MERGE INTO [genres]
USING (VALUES (N'����������'), (N'��������'), (N'�������'), (N'�����')) AS [new_genres] ([g_name])
ON [genres].[g_name] = [new_genres].[g_name]
WHEN NOT MATCHED THEN
    INSERT ([g_name])
	VALUES ([new_genres].[g_name]);
	
SELECT * FROM [genres]
ORDER BY [g_id];