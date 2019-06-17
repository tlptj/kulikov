-- Variant 1

SELECT
    [authors].[a_id] AS [ID],
	[authors].[a_name] AS [Name],
	COUNT(*) AS [Number of Books]
FROM
    [library].[dbo].[m2m_books_authors]
	JOIN [library].[dbo].[authors] ON [m2m_books_authors].[a_id] = [authors].[a_id]
GROUP BY
    [authors].[a_id],
	[authors].[a_name]
HAVING
    COUNT(*) > 1;
	--COUNT(b_id) > 1;

-- Variant 2

SELECT
    [authors].[a_id] AS [ID],
	[authors].[a_name] AS [Name]
FROM
    [library].[dbo].[authors]
WHERE
    [a_id] IN
	(
	    SELECT   [a_id]
		FROM     [library].[dbo].[m2m_books_authors]
		GROUP BY [a_id]
		HAVING   COUNT([b_id]) > 1
	);

-- Variant 3

WITH [authors_2] AS
(
    SELECT   [a_id] AS [a_id]
	FROM     [library].[dbo].[m2m_books_authors]
	GROUP BY [a_id]
	HAVING   COUNT([b_id]) > 1
)
SELECT
    [a_id] AS [ID],
	[a_name] AS [Name]
FROM
    [library].[dbo].[authors]
WHERE
    [authors].[a_id] IN
	(
	    SELECT [a_id]
		FROM [authors_2]
	);