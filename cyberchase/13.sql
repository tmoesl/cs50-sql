SELECT season, episode_in_season, title, topic
FROM episodes
WHERE air_date BETWEEN '2016-01-01' AND '2023-12-31' AND topic IS NOT NULL;

