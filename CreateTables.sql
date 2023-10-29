DROP TABLE IF EXISTS song_genre;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS playlist_song;
DROP TABLE IF EXISTS song;
DROP TABLE IF EXISTS playlist;
DROP TABLE IF EXISTS payment_method;
DROP TABLE IF EXISTS listener_subscription;
DROP TABLE IF EXISTS subscription;
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS label;
DROP TABLE IF EXISTS listener;
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS role;

CREATE TABLE role (
	role_id serial PRIMARY KEY,
	role_name varchar(50) UNIQUE NOT NULL
);

CREATE TABLE "user" (
	user_id serial PRIMARY KEY,
	role_id_fk int NOT NULL,
	FOREIGN KEY (role_id_fk) REFERENCES role(role_id) ON DELETE RESTRICT, 
	username varchar(50) NOT NULL,
	password varchar(100) NOT NULL
);

CREATE TABLE listener (
	listener_id serial PRIMARY KEY,
	user_id_fk int UNIQUE NOT NULL,
	FOREIGN KEY (user_id_fk) REFERENCES "user"(user_id) ON DELETE CASCADE,
	firstname varchar(50) NOT NULL,
	lastname varchar(50) NOT NULL,
	date_of_birth date NOT NULL,
	email varchar(100) NOT NULL CONSTRAINT valid_email CHECK (email ~ '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
	phone_number char(13) CONSTRAINT valid_phone_nubmer CHECK (phone_number ~ '^\+375 (17|29|33|44) [0-9]{3}-[0-9]{2}-[0-9]{2}$')														  
);

CREATE TABLE label(
	label_id serial PRIMARY KEY,
	name varchar(100) NOT NULL,
	description text NOT NULL
);

CREATE TABLE artist (
	artist_id serial PRIMARY KEY,
	user_id_fk int UNIQUE NOT NULL,
	FOREIGN KEY (user_id_fk) REFERENCES "user"(user_id) ON DELETE CASCADE,
	label_id_fk int,
	FOREIGN KEY (label_id_fk) REFERENCES label(label_id) ON DELETE SET NULL,
	name varchar(50) NOT NULL,
	biography text,
	image_url varchar(200) NOT NULL
);

CREATE TABLE subscription(
	subscription_id serial PRIMARY KEY,
	name varchar(100) NOT NULL,
	price decimal(10, 2) NOT NULL,
	features text NOT NULL
);

CREATE TABLE listener_subscription(
	listener_subscription_id serial PRIMARY KEY,
	subscription_id_fk int NOT NULL,
	FOREIGN KEY (subscription_id_fk) REFERENCES subscription(subscription_id) ON DELETE RESTRICT,
	listener_id_fk int UNIQUE NOT NULL,
	FOREIGN KEY (listener_id_fk) REFERENCES listener(listener_id) ON DELETE CASCADE,
	start_date date NOT NULL,
	end_date date NOT NULL
);

CREATE TABLE payment_method(
	payment_method_id serial PRIMARY KEY,
	listener_id_fk int UNIQUE NOT NULL,
	FOREIGN KEY (listener_id_fk) REFERENCES listener(listener_id) ON DELETE CASCADE,
	card_number char(16) NOT NULL CONSTRAINT valid_card_number CHECK (card_number ~ '^[0-9]+$'),
	expiry_date date NOT NULL,
	cvv char(3) NOT NULL CONSTRAINT valid_cvv CHECK (cvv ~ '^[0-9]+$')
);

CREATE TABLE album (
	album_id serial PRIMARY KEY,
	artist_id_fk int,
	FOREIGN KEY (artist_id_fk) REFERENCES artist(artist_id) ON DELETE SET NULL,
	title varchar(70) NOT NULL,
	release_date date NOT NULL,
	cover_image_url VARCHAR(200)	
);

CREATE TABLE song (
	song_id serial PRIMARY KEY,
	artist_id_fk int,
	FOREIGN KEY (artist_id_fk) REFERENCES artist(artist_id) ON DELETE SET NULL,
	album_id_fk int,
	FOREIGN KEY (album_id_fk) REFERENCES album(album_id) ON DELETE SET NULL,
	title varchar(100) NOT NULL
);

CREATE TABLE genre (
	genre_id serial PRIMARY KEY,
	type varchar(100) UNIQUE NOT NULL
);

CREATE TABLE song_genre (
	song_genre_id serial PRIMARY KEY,
	song_id_fk int,
	FOREIGN KEY (song_id_fk) REFERENCES song(song_id) ON DELETE CASCADE,
	genre_id_fk int,
	FOREIGN KEY (genre_id_fk) REFERENCES genre(genre_id) ON DELETE CASCADE
);

CREATE TABLE playlist (
	playlist_id serial PRIMARY KEY,
	listener_id_fk int NOT NULL,
	FOREIGN KEY (listener_id_fk) REFERENCES listener(listener_id) ON DELETE CASCADE,
	title varchar(100) NOT NULL,
	description varchar(200),
	cover_image_url VARCHAR(200)	
);

CREATE TABLE playlist_song (
	playlist_song serial PRIMARY KEY,
	song_id_fk int,
	FOREIGN KEY (song_id_fk) REFERENCES song(song_id) ON DELETE CASCADE,
	playlist_id_fk int,
	FOREIGN KEY (playlist_id_fk) REFERENCES playlist(playlist_id) ON DELETE CASCADE
);