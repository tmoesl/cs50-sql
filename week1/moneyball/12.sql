WITH least_expensive_players_per_hit AS (
    SELECT pl.id, pl.first_name, pl.last_name
    FROM players As pl
    INNER JOIN salaries AS s
        ON pl.id = s.player_id
    INNER JOIN performances AS pf
        ON s.player_id = pf.player_id AND s.year = pf.year
    WHERE pf.year = '2001' AND pf.H <> 0
    ORDER BY (s.salary / pf.H) ASC
    LIMIT 10)

,least_expensive_players_per_rbi AS (
    SELECT pl.id, pl.first_name, pl.last_name
    FROM players As pl
    INNER JOIN salaries AS s
        ON pl.id = s.player_id
    INNER JOIN performances AS pf
        ON s.player_id = pf.player_id AND s.year = pf.year
    WHERE pf.year = '2001' AND pf.RBI <> 0
    ORDER BY (s.salary / pf.RBI) ASC
    LIMIT 10)

SELECT lepph.first_name, lepph.last_name
FROM least_expensive_players_per_hit AS lepph
INNER JOIN least_expensive_players_per_rbi AS leppr
    ON lepph.id = leppr.id
ORDER BY lepph.id ASC;
