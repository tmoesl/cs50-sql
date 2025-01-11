SELECT DISTINCT t.name
FROM teams AS t
INNER JOIN performances AS pf
    ON t.id = pf.team_id
INNER JOIN players AS pl
    ON pf.player_id = pl.id
WHERE pl.first_name = 'Satchel'
    AND pl.last_name = 'Paige';

/*
SELECT name
FROM teams
WHERE id IN (
    SELECT team_id
    FROM performances
    WHERE player_id = (
        SELECT id
        FROM players
        WHERE first_name = 'Satchel'
        AND last_name = 'Paige'));
*/
