-- -----------------------------
-- PRE CHECKS
-- -----------------------------

-- Disable foreign key checks
PRAGMA foreign_keys = OFF;

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS passengers;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS checkins;

-- Re-enable foreign key checks
PRAGMA foreign_keys = ON;


-- -----------------------------
-- TABLE CREATION
-- -----------------------------

-- Creates the passengers table
CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL CHECK("age" > 0),
    PRIMARY KEY("id")
);


-- Creates the airlines table
CREATE TABLE airlines (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);


-- Creates the flights table
CREATE TABLE flights (
    "id" INTEGER,
    "flight_number" TEXT NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "departure_airport_code" TEXT NOT NULL,
    "arrival_airport_code" TEXT NOT NULL,
    "departure_datetime" TEXT NOT NULL,
    "arrival_datetime" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES airlines("id"),
    CHECK ("departure_airport_code" != "arrival_airport_code")
);


-- Creates the checkin table
CREATE TABLE checkins (
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "datetime" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES passengers("id"),
    FOREIGN KEY ("flight_id") REFERENCES flights("id")
);


-- -----------------------------
-- INSERT SAMPLE DATA
-- -----------------------------

-- Insert airlines
INSERT INTO airlines ("name", "concourse")
VALUES ('Delta', 'A'),
    ('Delta', 'B'),
    ('Delta', 'C'),
    ('Delta', 'D'),
    ('Delta', 'T');

-- Insert passengers
INSERT INTO passengers ("first_name", "last_name", "age")
VALUES
    ('Amelia', 'Earhart', 39),
    ('Charles', 'Lindbergh', 25),
    ('Bessie', 'Coleman', 34);

-- Insert flights
INSERT INTO flights ("flight_number", "airline_id", "departure_airport_code", "arrival_airport_code", "departure_datetime", "arrival_datetime")
VALUES
    ('300', 1, 'ATL', 'BOS', '2023-08-03 18:46:00', '2023-08-03 21:09:00'),
    ('450', 1, 'ATL', 'LAX', '2023-08-04 10:00:00', '2023-08-04 12:45:00'),
    ('520', 2, 'JFK', 'ORD', '2023-08-05 14:30:00', '2023-08-05 16:50:00');

-- Insert checkins
INSERT INTO checkins ("passenger_id", "flight_id", "datetime")
VALUES
    (1, 1, '2023-08-03 15:03:00'),
    (2, 2, '2023-08-04 08:00:00'),
    (3, 3, '2023-08-05 12:30:00');



