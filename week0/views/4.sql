SELECT COUNT(id) AS count
FROM views
WHERE artist = 'Hiroshige' AND english_title REGEXP 'Eastern Capital';
