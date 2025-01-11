-- Create View
CREATE VIEW frequently_reviewed AS
SELECT l."id",
    l."property_type",
    l."host_name",
    COUNT(r."listing_id") AS "reviews"
FROM listings AS l
INNER JOIN reviews AS r
    ON l."id" = r."listing_id"
GROUP BY l."id", l."property_type", l."host_name"
ORDER BY "reviews" DESC, l."property_type" ASC, "host_name" ASC
LIMIT 100;


/*
-- How many reviews does the most frequently reviewed property have? And who is the host of that property?
SELECT "host_name",
    "reviews"
FROM frequently_reviewed
LIMIT 1;
*/
