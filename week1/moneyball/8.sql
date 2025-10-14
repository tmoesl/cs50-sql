SELECT s.salary
FROM salaries AS s
INNER JOIN performances AS p
    ON s.player_id = p.player_id AND s.year = p.year
WHERE p.year = '2001'
ORDER BY p.HR DESC, s.salary DESC
LIMIT 1;

/*
SELECT salary
FROM salaries
WHERE player_id = (
    SELECT player_id
    FROM performances
    WHERE year = '2001'
    ORDER BY HR DESC
    LIMIT 1)
    AND year = '2001'
ORDER BY salary DESC
LIMIT 1;
*/
