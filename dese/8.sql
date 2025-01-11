SELECT d.name, e.pupils
FROM districts AS d
INNER JOIN expenditures AS e
    ON d.id = e.district_id;

/*
SELECT d.name,
    (SELECT e.pupils FROM expenditures AS e
    WHERE e.district_id = d.id) AS pupils
FROM districts AS d
WHERE d.id IN (
    SELECT district_id
    FROM expenditures);
*/
