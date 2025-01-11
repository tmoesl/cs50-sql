SELECT t.name,
ROUND(AVG(s.salary),2) AS average_salary
FROM teams AS t
INNER JOIN salaries AS s
    ON t.id = s.team_id
WHERE s.year = '2001'
GROUP BY t.name
ORDER BY average_salary ASC
LIMIT 5;

/*
An INNER JOIN automatically excludes NULL values by
only including rows with matches in both tables,
while subqueries require explicit filtering for
NULLs if no match exists.

SELECT t.name,
    (SELECT ROUND(AVG(s.salary),2)
    FROM salaries AS s
    WHERE s.team_id = t.id
    AND s.year = '2001') AS average_salary
FROM teams AS t
WHERE (SELECT AVG(s.salary)
       FROM salaries AS s
       WHERE s.team_id = t.id
         AND s.year = '2001') IS NOT NULL
GROUP BY t.name
ORDER BY average_salary ASC
LIMIT 5;
*/
