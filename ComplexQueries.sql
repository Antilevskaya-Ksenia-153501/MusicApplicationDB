-- COMPLEX QUERIES
-- JOIN
SELECT s.title, a.title
FROM song s
JOIN album a ON s.album_id_fk = a.album_id;

SELECT DISTINCT a.title
FROM song s
JOIN album a ON s.album_id_fk = a.album_id;

SELECT ar.name, COUNT(*) AS num_of_albums 
FROM album al
JOIN artist ar ON al.artist_id_fk = ar.artist_id
GROUP BY ar.name;

SELECT ar.name AS artist, label.name AS label, COUNT(*) AS num_of_albums 
FROM album al
JOIN artist ar ON al.artist_id_fk = ar.artist_id
JOIN label ON ar.label_id_fk = label.label_id
GROUP BY ar.name, label.name;

SELECT *
FROM artist
LEFT JOIN album ON album.artist_id_fk = artist.artist_id;

SELECT *
FROM artist
FULL JOIN album ON album.artist_id_fk = artist.artist_id;

-- PROTOTYPE OF FULL JOIN 
SELECT * FROM artist LEFT JOIN album ON album.artist_id_fk = artist.artist_id
UNION 
SELECT * FROM artist RIGHT JOIN album ON album.artist_id_fk = artist.artist_id
ORDER BY artist_id;

--PARTITION BY 
SELECT artist.name, album_id, title, release_date, ROW_NUMBER() OVER (PARTITION BY artist_id_fk ORDER BY release_date) AS album_rank
FROM album
JOIN artist ON album.artist_id_fk=artist.artist_id;

-- CASE
SELECT title,
CASE
	WHEN playlist.description IS NULL THEN 'No playlist description'
    ELSE playlist.description
END AS description
FROM playlist;

SELECT listener_id, firstname, lastname, date_of_birth,
CASE
	WHEN date_of_birth <= (CURRENT_DATE - INTERVAL '18 years') THEN 'Older than 18'
	ELSE 'Under 18'
END AS age_status
FROM listener;

--HAVING 
SELECT album.title, COUNT(song.title)
FROM album
LEFT JOIN song ON album.album_id = song.album_id_fk
GROUP BY album.title
HAVING COUNT(song.title) > 2;

--UNION
SELECT 'listener' AS entity_type, listener_id AS entity_id, firstname, lastname, email
FROM listener
UNION
SELECT 'artist' AS entity_type, artist_id AS entity_id, name AS firstname, '' AS lastname, ''
FROM artist;

--EXISTS
SELECT *
FROM album
WHERE NOT EXISTS (
	SELECT *
    FROM artist
    WHERE artist.artist_id = album.artist_id_fk
);

--SELECT WITH SUBQUERY
SELECT name, price FROM subscription
WHERE price > (SELECT AVG(price) FROM subscription);

