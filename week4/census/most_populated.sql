-- Create View
CREATE VIEW most_populated AS
SELECT
    "district",
    SUM("families") AS "families",
    SUM("households") AS "households",
    SUM("population") AS "population",
    SUM("male") AS "male",
    SUM("female") AS "female"
FROM census
GROUP BY "district"
ORDER BY "population" DESC;


/*
-- Which district has the highest population? And how many households are in that district?
SELECT "district",
    "households"
FROM most_populated
ORDER BY "population" DESC
LIMIT 1;
*/
