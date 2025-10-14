SELECT first_name, last_name, birth_country,
debut AS debut_game, final_game
FROM players
WHERE birth_year BETWEEN '1980' AND '2000'
AND birth_country = 'USA'
ORDER BY birth_year ASC
LIMIT 50;
