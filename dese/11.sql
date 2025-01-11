SELECT s.name, e.per_pupil_expenditure, gr.graduated
FROM schools AS s
INNER JOIN graduation_rates AS gr
    ON s.id = gr.school_id
INNER JOIN expenditures AS e
    ON s.district_id = e.district_id
ORDER BY e.per_pupil_expenditure DESC, s.name ASC;

/*
SELECT s.name,
    (SELECT per_pupil_expenditure
    FROM expenditures AS e
    WHERE s.district_id = e.district_id) AS per_pupil_expenditure,
    (SELECT graduated
    FROM graduation_rates AS gr
    WHERE s.id = gr.school_id) AS graduated
FROM schools AS s
WHERE (SELECT e.per_pupil_expenditure
       FROM expenditures AS e
       WHERE e.district_id = s.district_id) IS NOT NULL
  AND (SELECT gr.graduated
       FROM graduation_rates AS gr
       WHERE gr.school_id = s.id) IS NOT NULL
ORDER BY per_pupil_expenditure DESC, s.name ASC;
*/
