SELECT year, salary
FROM salaries
WHERE player_id = (
    SELECT id
    FROM players
    WHERE first_name = 'Cal'
    AND last_name = 'Ripken')
ORDER BY year DESC;

/*
SELECT s.year, s.salary
FROM salaries AS s
INNER JOIN players AS p
    ON s.player_id = p.id
WHERE p.first_name = 'Cal'
    AND p.last_name = 'Ripken'
ORDER BY s.year DESC;
*/
