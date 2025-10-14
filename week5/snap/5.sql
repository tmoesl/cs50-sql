-- EXPLAIN QUERY PLAN
SELECT "friend_id"
FROM friends
WHERE "user_id" = (
    SELECT "id"
    FROM users
    WHERE "username" = 'lovelytrust487')

INTERSECT

SELECT "friend_id"
FROM friends
WHERE "user_id" = (
    SELECT "id"
    FROM users
    WHERE "username" = 'exceptionalinspiration482');


/*
WITH flist1 AS (
    SELECT "friend_id"
    FROM friends
    WHERE "user_id" = (
        SELECT "id"
        FROM users
        WHERE "username" = 'lovelytrust487')
),

flist2 AS (
    SELECT "friend_id"
    FROM friends
    WHERE "user_id" = (
        SELECT "id"
        FROM users
        WHERE "username" = 'exceptionalinspiration482')
)

SELECT f1."friend_id"
FROM flist1 AS f1
INNER JOIN flist2 AS f2
    ON f1."friend_id" = f2."friend_id";
*/
