-- -----------------------------
-- PRE CHECKS
-- -----------------------------

-- Disable foreign key checks
PRAGMA foreign_keys = OFF;

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS schools;
DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS people_connections;
DROP TABLE IF EXISTS school_connections;
DROP TABLE IF EXISTS company_connections;

-- Re-enable foreign key checks
PRAGMA foreign_keys = ON;


-- -----------------------------
-- TABLE CREATION
-- -----------------------------

CREATE TABLE users (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "user_name" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE schools (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year_founded" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE companies (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE people_connections (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "friend_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES users("id"),
    FOREIGN KEY("friend_id") REFERENCES users("id"),
    UNIQUE ("user_id", "friend_id")
);

CREATE TABLE school_connections (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" TEXT NOT NULL,
    "end_date" TEXT,
    "degree" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES users("id"),
    FOREIGN KEY("school_id") REFERENCES schools("id"),
    UNIQUE ("user_id", "school_id", "degree", "start_date")
);

CREATE TABLE company_connections (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" TEXT NOT NULL,
    "end_date" TEXT,
    "title" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES users("id"),
    FOREIGN KEY("company_id") REFERENCES companies("id"),
    UNIQUE ("user_id", "company_id", "title", "start_date")
);

-- -----------------------------
-- INSERT SAMPLE DATA
-- -----------------------------

-- Insert users
INSERT INTO users ("first_name", "last_name", "user_name", "password")
VALUES
    ('Alan', 'Garber', 'alan', 'password'),
    ('Reid', 'Hoffman', 'reid', 'password'),
    ('Jeff', 'Weiner', 'jeffweiner', 'password789');

-- Insert schools
INSERT INTO schools ("name", "type", "location", "year_founded")
VALUES
    ('Harvard University', 'University', 'Cambridge, Massachusetts', '1636'),
    ('Stanford University', 'University', 'Stanford, California', '1885');

-- Insert companies
INSERT INTO companies ("name", "industry", "location")
VALUES
    ('LinkedIn', 'Technology', 'Sunnyvale, California'),
    ('Google', 'Technology', 'Mountain View, California'),
    ('Goldman Sachs', 'Finance', 'New York, New York');

-- Insert people connections
INSERT INTO people_connections ("user_id", "friend_id")
VALUES
    ((SELECT id FROM users WHERE "first_name" = 'Reid' AND "last_name" = 'Hoffman'),
    (SELECT id FROM users WHERE "first_name" = 'Jeff' AND "last_name" = 'Weiner')),

    ((SELECT id FROM users WHERE "first_name" = 'Jeff' AND "last_name" = 'Weiner'),
    (SELECT id FROM users WHERE "first_name" = 'Alan' AND "last_name" = 'Garber'));

-- Insert school connections
INSERT INTO school_connections ("user_id", "school_id", "start_date", "end_date", "degree")
VALUES
    ((SELECT "id" FROM users WHERE "first_name" = 'Alan' AND "last_name" = 'Garber'),
    (SELECT "id" FROM schools WHERE name = 'Harvard University'),
    '1973-09-01', '1976-06-01', 'BA'),

    ((SELECT "id" FROM users WHERE "first_name" = 'Jeff' AND "last_name" = 'Weiner'),
    (SELECT "id" FROM schools WHERE name = 'Stanford University'),
    '1980-09-01', '1983-12-01', 'MA');

-- Insert company connections
INSERT INTO company_connections ("user_id", "company_id", "start_date", "end_date", "title")
VALUES
    ((SELECT "id" FROM users WHERE "first_name" = 'Reid' AND "last_name" = 'Hoffman'),
    (SELECT "id" FROM companies WHERE name = 'LinkedIn'), '2003-01-01', '2007-02-01', 'CEO and Chairman');
