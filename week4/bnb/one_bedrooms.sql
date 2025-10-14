-- Create View
CREATE VIEW one_bedrooms AS
SELECT "id",
    "property_type",
    "host_name",
    "accommodates"
FROM listings
WHERE "bedrooms" = 1;


/*
-- How many one-bedroom listings are there?
SELECT COUNT("property_type") AS "count"
FROM one_bedrooms;

-- And how many can accommodate at least 4 guests?
SELECT COUNT("property_type") AS "count"
FROM one_bedrooms
WHERE "accommodates" >= 4;
*/
