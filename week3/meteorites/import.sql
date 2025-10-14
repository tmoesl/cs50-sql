-- Deletes prior tables if they exist
DROP TABLE IF EXISTS meteorites;
DROP TABLE IF EXISTS meteorites_temp;

-- Import CSV into temp table
.import --csv meteorites.csv meteorites_temp

-- Set NULL for empty values
UPDATE meteorites_temp SET "mass" = NULL WHERE "mass" = "";
UPDATE meteorites_temp SET "year" = NULL WHERE "year" = "";
UPDATE meteorites_temp SET "lat" =  NULL WHERE "lat" = "";
UPDATE meteorites_temp SET "long" = NULL WHERE "long" = "";

-- Round mass, lat, and long
UPDATE meteorites_temp SET "mass" = ROUND("mass", 2);
UPDATE meteorites_temp SET "lat" = ROUND("lat", 2);
UPDATE meteorites_temp SET "long" = ROUND("long", 2);

-- Delete relict records
DELETE FROM meteorites_temp WHERE "nametype" = 'Relict';

-- Create main meteorites table
CREATE TABLE meteorites (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL CHECK ("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY("id"));

-- Insert cleaned data from temp table
INSERT INTO meteorites ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM meteorites_temp
ORDER BY "year" ASC, "name" ASC;

-- Note: Omitting the "id" column in INSERT INTO lets SQLite auto-generate a clean,
-- sequential ID starting from 1 in the meteorites table.

-- Drop temp table
DROP TABLE meteorites_temp;
