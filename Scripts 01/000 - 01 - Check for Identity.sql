-- https://stackoverflow.com/questions/13772019/sql-check-if-a-column-auto-increments

SELECT
    is_identity
FROM
    sys.columns
WHERE
    object_id = object_id('subscriptions')
    AND name = 'sb_id'