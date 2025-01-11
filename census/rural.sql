-- Create View
CREATE VIEW rural AS
SELECT "id",
    "district",
    "locality",
    "families",
    "households",
    "population",
    "male",
    "female"
FROM census
WHERE "locality" LIKE '%Rural%';


/*
-- How many rural districts are there?
SELECT COUNT("district")
FROM rural;

-- How many families live in rural districts?
SELECT SUM("families") AS "families"
FROM rural;
*/
