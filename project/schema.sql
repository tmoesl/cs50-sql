-- -----------------------------
-- PRE CHECKS
-- -----------------------------

-- Creates and uses `trailhub` database.
CREATE DATABASE IF NOT EXISTS `trailhub`;
USE `trailhub`;

-- Disable foreign key checks.
SET foreign_key_checks = 0;

-- Drop tables if they exist.
DROP TABLE IF EXISTS `hikers`;
DROP TABLE IF EXISTS `national_parks`;
DROP TABLE IF EXISTS `trails`;
DROP TABLE IF EXISTS `permits`;
DROP TABLE IF EXISTS `hikes`;
DROP TABLE IF EXISTS `reviews`;

-- Drop views if they exist.
DROP VIEW IF EXISTS `hiker_activity`;
DROP VIEW IF EXISTS `trail_reviews_details`;
DROP VIEW IF EXISTS `national_park_trails_details`;

-- Re-enable foreign key checks.
SET foreign_key_checks = 1;


-- -----------------------------
-- TABLE CREATION
-- -----------------------------

-- Hikers Table | Stores details about hikers, including personal information and experience level.
CREATE TABLE `hikers` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(64) NOT NULL,
    `last_name` VARCHAR(64) NOT NULL,
    `date_of_birth` DATE NOT NULL,
    `email` VARCHAR(128) UNIQUE,
    `experience_level` ENUM('Beginner', 'Intermediate', 'Advanced', 'Professional') NOT NULL,
    PRIMARY KEY(`id`)
);

-- National Parks Table | Defines national parks, including name, location, area, and establishment year.
CREATE TABLE `national_parks` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `country` ENUM('USA'),
    `state` ENUM('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY') NOT NULL,
    `area` DOUBLE NOT NULL, -- Unit: square kilometers
    `established` SMALLINT NOT NULL, -- Allows values before 1901
    PRIMARY KEY(`id`),
    UNIQUE(`name`, `country`, `state`)
);

-- Trails Table | Lists trails within parks, including length, difficulty, elevation gain, and descriptions.
CREATE TABLE `trails` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL,
    `park_id` INT UNSIGNED NOT NULL,
    `length` DECIMAL(5,2) NOT NULL, -- Unit: kilometers
    `difficulty` ENUM('Easy', 'Moderate', 'Hard') NOT NULL,
    `elevation_gain` SMALLINT UNSIGNED NOT NULL, -- Unit: meters
    `description` TEXT,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`park_id`) REFERENCES `national_parks`(`id`) ON DELETE CASCADE,
    UNIQUE(`name`, `park_id`)
);

-- Hikes Table | Records hiking activities, linking hikers to trails with conditions and dates.
CREATE TABLE `hikes` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `trail_id` INT UNSIGNED NOT NULL,
    `hiker_id` INT UNSIGNED NOT NULL,
    `date` DATE NOT NULL,
    `conditions` ENUM('Sunny', 'Cloudy', 'Rainy', 'Snowy') NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`trail_id`) REFERENCES `trails`(`id`) ON DELETE CASCADE,
    FOREIGN KEY(`hiker_id`) REFERENCES `hikers`(`id`) ON DELETE CASCADE
);

-- Reviews Table | Captures trail reviews with ratings and review dates from hikers.
CREATE TABLE `reviews` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `trail_id` INT UNSIGNED NOT NULL,
    `hiker_id` INT UNSIGNED NOT NULL,
    `rating` TINYINT UNSIGNED NOT NULL CHECK (`rating` BETWEEN 1 AND 5),
    `date` DATE NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`trail_id`) REFERENCES `trails`(`id`) ON DELETE CASCADE,
    FOREIGN KEY(`hiker_id`) REFERENCES `hikers`(`id`) ON DELETE CASCADE,
    UNIQUE(`hiker_id`, `trail_id`)
);


-- -----------------------------
-- INDEX CREATION
-- -----------------------------

-- Hikers Table
CREATE INDEX `idx_hikers_full_name` ON `hikers`(`first_name`, `last_name`);

-- National Parks Table
CREATE INDEX `idx_national_parks_name` ON `national_parks`(`name`);

-- Trails Table
CREATE INDEX `idx_trails_park_id` ON `trails`(`park_id`);

-- Hikes Table
CREATE INDEX `idx_hikes_hiker_id` ON `hikes`(`hiker_id`);
CREATE INDEX `idx_hikes_trail_id` ON `hikes`(`trail_id`);

-- Reviews Table
CREATE INDEX `idx_reviews_hiker_id` ON `reviews`(`hiker_id`);
CREATE INDEX `idx_reviews_trail_id` ON `reviews`(`trail_id`);


-- -----------------------------
-- VIEW CREATION
-- -----------------------------

-- Hiker Activity View | Consolidates information about hikers and their hikes, including trail details.
CREATE VIEW `hiker_activity` AS
SELECT
    `h`.`id` AS `hike_id`,
    `hk`.`id` AS `hiker_id`,
    `hk`.`first_name` AS `hiker_first_name`,
    `hk`.`last_name` AS `hiker_last_name`,
    `h`.`date` AS `hike_date`,
    `h`.`conditions` AS `hike_conditions`,
    `t`.`id` AS `trail_id`,
    `t`.`name` AS `trail_name`
FROM `hikes` AS `h`
INNER JOIN `trails` AS `t`
    ON `h`.`trail_id` = `t`.`id`
INNER JOIN `hikers` AS `hk`
    ON `h`.`hiker_id` = `hk`.`id`;

-- Trail Reviews Details View | Combines review details with information about trails, parks, and hikers.
CREATE VIEW `trail_reviews_details` AS
SELECT
    `r`.`id` AS `review_id`,
    `r`.`trail_id` AS `trail_id`,
    `t`.`name` AS `trail_name`,
    `t`.`park_id`,
    `np`.`name` AS `park_name`,
    `r`.`hiker_id` AS `hiker_id`,
    `hk`.`first_name` AS `hiker_first_name`,
    `hk`.`last_name` AS `hiker_last_name`,
    `r`.`rating` AS `review_rating`,
    `r`.`date` AS `review_date`
FROM `reviews` r
INNER JOIN `hikers` AS `hk`
    ON `r`.`hiker_id` = `hk`.`id`
INNER JOIN `trails` AS `t`
    ON `r`.`trail_id` = `t`.`id`
INNER JOIN `national_parks` AS `np`
    ON `t`.`park_id` = `np`.`id`;

-- National Park Trails Details View | Lists trails and their details within each national park.​
CREATE VIEW `national_park_trails_details` AS
SELECT
    `t`.`id` AS `trail_id`,
    `t`.`name` AS `trail_name`,
    `t`.`length` AS `trail_length`,
    `t`.`difficulty` AS `trail_difficulty`,
    `t`.`elevation_gain` AS `trail_elevation_gain`,
    `np`.`id` AS `park_id`,
    `np`.`name` AS `park_name`,
    `np`.`state` AS `park_state`
FROM `trails` AS `t`
INNER JOIN `national_parks` AS `np`
    ON t.`park_id` = `np`.`id`;


-- -----------------------------
-- DEBUGGING / VERIFICATION
-- -----------------------------

/*
SHOW DATABASES;
SHOW TABLES;
SHOW CREATE TABLE `hikers`\G
SHOW CREATE TABLE `national_parks`\G
SHOW CREATE TABLE `trails`\G
SHOW CREATE TABLE `hikes`\G
SHOW CREATE TABLE `reviews`\G
*/

-- -----------------------------
-- -----------------------------
