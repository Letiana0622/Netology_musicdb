CREATE TABLE IF NOT EXISTS Genre (
	Genre_id SERIAL PRIMARY KEY,
	Genre_name VARCHAR(40) UNIQUE NOT NULL
);
INSERT INTO Genre(Genre_name)
VALUES ('Classic');

CREATE TABLE IF NOT EXISTS Musician (
	Musician_id SERIAL PRIMARY KEY,
	Musician_name VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS Genre_Musician (
	Genre_id INTEGER REFERENCES Genre(Genre_id),
	Musician_id INTEGER REFERENCES Musician(Musician_id),
	CONSTRAINT pk PRIMARY KEY (Genre_id, Musician_id)
);
CREATE TABLE IF NOT EXISTS Album (
	Album_id SERIAL PRIMARY KEY,
	Album_name VARCHAR(40) NOT NULL,
	Album_year INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS Musician_Album (
    Musian_Album_id SERIAL primary key,
	Album_id INTEGER REFERENCES Album(Album_id),
	Musician_id INTEGER REFERENCES Musician(Musician_id)
);
CREATE TABLE IF NOT EXISTS Track (
	Track_id SERIAL PRIMARY KEY,
	Track_name VARCHAR(40) NOT NULL,
	Track_time TIME NOT NULL,
	Album_id INTEGER REFERENCES Album(Album_id)
);
CREATE TABLE IF NOT EXISTS Collection (
	Collection_id SERIAL PRIMARY KEY,
	Collection_name VARCHAR(40) NOT NULL,
	Collection_year INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS Collection_Track (
    Collection_Track_id SERIAL primary key,
	Collection_id INTEGER REFERENCES Collection(Collection_id),
	Track_id INTEGER REFERENCES Track(Track_id)
);
