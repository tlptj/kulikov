-- Variant 1

SELECT
    [b_id] AS [ID],
	[b_name] AS [Name]
FROM
    [library].[dbo].[books]
WHERE
    [b_id] IN
	(
	    --SELECT [b_id]
	    SELECT DISTINCT [b_id]
		FROM   [library].[dbo].[m2m_books_authors]
		WHERE  [a_id] IN
		(
		    SELECT [a_id]
			FROM   [library].[dbo].[authors]
			WHERE  [a_name] IN (N'Д. Карнеги', N'Б. Страуструп')
		)
	);

----------------------------------------------------------------------------------------

-- Variant 2.1

SELECT DISTINCT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[books]
	INNER JOIN [library].[dbo].[m2m_books_authors] ON [books].b_id = [m2m_books_authors].[b_id]
	INNER JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
WHERE
    [authors].[a_name] IN (N'Д. Карнеги', N'Б. Страуструп');

----------------------------------------------------------------------------------------

-- Variant 2.2: trying to use CONTAINS (works)
--
-- CONTAINS  - CONTAINS is a predicate used in the WHERE clause of a Transact-SQL SELECT statement
--             to perform SQL Server full-text search on full-text indexed columns containing
--             character-based data types.            ----------------------------
--
--             Error: Cannot use a CONTAINS or FREETEXT predicate on table or indexed view 'library.dbo.authors'
--                    because it is not full-text indexed.
--
-- https://docs.microsoft.com/en-us/sql/t-sql/queries/contains-transact-sql?view=sql-server-2017

SELECT DISTINCT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[books]
	INNER JOIN [library].[dbo].[m2m_books_authors] ON [books].b_id = [m2m_books_authors].[b_id]
	INNER JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
WHERE
    CONTAINS([authors].[a_name], N'Карнеги')
	OR CONTAINS([authors].[a_name], N'Страуструп');

----------------------------------------------------------------------------------------

-- Variant 2.3: trying to use CHARINDEX (doesn't work)
--
-- CHARINDEX - function searches for one character expression inside a second character expression,
--             returning the starting position of the first expression if found.
--
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql?view=sql-server-2017

SELECT DISTINCT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[books]
	INNER JOIN [library].[dbo].[m2m_books_authors] ON [books].b_id = [m2m_books_authors].[b_id]
	INNER JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
WHERE
    CHARINDEX(N'Карнеги', [authors].[a_name]) != 0
	OR CHARINDEX(N'Страуструп', [authors].[a_name]) != 0;

----------------------------------------------------------------------------------------

-- Variant 2.4: trying to use LIKE (works)
--
-- LIKE      - Determines whether a specific character string matches a specified pattern.
--             A pattern can include regular characters and wildcard characters.
--
-- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/like-transact-sql?view=sql-server-2017

SELECT DISTINCT
    [books].[b_id] AS [ID],
	[books].[b_name] AS [Name]
FROM
    [library].[dbo].[books]
	INNER JOIN [library].[dbo].[m2m_books_authors] ON [books].b_id = [m2m_books_authors].[b_id]
	INNER JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
WHERE
    [authors].[a_name] LIKE N'%Карнеги'
	OR [authors].[a_name] LIKE N'%Страуструп';

	-- This doesn't work (without '%' before author's name):
	--[authors].[a_name] LIKE N'Карнеги'
	--OR [authors].[a_name] LIKE N'Страуструп';
