SELECT COUNT(id) AS count
FROM views
WHERE brightness > 0.5 AND contrast > 0.6
ORDER BY brightness;
