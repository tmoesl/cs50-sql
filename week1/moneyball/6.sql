SELECT t.name,
SUM(p.H) As total_hits
FROM performances AS p
INNER JOIN teams AS t
    ON p.team_id = t.id
WHERE p.year = '2001'
GROUP BY t.name
ORDER BY total_hits DESC
LIMIT 5;

/*
SELECT (SELECT t.name FROM teams AS t WHERE t.id = p.team_id) AS name,
SUM(p.H) AS total_hits
FROM performances AS p
WHERE p.year = '2001'
GROUP BY p.team_id
ORDER BY total_hits DESC
LIMIT 5;
*/
