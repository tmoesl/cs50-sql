SELECT pl.first_name,
    pl.last_name,
    s.salary,
    pf.year,
    pf.HR
FROM players AS pl
INNER JOIN salaries AS s
    ON pl.id = s.player_id
INNER JOIN performances AS pf
    ON pl.id = pf.player_id AND s.year = pf.year
ORDER BY pl.id ASC,
    pf.year DESC,
    pf.HR DESC,
    s.salary DESC;
