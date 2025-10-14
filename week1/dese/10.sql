SELECT d.name, e.per_pupil_expenditure
FROM districts AS d
INNER JOIN expenditures AS e
    ON d.id = e.district_id
WHERE d.state = 'MA' and d.type = 'Public School District'
ORDER BY e.per_pupil_expenditure DESC
LIMIT 10;

/*
SELECT name,(
    SELECT per_pupil_expenditure
    FROM expenditures AS e
    WHERE e.district_id = d.id) AS per_pupil_expenditure
FROM districts AS d
WHERE d.state = 'MA'
    AND d.type = 'Public School District'
    AND (SELECT per_pupil_expenditure
    FROM expenditures AS e
    WHERE e.district_id = d.id) IS NOT NULL
ORDER BY per_pupil_expenditure DESC
LIMIT 10;
*/
