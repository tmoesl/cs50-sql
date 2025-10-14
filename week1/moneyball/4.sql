SELECT p.first_name,
    p.last_name,
    s.salary
FROM players AS p
INNER JOIN salaries AS s
    ON p.id = s.player_id
WHERE s.year = '2001'
ORDER BY s.salary ASC,
    p.first_name ASC,
    p.last_name ASC,
    p.id
LIMIT 50;
