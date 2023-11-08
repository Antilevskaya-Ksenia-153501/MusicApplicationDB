TRUNCATE TABLE song_genre, genre, playlist_song, song, playlist, payment_method, listener_subscription,
               subscription, album, artist, label, listener, "user", role;
-- ROLE
ALTER SEQUENCE role_role_id_seq RESTART WITH 1;
INSERT INTO role(role_name) 
VALUES ('Listener'), ('Artist');

-- USER 
ALTER SEQUENCE user_user_id_seq RESTART WITH 1;
INSERT INTO "user"(role_id_fk, username, password) 
VALUES (1, 'romashka', 'ejyuej'), (1, 'valentinka', 'cvvhta687'), (1, 'little_boy', 'njjefrj'),
	   (2, 'pasosh', 'hujytrh64'), (2, 'rxseboy', '784jfvyi8'), (2, 'maroon5', 'hfrihrfhr895');

-- LISTENER
ALTER SEQUENCE listener_listener_id_seq RESTART WITH 1;
INSERT INTO listener (user_id_fk, firstname, lastname, date_of_birth, email, phone_number)
VALUES (1, 'Roman', 'Doskoch', '1995-05-15', 'roman_d@gmail.com', '+375 (29) 123-45-67'),
       (2, 'Alexander', 'Valentey', '1997-01-01', 'alexander_v@gmail.com', '+375 (29) 168-55-71'),
	   (3, 'Ilya', 'Lagynovskii', '2007-09-23', 'ilya_l@gmail.com', '+375 (29) 139-65-98');
	   
