-- Create View
CREATE VIEW no_descriptions AS
SELECT "id",
    "property_type",
    "host_name",
    "accommodates",
    "bedrooms"
FROM listings;


/*
-- How many listings are there in total?
SELECT COUNT("id")
FROM no_descriptions;
*/
