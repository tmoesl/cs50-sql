SELECT s.name
FROM schools AS s
INNER JOIN districts AS d
    ON s.district_id = d.id
WHERE d.name = 'Cambridge';

/*
SELECT name
FROM schools
WHERE district_id IN (
    SELECT id
    FROM districts
    WHERE name = 'Cambridge');
*/
