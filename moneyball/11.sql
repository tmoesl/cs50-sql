SELECT pl.first_name,
    pl.last_name,
    (s.salary / pf.H) AS dollars_per_hit
FROM players As pl
INNER JOIN salaries AS s
    ON pl.id = s.player_id
INNER JOIN performances AS pf
    ON s.player_id = pf.player_id AND s.year = pf.year
WHERE pf.year = '2001' AND pf.H <> 0
ORDER BY dollars_per_hit ASC,
    pl.first_name ASC,
    pl.last_name ASC
LIMIT 10;

