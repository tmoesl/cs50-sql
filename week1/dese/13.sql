SELECT s.name AS school_name,
d.name AS district_name,
gr.dropped AS percentage_students_drop
FROM schools AS s
INNER JOIN districts AS d
    ON s.district_id = d.id
INNER JOIN graduation_rates AS gr
    ON s.id = gr. school_id
WHERE gr.dropped > (SELECT AVG(dropped) FROM graduation_rates)
ORDER BY gr.dropped DESC;
