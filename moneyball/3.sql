SELECT year, hr
FROM performances
WHERE player_id = (
    SELECT id
    FROM players
    WHERE first_name = 'Ken'
    AND last_name = 'Griffey'
    AND birth_year = '1969')
ORDER BY year DESC;

/*
SELECT pf.year, pf.hr
FROM performances AS pf
INNER JOIN players AS pl
    ON pf.player_id = pl.id
WHERE pl.first_name = 'Ken'
    AND pl.last_name = 'Griffey'
    AND pl.birth_year = '1969'
ORDER BY pf.year DESC;
*/
