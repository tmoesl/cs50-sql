-- Create View
CREATE VIEW by_district AS
SELECT
    "district",
    SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "male",
    SUM("female") AS "female"
FROM census
GROUP BY "district";


/*
-- Which district has the second lowest number of families? And how many does it have?
SELECT "district",
    "families"
FROM by_district
ORDER BY families ASC
LIMIT 1 OFFSET 1;

-- Approach via CTE and window functions
WITH ranked_by_families AS (
    SELECT "district",
        "families",
        ROW_NUMBER() OVER (ORDER BY "families") AS rn
    FROM by_district
)

SELECT "district",
    "families"
FROM ranked_by_families
WHERE rn = 2;
*/
