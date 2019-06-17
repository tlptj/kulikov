-- Variant 1

SELECT                                                       -- IDs of books having both '�������' and '����������'
    [b_id] AS [ID],                                          -- in their lists of authors
	[b_name] AS [Name]
FROM
    [library].[dbo].[books]
WHERE
(
    [b_id] IN
	(
	    SELECT [b_id]                                        -- IDs of books written by '�������'
		FROM   [library].[dbo].[m2m_books_authors]
		WHERE  [a_id] IN (SELECT [a_id]                      -- IDs of authors with names matching '�������'
		                  FROM   [library].[dbo].[authors]
						  WHERE  [a_name] LIKE N'%�������')
	)
)
AND
(
    [b_id] IN
	(
	    SELECT [b_id]                                        -- IDs of books written by '����������'
		FROM   [library].[dbo].[m2m_books_authors]
		WHERE  [a_id] IN (SELECT [a_id]                      -- IDs of authors with names matching '����������'
		                  FROM   [library].[dbo].[authors]
						  WHERE  [a_name] LIKE N'%����������')
	)
);

-------------------------------------------------------------------------------------------------------------------

-- Variant 2

SELECT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[books]
	JOIN [library].[dbo].[m2m_books_authors] ON [books].[b_id] = [m2m_books_authors].[b_id]
	JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
GROUP BY
    [books].[b_id],
	[books].[b_name]
HAVING
    COUNT
	(
	    CASE
		    WHEN [authors].[a_name] LIKE N'%�������' THEN [authors].[a_name]
			WHEN [authors].[a_name] LIKE N'%����������' THEN [authors].[a_name]
			ELSE NULL
		END
	) >= 2;
