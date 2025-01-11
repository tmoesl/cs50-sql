-- -----------------------------
-- PRE CHECKS
-- -----------------------------

-- Create and use the 'linkedin' database if it doesn't already exist
CREATE DATABASE IF NOT EXISTS `linkedin`;
USE `linkedin`;

-- Disable foreign key checks
SET foreign_key_checks = 0;

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS schools;
DROP TABLE IF EXISTS companies;
DROP TABLE IF EXISTS people_connections;
DROP TABLE IF EXISTS school_connections;
DROP TABLE IF EXISTS company_connections;

-- Re-enable foreign key checks
SET foreign_key_checks = 1;


-- -----------------------------
-- TABLE CREATION
-- -----------------------------

CREATE TABLE users (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(64) NOT NULL,
    `last_name` VARCHAR(64) NOT NULL,
    `username` VARCHAR(64) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE schools (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `year_founded` SMALLINT UNSIGNED NOT NULL, -- YYYY as integer, YEAR does not cover the range
    PRIMARY KEY(`id`)
);

CREATE TABLE companies (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE people_connections (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `friend_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES users (`id`),
    FOREIGN KEY(`friend_id`) REFERENCES users (`id`),
    UNIQUE(`user_id`, `friend_id`)
);

CREATE TABLE school_connections (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `school_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL, -- 'YYYY-MM-DD'
    `end_date` DATE NOT NULL, -- 'YYYY-MM-DD'
    `degree` ENUM('BA', 'MA', 'PhD') NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES users (`id`),
    FOREIGN KEY(`school_id`) REFERENCES schools (`id`),
    UNIQUE (`user_id`, `school_id`, `degree`, `start_date`)
);

CREATE TABLE company_connections (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `company_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL, -- 'YYYY-MM-DD'
    `end_date` DATE NOT NULL, -- 'YYYY-MM-DD'
    `title` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES users (`id`),
    FOREIGN KEY(`company_id`) REFERENCES companies (`id`),
    UNIQUE (`user_id`, `company_id`, `title`, `start_date`)
);

-- -----------------------------
-- INSERT SAMPLE DATA
-- -----------------------------

-- Insert users
INSERT INTO users (`first_name`, `last_name`, `username`, `password`)
VALUES
    ('CLaudine', 'Gay', 'claudine', 'password'),
    ('Reid', 'Hoffman', 'reid', 'password'),
    ('Jeff', 'Weiner', 'jeffweiner', 'password789');

-- Insert schools
INSERT INTO schools (`name`, `type`, `location`, `year_founded`)
VALUES
    ('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636),
    ('Stanford University', 'Higher Education', 'Stanford, California', 1885);

-- Insert companies
INSERT INTO companies (`name`, `industry`, `location`)
VALUES
    ('LinkedIn', 'Technology', 'Sunnyvale, California'),
    ('Google', 'Technology', 'Mountain View, California'),
    ('Goldman Sachs', 'Business', 'New York, New York');

-- Insert people connections
INSERT INTO people_connections (`user_id`, `friend_id`)
VALUES
    ((SELECT `id` FROM users WHERE `first_name` = 'Reid' AND `last_name` = 'Hoffman'),
    (SELECT `id` FROM users WHERE `first_name` = 'Jeff' AND `last_name` = 'Weiner')),

    ((SELECT `id` FROM users WHERE `first_name` = 'Jeff' AND `last_name` = 'Weiner'),
    (SELECT `id` FROM users WHERE `first_name` = 'Claudine' AND `last_name` = 'Gay'));

-- Insert school connections
INSERT INTO school_connections (`user_id`, `school_id`, `start_date`, `end_date`, `degree`)
VALUES
    ((SELECT `id` FROM users WHERE `first_name` = 'Claudine' AND `last_name` = 'Gay'),
    (SELECT `id` FROM schools WHERE name = 'Harvard University'),
    '1993-01-01', '1998-12-31', 'PhD'),

    ((SELECT `id` FROM users WHERE `first_name` = 'Jeff' AND `last_name` = 'Weiner'),
    (SELECT `id` FROM schools WHERE name = 'Stanford University'),
    '1980-09-01', '1983-12-01', 'MA');

-- Insert company connections
INSERT INTO company_connections (`user_id`, `company_id`, `start_date`, `end_date`, `title`)
VALUES
    ((SELECT `id` FROM users WHERE `first_name` = 'Reid' AND `last_name` = 'Hoffman'),
    (SELECT `id` FROM companies WHERE name = 'LinkedIn'), '2003-01-01', '2007-02-01', 'CEO and Chairman');

/*
SHOW TABLES;
DESCRIBE users;
DESCRIBE schools;
DESCRIBE companies;
DESCRIBE people_connections;
DESCRIBE school_connections;
DESCRIBE company_connections;

SHOW WARNINGS;
*/