-- LABEL
ALTER SEQUENCE label_label_id_seq RESTART WITH 1;
INSERT INTO label (name, description) 
VALUES ('Harmonic Soundscapes', 'Harmonic Soundscapes is a visionary music company dedicated to curating and crafting
		extraordinary auditory experiences. We specialize in producing, promoting, and distributing captivating 
		music that transcends boundaries, resonates with emotions, and elevates the human spirit. 
		With a team of passionate musicians, composers, and sound engineers, we strive to create a harmonious blend 
		of genres, styles, and cultures, offering a diverse range of musical expressions. From soul-stirring melodies
		to pulsating beats, our catalog encompasses a rich tapestry of sounds that captivate listeners and ignite 
		their imagination.'),
       ('Melodia Ventures', 'Melodia Ventures is an innovative music company that embarks on an exhilarating 
		quest to redefine the boundaries of sonic exploration. Our mission is to discover, nurture, and 
		amplify exceptional musical talent while creating captivating experiences for music enthusiasts 
		worldwide. With a team of visionary artists, producers, and industry experts, Melodia Ventures is at 
		the forefront of shaping the future of music. We are driven by a relentless passion for pushing 
		creative boundaries and embracing diverse genres, styles, and cultural influences. From classical 
		symphonies to cutting-edge electronic compositions, our catalog is a treasure trove of captivating 
		melodies that traverse the spectrum of human emotions.');	
		
-- ARTIST
ALTER SEQUENCE artist_artist_id_seq RESTART WITH 1;
INSERT INTO artist (user_id_fk, label_id_fk, name, biography, image_url)
VALUES (3, 1, 'Pasosh', 'Pasosh, born as Sofia Hernandez, is an extraordinary musician whose prodigious 
		talent and enchanting melodies have captivated audiences worldwide. Hailing from a small town, 
		Pasosh discovered her passion for music at a young age and embarked on a remarkable journey that 
		would shape her into the artist she is today. From the moment she picked up her first instrument, 
		Pasosh natural affinity for music became evident. With an innate ability to weave intricate melodies 
		and harmonies, she quickly honed her skills and began composing her own original pieces. 
		Her compositions, characterized by their emotional depth and ethereal quality, resonated with 
		listeners on a profound level.', 'https://example.com/artist1.jpg'),
	   (4, 2, 'Rxseboy', 'Rxseboy, born as Liam Anderson, is a rising star in the music industry whose 
		raw talent and emotional lyrics have struck a deep chord with listeners around the globe. 
		Hailing from a humble background, Rxseboys journey in music began as a cathartic outlet for his personal
		struggles and a means of connecting with others who could relate to his experiences. From an early age, 
		Rxseboy found solace in music and poetry, using them as vehicles to express his innermost thoughts and
		emotions. Drawing inspiration from artists who fearlessly bared their souls, he developed a distinctive 
		style that blends introspective lyrics with haunting melodies, creating a sonic landscape that resonates 
		with authenticity and vulnerability.', 'https://example.com/artist2.jpg'),
		(5, 2, 'Maroon5', 'Maroon 5 is an American pop rock band that gained international fame and success with 
		 their catchy melodies, soulful vocals, and upbeat pop sound. The band was formed in Los Angeles, 
		 California, in 1994, originally under the name Karas Flowers. The original lineup consisted of Adam 
		 Levine (vocals, guitar), Jesse Carmichael (keyboard, rhythm guitar), Mickey Madden (bass), and Ryan 
		 Dusick (drums). Before achieving mainstream success, Maroon 5 released their debut album, "The Fourth 
		 World," in 1997. However, the album did not receive much attention and led to the band being dropped from
		 their record label. Determined to continue pursuing their musical careers, the members of Maroon 5 attended
		 college but eventually reunited in 2001.', 'https://example.com/artist3.jpg');

-- SUBSCRIPTION
ALTER SEQUENCE subscription_subscription_id_seq RESTART WITH 1;
INSERT INTO subscription (name, price, features) 
VALUES ('Basic', 9.99, 'Basic features'),('Premium', 19.99, 'Premium features');	  

-- LISTENER_SUBSCRIPTION
ALTER SEQUENCE listener_subscription_listener_subscription_id_seq RESTART WITH 1;
INSERT INTO listener_subscription (subscription_id_fk, listener_id_fk, start_date, end_date)
VALUES (1, 1, '2023-01-01', '2023-12-31'), (2, 2, '2023-10-13', '2024-10-13');

-- PAYMENT_METHOD
ALTER SEQUENCE payment_method_payment_method_id_seq RESTART WITH 1;
INSERT INTO payment_method (listener_id_fk, card_number, expiry_date, cvv)
VALUES (1, '6534093765125571', '2025-01-01', '323'), (2, '7934186590368256', '2026-01-01', '562');

-- ALBUM
ALTER SEQUENCE album_album_id_seq RESTART WITH 1;
INSERT INTO album (artist_id_fk, title, release_date, cover_image_url) VALUES (1, 'We will never be bored', '2015-10-17', NULL); 
INSERT INTO album (artist_id_fk, title, release_date, cover_image_url) VALUES (1, 'Сoming home again', '2020-04-01', 'https://example.com/album2.jpg');
INSERT INTO album (artist_id_fk, title, release_date, cover_image_url) VALUES (2, 'Enjoy the moment', '2019-05-31', 'https://example.com/album3.jpg');  
INSERT INTO album (artist_id_fk, title, release_date, cover_image_url) VALUES (2, 'Bloom', '2023-08-09', 'https://example.com/album4.jpg');
INSERT INTO album (artist_id_fk, title, release_date, cover_image_url) VALUES (NULL, 'Memories about childhood', '2021-05-01', 'https://example.com/album5.jpg');

-- SONG
ALTER SEQUENCE song_song_id_seq RESTART WITH 1;
INSERT INTO song (artist_id_fk, album_id_fk, title) 
VALUES (1, 1, '!happiness'), (1, 1, 'friends'),
       (1, 2, 'tired'), (1, 2, 'road back'), (1, 1, 'come home'),
	   (2, 3, 'girlfriend'), (2, 3, 'work it out'), (2, 3, 'janzport'),
	   (2, 4, 'hit the road'), (2, 4, 'mine'), (2, 4, 'can you wait for me?'), (2, 4, '!weird');
	   

-- GENRE
ALTER SEQUENCE genre_genre_id_seq RESTART WITH 1;
INSERT INTO genre (type) 
VALUES ('Hip-hop'), ('Rap'), ('Rock'), ('Punk');

-- SONG_GENRE
ALTER SEQUENCE song_genre_song_genre_id_seq RESTART WITH 1;
INSERT INTO song_genre (song_id_fk, genre_id_fk) 
VALUES (1, 4), (2, 3), (2, 4), (3, 4), (4, 3), (4, 4), (5, 4), (6, 1), (7, 1), (8, 1), (8, 2), (9, 1), (10, 1), 
       (10, 2), (11, 2), (12, 1);

-- PLAYLIST
ALTER SEQUENCE playlist_playlist_id_seq RESTART WITH 1;
INSERT INTO playlist (listener_id_fk, title, description, cover_image_url)
VALUES (1, 'Tiredness', 'When i am really tired & upset', 'https://example.com/playlist.jpg'),
	   (1, 'Work out', 'More passion, more footwork', NULL),
	   (2, 'Lofi', 'Relaxing', 'https://example.com/playlist.jpg'),
	   (2, 'Party', NULL, 'https://example.com/playlist.jpg');

-- PLAYLIST_SONG
INSERT INTO playlist_song (playlist_id_fk, song_id_fk) 
VALUES (1, 1), (1, 2), (1, 3), (1, 5),
	   (2, 7), (2, 8), (2, 12),
	   (3, 4), (3, 11), (3, 10),
	   (4, 9), (4, 8), (4, 7);
	   
	   	   
	   
	   
