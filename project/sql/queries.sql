-- -----------------------------
-- INSERT SAMPLE DATA
-- -----------------------------

-- Data Sources (Nov 2024)
-- Note: While trails and parks are sourced authentically from AllTrails, activities and hikers were randomly created.

-- https://www.alltrails.com/us/california/yosemite-valley
-- https://www.alltrails.com/parks/us/utah/grand-canyon-national-park
-- https://www.alltrails.com/parks/us/utah/bryce-canyon-national-park
-- https://www.alltrails.com/parks/us/utah/zion-national-park


-- Insert hikers into the `hikers` table.
INSERT INTO `hikers` (`first_name`, `last_name`, `date_of_birth`, `email`, `experience_level`)
VALUES
    ('John', 'Smith', '1990-03-15', 'john.smith@gmail.com', 'Intermediate'),
    ('Emily', 'Johnson', '1985-07-22', 'emily.johnson@gmail.com', 'Advanced'),
    ('Michael', 'Williams', '1992-05-11', 'michael.williams@gmail.com', 'Beginner'),
    ('Sarah', 'Brown', '1988-11-03', 'sarah.brown@gmail.com', 'Professional'),
    ('David', 'Jones', '1995-01-19', 'david.jones@gmail.com', 'Intermediate'),
    ('Emma', 'Garcia', '1980-06-14', 'emma.garcia@gmail.com', 'Advanced'),
    ('James', 'Martinez', '1997-02-28', 'james.martinez@gmail.com', 'Beginner'),
    ('Olivia', 'Hernandez', '1986-08-09', 'olivia.hernandez@gmail.com', 'Professional'),
    ('Daniel', 'Lopez', '1993-12-25', 'daniel.lopez@gmail.com', 'Intermediate'),
    ('Sophia', 'Gonzalez', '1991-09-30', 'sophia.gonzalez@gmail.com', 'Advanced'),
    ('Matthew', 'Clark', '1987-04-12', 'matthew.clark@gmail.com', 'Beginner'),
    ('Isabella', 'Lewis', '1990-10-05', 'isabella.lewis@gmail.com', 'Professional'),
    ('Joshua', 'Walker', '1998-03-22', 'joshua.walker@gmail.com', 'Intermediate'),
    ('Mia', 'Hall', '1989-07-18', 'mia.hall@gmail.com', 'Advanced'),
    ('Ethan', 'Allen', '1994-02-06', 'ethan.allen@gmail.com', 'Beginner'),
    ('Ava', 'Young', '1983-05-23', 'ava.young@gmail.com', 'Professional'),
    ('Alexander', 'King', '1996-11-15', 'alexander.king@gmail.com', 'Intermediate'),
    ('Charlotte', 'Wright', '1992-08-28', 'charlotte.wright@gmail.com', 'Advanced'),
    ('William', 'Scott', '1981-12-10', 'william.scott@gmail.com', 'Professional'),
    ('Amelia', 'Adams', '1984-06-02', 'amelia.adams@gmail.com', 'Beginner');

-- Insert national parks into the `national_parks` table. [Area in square kilometers]
INSERT INTO `national_parks` (`name`, `country`, `state`, `area`, `established`)
VALUES
    ('Yosemite National Park', 'USA', 'CA', 3074.90, 1890),
    ('Grand Canyon National Park', 'USA', 'AZ', 4931.04, 1919),
    ('Bryce Canyon National Park', 'USA', 'UT', 145.04, 1928),
    ('Zion National Park', 'USA', 'UT', 593.26, 1919);

