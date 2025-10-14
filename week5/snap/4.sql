-- EXPLAIN QUERY PLAN
SELECT "username"
FROM users
WHERE "id" = (
    SELECT "to_user_id"
    FROM messages
    GROUP BY "to_user_id"
    ORDER BY COUNT("to_user_id") DESC
    LIMIT 1
);


/*
SELECT u."username"
FROM users AS u
INNER JOIN messages AS m
    ON u."id" = m."to_user_id"
GROUP BY m."to_user_id"
ORDER BY COUNT(m."to_user_id") DESC
LIMIT 1;
*/
