SELECT d.name, e.per_pupil_expenditure, se.exemplary
FROM districts AS d
INNER JOIN expenditures AS e
    ON d.id = e.district_id
INNER JOIN staff_evaluations AS se
    ON d.id = se.district_id
WHERE d.type = 'Public School District'
    AND d.state = 'MA'
    AND e.per_pupil_expenditure > (SELECT AVG(per_pupil_expenditure) FROM expenditures)
    AND se.exemplary > (SELECT AVG(exemplary) FROM staff_evaluations)
ORDER BY se.exemplary DESC, e.per_pupil_expenditure DESC;