-- Insert Yosemite trails into the `trails` table.
INSERT INTO `trails` (`name`, `park_id`, `length`, `difficulty`, `elevation_gain`, `description`)
VALUES
    ('Vernal and Nevada Falls via Mist Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 10.3, 'Hard', 610, "Hike to two breathtaking waterfalls along some of Yosemite Valley's most popular hiking trails."),
    ('Upper Yosemite Falls Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 10.6, 'Hard', 975, 'Enjoy the incredible views looking down from the top of Yosemite Falls, the tallest waterfall in the continental US.'),
    ('Half Dome via the John Muir Trail (JMT)', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 26.6, 'Hard', 1463, 'Half Dome is a serious endurance hike taking you 1463 meters above the Yosemite Valley to spectacular views of Vernal and Nevada Falls, Liberty Cap, the Yosemite Valley, and the High Sierra.'),
    ('Vernal Falls', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 5.0, 'Hard', 300, 'Vernal Falls is one of the most popular destinations in Yosemite and for good reason! This trail follows the Mist Trail up a short but steep paved path.'),
    ('Lower Yosemite Falls Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 1.9, 'Easy', 15, 'A quick stroll to see Yosemite Falls, the tallest waterfall in Northern America and 5th in the world, crash down on the rocks below.'),
    ('Vernal Falls and Clark Point via Mist and John Muir Loop', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 7.2, 'Hard', 457, 'This trail begins at Happy Isles and follows the John Muir Trail to the Mist Trail and Vernal Falls.'),
    ('Mirror Lake Loop', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 8.0, 'Easy', 30, "With a fresh perspective looking up at Half Dome directly from its base, you'll be rewarded with views of Tenaya Canyon, Mount Watkins, and Washington Column."),
    ('Columbia Rock Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 3.5, 'Moderate', 300, 'This is a short steep hike to Columbia Rock with sweeping views of Yosemite Valley along the Yosemite Upper Falls Trail.'),
    ('Nevada Fall via the Mist Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 9.2, 'Hard', 610, 'This hike takes you on one of the most popular trails in Yosemite National Park - the Mist Trail.'),
    ('Mirror Lake via Valley Loop Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Yosemite National Park'), 7.1, 'Moderate', 30, 'The Mirror Lake via Valley Loop Trail is an easy loop in Yosemite National Park, with the pathway around Mirror Lake being a must-see for its beautiful reflections of Half Dome.');

-- Insert Grand Canyon trails into the `trails` table.
INSERT INTO `trails` (`name`, `park_id`, `length`, `difficulty`, `elevation_gain`, `description`)
VALUES
    ('South Kaibab Trail to Ooh Aah Point', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 2.9, 'Moderate', 209, 'A short hike offering stunning panoramic views of the Grand Canyon.'),
    ('Bright Angel Trail to Indian Garden', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 15.3, 'Hard', 920, 'A challenging trail descending into the canyon with access to water and shade at Indian Garden.'),
    ('Rim Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 20.9, 'Easy', 350, 'A mostly paved trail along the canyon rim with numerous viewpoints.'),
    ('South Kaibab Trail to Skeleton Point', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 9.3, 'Hard', 610, 'A steep trail with expansive views, leading to a point overlooking the Colorado River.'),
    ('Bright Angel Trail to Bright Angel Campground', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 30.6, 'Hard', 1340, 'A strenuous hike descending to the Colorado River and Phantom Ranch.'),
    ('Hermit Trail to Dripping Springs', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 11.3, 'Hard', 500, 'A less crowded trail leading to a spring with seasonal water flow.'),
    ('Grandview Trail to Horseshoe Mesa', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 9.7, 'Hard', 740, 'A steep and rugged trail offering solitude and historic mining sites.'),
    ('North Kaibab Trail to Roaring Springs', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 14.8, 'Hard', 1520, 'A challenging trail on the North Rim leading to a perennial spring.'),
    ('Tanner Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 14.5, 'Hard', 1400, 'A remote and difficult trail with expansive views and access to the Colorado River.'),
    ('South Kaibab and Bright Angel Trail Loop', (SELECT `id` FROM `national_parks` WHERE `name` = 'Grand Canyon National Park'), 27.4, 'Hard', 1340, 'A popular rim-to-rim loop combining two iconic trails.');

-- Insert Bryce Canyon trails into the `trails` table.
INSERT INTO `trails` (`name`, `park_id`, `length`, `difficulty`, `elevation_gain`, `description`)
VALUES
    ("Navajo Loop and Queen's Garden Trail", (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 4.6, 'Moderate', 190, 'A combination of two popular trails showcasing hoodoos and unique rock formations.'),
    ('Fairyland Loop Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 12.9, 'Hard', 520, 'A longer trail offering solitude and views of lesser-visited areas of the park.'),
    ('Peekaboo Loop Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 8.8, 'Moderate', 430, 'A scenic loop passing through the heart of Bryce Amphitheater.'),
    ('Bryce Point to Sunrise Point via Rim Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 8.0, 'Easy', 150, 'A relatively flat trail along the rim with continuous panoramic views.'),
    ('Mossy Cave Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 1.5, 'Easy', 30, 'A short trail leading to a mossy overhang and a small waterfall.'),
    ('Tower Bridge via Fairyland Loop', (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 5.8, 'Moderate', 240, 'A hike to a natural rock formation resembling a bridge.'),
    ('Swamp Canyon Loop', (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 7.8, 'Moderate', 300, 'A less-traveled loop offering views of hoodoos and forested areas.'),
    ('Sheep Creek and Swamp Canyon Loop', (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 6.9, 'Moderate', 260, 'A loop combining two trails with diverse scenery.'),
    ('Hat Shop via Under-the-Rim Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 6.4, 'Hard', 400, 'A trail leading to unique rock formations known as the Hat Shop.'),
    ('Bristlecone Loop Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Bryce Canyon National Park'), 1.6, 'Easy', 60, 'A short loop at high elevation with ancient bristlecone pines.');

-- Insert Zion trails into the `trails` table.
INSERT INTO `trails` (`name`, `park_id`, `length`, `difficulty`, `elevation_gain`, `description`)
VALUES
    ('Angels Landing Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 7.2, 'Hard', 453, 'A strenuous trail with steep drop-offs and a narrow ridge leading to a panoramic viewpoint.'),
    ('The Narrows Riverside Walk', (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 3.1, 'Easy', 30, 'A paved trail leading to the entrance of The Narrows, a popular slot canyon.'),
    ('Emerald Pools Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 4.8, 'Moderate', 150, 'A trail leading to lower, middle, and upper pools with waterfalls.'),
    ('Observation Point via East Mesa Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 11.3, 'Moderate', 210, 'A less strenuous route to Observation Point with expansive views.'),
    ('Canyon Overlook Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 1.6, 'Easy', 50, 'A short trail to a viewpoint overlooking Pine Creek Canyon.'),
    ('Hidden Canyon Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 4.0, 'Hard', 300, 'A steep trail with chains leading to a hanging canyon.'),
    ('West Rim Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 25.7, 'Hard', 1070, 'A long trail offering diverse scenery and access to Angels Landing.'),
    ("Pa'rus Trail", (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 5.6, 'Easy', 50, 'A paved, accessible trail along the Virgin River.'),
    ('Watchman Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 5.1, 'Moderate', 160, 'A trail leading to a viewpoint of the Watchman and the valley.'),
    ('Kolob Arch via La Verkin Creek Trail', (SELECT `id` FROM `national_parks` WHERE `name` = 'Zion National Park'), 22.5, 'Hard', 430, "A long trail to one of the world's largest natural arches.");

-- Insert hikes into the `hikes` table.
INSERT INTO `hikes` (`trail_id`, `hiker_id`, `date`, `conditions`)
VALUES
    (2, 5, '2022-01-10', 'Sunny'),
    (8, 12, '2022-02-14', 'Cloudy'),
    (19, 3, '2022-03-18', 'Rainy'),
    (14, 7, '2022-04-22', 'Sunny'),
    (25, 10, '2022-05-27', 'Rainy'),
    (31, 6, '2022-06-05', 'Cloudy'),
    (11, 2, '2022-07-09', 'Sunny'),
    (17, 15, '2022-08-13', 'Rainy'),
    (24, 19, '2022-09-17', 'Sunny'),
    (29, 4, '2022-10-21', 'Cloudy'),
    (16, 13, '2022-11-25', 'Snowy'),
    (7, 8, '2022-12-05', 'Sunny'),
    (9, 14, '2022-01-22', 'Cloudy'),
    (20, 11, '2022-02-25', 'Rainy'),
    (28, 16, '2022-03-30', 'Sunny'),
    (4, 1, '2022-04-11', 'Rainy'),
    (10, 18, '2022-05-16', 'Cloudy'),
    (22, 9, '2022-06-20', 'Snowy'),
    (6, 20, '2022-07-15', 'Sunny'),
    (15, 17, '2022-08-19', 'Cloudy'),
    (5, 15, '2023-03-10', 'Sunny'),
    (18, 8, '2023-04-22', 'Cloudy'),
    (20, 12, '2023-05-14', 'Rainy'),
    (25, 3, '2023-06-11', 'Sunny'),
    (30, 6, '2023-07-19', 'Rainy'),
    (35, 10, '2023-08-21', 'Snowy'),
    (12, 7, '2023-09-05', 'Cloudy'),
    (17, 4, '2023-10-01', 'Sunny'),
    (22, 19, '2023-11-09', 'Rainy'),
    (28, 14, '2023-12-15', 'Snowy'),
    (7, 11, '2023-02-17', 'Sunny'),
    (19, 2, '2023-03-22', 'Cloudy'),
    (23, 18, '2023-04-15', 'Rainy'),
    (6, 9, '2023-05-20', 'Sunny'),
    (9, 16, '2023-06-30', 'Cloudy'),
    (3, 13, '2023-07-12', 'Sunny'),
    (14, 20, '2023-08-08', 'Rainy'),
    (11, 1, '2023-09-14', 'Snowy'),
    (21, 17, '2023-10-03', 'Cloudy'),
    (26, 5, '2023-11-18', 'Sunny'),
    (8, 10, '2024-08-17', 'Sunny'),
    (1, 16, '2024-08-22', 'Sunny'),
    (4, 2, '2024-10-24', 'Cloudy'),
    (6, 1, '2024-10-05', 'Cloudy'),
    (10, 19, '2024-10-10', 'Sunny'),
    (15, 4, '2024-10-15', 'Sunny'),
    (19, 17, '2024-08-17', 'Rainy'),
    (14, 3, '2024-10-26', 'Snowy'),
    (13, 18, '2024-08-19', 'Rainy'),
    (12, 2, '2024-09-26', 'Sunny'),
    (23, 9, '2024-08-25', 'Snowy'),
    (30, 7, '2024-11-10', 'Rainy'),
    (25, 17, '2024-08-14', 'Rainy'),
    (27, 14, '2024-09-07', 'Sunny'),
    (22, 13, '2024-09-21', 'Sunny'),
    (35, 6, '2024-11-11', 'Sunny'),
    (40, 5, '2024-11-02', 'Sunny'),
    (34, 13, '2024-08-26', 'Snowy'),
    (31, 2, '2024-10-26', 'Sunny'),
    (33, 3, '2024-11-10', 'Rainy');

-- Insert reviews into the `reviews` table.
INSERT INTO `reviews` (`trail_id`, `hiker_id`, `rating`, `date`)
VALUES
    (2, 5, 4, '2022-01-15'),
    (8, 12, 5, '2022-02-19'),
    (19, 3, 3, '2022-03-23'),
    (14, 7, 4, '2022-04-27'),
    (25, 10, 5, '2022-06-01'),
    (31, 6, 2, '2022-06-10'),
    (11, 2, 4, '2022-07-14'),
    (17, 15, 5, '2022-08-18'),
    (24, 19, 4, '2022-09-22'),
    (29, 4, 3, '2022-10-26'),
    (16, 13, 5, '2022-11-30'),
    (7, 8, 4, '2022-12-10'),
    (9, 14, 5, '2022-01-27'),
    (20, 11, 4, '2022-03-02'),
    (28, 16, 5, '2022-04-04'),
    (4, 1, 3, '2022-04-16'),
    (10, 18, 4, '2022-05-21'),
    (22, 9, 5, '2022-06-25'),
    (6, 20, 4, '2022-07-20'),
    (15, 17, 5, '2022-08-24'),
    (5, 15, 4, '2023-03-15'),
    (18, 8, 5, '2023-04-27'),
    (20, 12, 3, '2023-05-19'),
    (25, 3, 4, '2023-06-16'),
    (30, 6, 2, '2023-07-24'),
    (35, 10, 5, '2023-08-26'),
    (12, 7, 3, '2023-09-10'),
    (17, 4, 5, '2023-10-06'),
    (22, 19, 4, '2023-11-14'),
    (28, 14, 3, '2023-12-20'),
    (7, 11, 5, '2023-02-22'),
    (19, 2, 4, '2023-03-27'),
    (23, 18, 5, '2023-04-20'),
    (6, 9, 3, '2023-05-25'),
    (9, 16, 4, '2023-07-05'),
    (3, 13, 5, '2023-07-17'),
    (14, 20, 4, '2023-08-13'),
    (11, 1, 3, '2023-09-19'),
    (21, 17, 5, '2023-10-08'),
    (26, 5, 4, '2023-11-23'),
    (8, 10, 5, '2024-08-21'),
    (1, 16, 3, '2024-08-24'),
    (4, 2, 5, '2024-10-25'),
    (6, 1, 1, '2024-10-13'),
    (10, 19, 5, '2024-10-14'),
    (15, 4, 2, '2024-10-25'),
    (19, 17, 1, '2024-08-21'),
    (14, 3, 5, '2024-11-05'),
    (13, 18, 3, '2024-08-23'),
    (12, 2, 5, '2024-10-05'),
    (23, 9, 4, '2024-08-31'),
    (30, 7, 4, '2024-11-18'),
    (25, 17, 3, '2024-08-21'),
    (27, 14, 4, '2024-09-16'),
    (22, 13, 3, '2024-09-26'),
    (35, 6, 1, '2024-11-16'),
    (40, 5, 2, '2024-11-08'),
    (34, 13, 1, '2024-08-28'),
    (31, 2, 2, '2024-11-02'),
    (33, 3, 3, '2024-11-14');


-- -----------------------------
-- QUERIES
-- -----------------------------

-- Retrieve all hikes completed by a specific hiker based on their full name.
SELECT
    `hike_id`,
    `trail_name`,
    `hiker_first_name`,
    `hiker_last_name`,
    `hike_date`,
    `hike_conditions`
FROM `hiker_activity`
WHERE `hiker_id` = (
    SELECT `id`
    FROM `hikers`
    WHERE `first_name` = 'John' AND `last_name` = 'Smith'
    );

-- Retrieve the most recent hike date for each hiker.
SELECT
    `hiker_id`,
    `hiker_first_name`,
    `hiker_last_name`,
    MAX(`hike_date`) AS `last_hike`
FROM `hiker_activity`
GROUP BY `hiker_id`, `hiker_first_name`, `hiker_last_name`
;

-- Retrieve the total number of hikes completed by each hiker, ordered by hike count.
SELECT
    `hiker_id`,
    `hiker_first_name`,
    `hiker_last_name`,
    COUNT(`hike_id`) AS `total_hikes`
FROM `hiker_activity`
GROUP BY `hiker_id`, `hiker_first_name`, `hiker_last_name`
ORDER BY `total_hikes` DESC
;

-- Retrieve the total number of hikes per year, ordered by hike count.
SELECT
    YEAR(`hike_date`) AS `year`,
    COUNT(`hike_id`) AS `total_hikes`
FROM `hiker_activity`
GROUP BY YEAR(`hike_date`)
ORDER BY `total_hikes` DESC
;

-- Retrieve all trails located in a specific national park.
SELECT
    `trail_id`,
    `trail_name`,
    `trail_length`,
    `trail_difficulty`,
    `trail_elevation_gain`
FROM `national_park_trails_details`
WHERE `park_name` = 'Yosemite National Park'
;

-- Retrieve all trails in a specific national park filtered by difficulty level.
SELECT
    `trail_id`,
    `trail_name`,
    `trail_length`,
    `trail_elevation_gain`
FROM `national_park_trails_details`
WHERE `park_name` = 'Yosemite National Park'
    AND `trail_difficulty` = 'Hard'
;

-- Retrieve all reviews for a specific trail based on its name.
SELECT
    `hiker_id`,
    `hiker_first_name`,
    `hiker_last_name`,
    `review_rating`,
    `review_date`
FROM `trail_reviews_details`
WHERE `trail_name` = 'Emerald Pools Trail'
;

-- Retrieve the 10 most popular trails based on average rating and review count.
SELECT
    `trail_id`,
    `trail_name`,
    `park_name`,
    AVG(`review_rating`) AS `avg_review_rating`,
    COUNT(`review_rating`) AS `review_count`
FROM `trail_reviews_details`
GROUP BY `trail_id`
ORDER BY `avg_review_rating` DESC, `review_count` DESC
LIMIT 10
;

-- Retrieve all hikers based on their experience level.​
SELECT
    `id` AS `hiker_id`,
    `first_name` AS `hiker_first_name`,
    `last_name` AS `hiker_last_name`,
    `date_of_birth` AS `hiker_date_of_birth`,
    `experience_level` AS `hiker_experience_level`
FROM `hikers`
WHERE `experience_level` = 'Advanced'
;

-- -----------------------------
-- -----------------------------
