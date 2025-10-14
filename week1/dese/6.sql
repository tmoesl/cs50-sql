SELECT s.name
FROM schools AS s
INNER JOIN graduation_rates AS gr
    ON s.id = gr.school_id
WHERE gr.graduated = 100

/*
SELECT name
FROM schools
WHERE id IN (
    SELECT school_id
    FROM graduation_rates
    WHERE graduated = 100);
*/
