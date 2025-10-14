SELECT d.name
FROM districts AS d
INNER JOIN expenditures AS e
    ON d.id = e.district_id
ORDER BY e.pupils ASC
LIMIT 1;

/*
SELECT name
FROM districts
WHERE id = (
    SELECT district_id
    FROM expenditures
    ORDER BY pupils ASC
    LIMIT 1);
*/
