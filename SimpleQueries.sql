-- SIMPLE QUERIES
SELECT * FROM song;
SELECT * FROM listener;

SELECT * FROM "user" WHERE username LIKE 'r%';
SELECT * FROM listener WHERE firstname='Roman' AND lastname='Doskoch';
SELECT MIN(date_of_birth) FROM listener;
SELECT * FROM listener ORDER BY date_of_birth LIMIT 1;

SELECT * FROM "user" ORDER BY username DESC;

SELECT * FROM subscription WHERE price > 10;
SELECT * FROM playlist WHERE description IS NULL;

SELECT title, release_date FROM album ORDER BY release_date;
SELECT title, release_date FROM album WHERE release_date = (SELECT MAX(release_date) FROM album);

SELECT album_id_fk, COUNT(*) AS num_of_songs FROM song GROUP BY album_id_fk ORDER BY album_id_fk;
SELECT artist_id_fk, COUNT(*) AS num_of_albums FROM album GROUP BY artist_id_fk;










