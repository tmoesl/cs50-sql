-- Create View
CREATE VIEW available AS
SELECT l."id",
    l."property_type",
    l."host_name",
    a."date"
FROM listings AS l
INNER JOIN availabilities AS a
    ON l."id" = a."listing_id"
WHERE a."available" = 'TRUE';


/*
-- How many listings have availability for December 31st, 2023 (i.e., “2023-12-31”)?
SELECT COUNT("id") FROM available
WHERE "date" = '2023-12-31';

-- How many of those are available on any type of boat?
SELECT COUNT("id") FROM available
WHERE "date" = '2023-12-31'
    AND "property_type" LIKE '%boat%';
*/
