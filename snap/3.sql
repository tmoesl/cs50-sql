-- EXPLAIN QUERY PLAN
SELECT "to_user_id"
FROM messages
WHERE "from_user_id" = (
    SELECT "id"
    FROM users
    WHERE "username" = 'creativewisdom377'
    )
GROUP BY "to_user_id"
ORDER BY COUNT("to_user_id") DESC
LIMIT 3;


/*
EXPLAIN QUERY PLAN
SELECT "to_user_id"
FROM messages AS m
INNER JOIN users AS u
    ON m."from_user_id" = u."id"
WHERE u."username" = 'creativewisdom377'
GROUP BY "to_user_id"
ORDER BY COUNT("to_user_id") DESC
LIMIT 3;
*/

