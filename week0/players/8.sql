SELECT ROUND(AVG(height),2) AS average_height,
ROUND(AVG(weight),2) AS average_weight
FROM players
WHERE debut >= '2000-01-01';
