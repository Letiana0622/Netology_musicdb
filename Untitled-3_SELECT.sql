CREATE TABLE IF NOT EXISTS Genre (
	Genre_id SERIAL PRIMARY KEY,
	Genre_name VARCHAR(40) UNIQUE NOT NULL
);

INSERT INTO Genre(Genre_name)
VALUES ('Classic');

INSERT INTO Genre(Genre_name)
VALUES ('Rock');

INSERT INTO Genre(Genre_name)
VALUES ('Pop');

INSERT INTO Genre(Genre_name)
VALUES ('Sleep');

INSERT INTO Genre(Genre_name)
VALUES ('Chill');


CREATE TABLE IF NOT EXISTS Musician (
	Musician_id SERIAL PRIMARY KEY,
	Musician_name VARCHAR(40) NOT NULL
);

INSERT INTO Musician(Musician_name)
VALUES ('Bah');

INSERT INTO Musician(Musician_name)
VALUES ('Bethoveen');

INSERT INTO Musician(Musician_name)
VALUES ('Pink Floyed');

INSERT INTO Musician(Musician_name)
VALUES ('Rolling Stones');

INSERT INTO Musician(Musician_name)
VALUES ('Abba');

INSERT INTO Musician(Musician_name)
VALUES ('U2');

INSERT INTO Musician(Musician_name)
VALUES ('Claude Debussy');

INSERT INTO Musician(Musician_name)
VALUES ('Brian Eno');

CREATE TABLE IF NOT EXISTS Genre_Musician (
	Genre_id INTEGER REFERENCES Genre(Genre_id),
	Musician_id INTEGER REFERENCES Musician(Musician_id),
	CONSTRAINT pk PRIMARY KEY (Genre_id, Musician_id)
);

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('1','1');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('1','2');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('1','7');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('3','3');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('3','4');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('4','5');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('4','6');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('5','7');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('5','8');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('6','5');

INSERT INTO Genre_Musician(Genre_id,Musician_id)
VALUES ('6','6');


CREATE TABLE IF NOT EXISTS Album (
	Album_id SERIAL PRIMARY KEY,
	Album_name VARCHAR(40) NOT NULL,
	Album_year INTEGER NOT NULL
);

INSERT INTO Album(Album_name, Album_year)
VALUES ('The Ultimate Most Relaxing Debussy','2007');

INSERT INTO Album(Album_name, Album_year)
VALUES ('Essentials','2018');

INSERT INTO Album(Album_name, Album_year)
VALUES ('BBS archives','2011');

INSERT INTO Album(Album_name, Album_year)
VALUES ('Essentials','2000');

INSERT INTO Album(Album_name, Album_year)
VALUES ('30','2021');

INSERT INTO Album(Album_name, Album_year)
VALUES ('Adele','2022');


INSERT INTO Album(Album_name, Album_year)
VALUES ('Best hits','2019');


CREATE TABLE IF NOT EXISTS Musician_Album (
    Musian_Album_id SERIAL primary key,
	Album_id INTEGER REFERENCES Album(Album_id),
	Musician_id INTEGER REFERENCES Musician(Musician_id)
);

INSERT INTO Musician_Album(Musician_id,Album_id)
VALUES 
('7','1'),
('1','2'),
('2','3'),
('3','1'),
('3','4'),
('4','5'),
('5','6'),
('6','7'),
('8','8');

CREATE TABLE IF NOT EXISTS Track (
	Track_id SERIAL PRIMARY KEY,
	Track_name VARCHAR(40) NOT NULL,
	Track_time TIME NOT NULL,
	Album_id INTEGER REFERENCES Album(Album_id)
);

INSERT INTO Track(Track_name, Track_time,album_id)
VALUES ('My track','00:04:00',1);


INSERT INTO Track(Track_name, Track_time,album_id)
VALUES 
('track 1','00:01:00',1);


INSERT INTO Track(Track_name, Track_time,album_id)
VALUES 
('track 1','00:01:00',2),
('track 2','00:02:00',2),
('track 3','00:03:50',3),
('track 4','00:04:00',4),
('track 5','00:04:50',5),
('track 6','00:05:00',5),
('track 7','00:05:50',7),
('track 8','00:06:00',8),
('track 9','00:03:50',3),
('track 10','00:03:00',4),
('track 11','00:02:50',5),
('track 12','00:02:00',6),
('track 13','00:01:50',7),
('track 14','00:00:50',8);

CREATE TABLE IF NOT EXISTS Collection (
	Collection_id SERIAL PRIMARY KEY,
	Collection_name VARCHAR(40) NOT NULL,
	Collection_year INTEGER NOT NULL
);

INSERT INTO Collection(Collection_name, Collection_year)
VALUES 
('Collection 1','2018'),
('Collection 2','2019'),
('Collection 3','2020'),
('Collection 4','2021'),
('Collection 5','2022'),
('Collection 6','2010'),
('Collection 7','2015'),
('Collection 8','2017');


CREATE TABLE IF NOT EXISTS Collection_Track (
    Collection_Track_id SERIAL primary key,
	Collection_id INTEGER REFERENCES Collection(Collection_id),
	Track_id INTEGER REFERENCES Track(Track_id)
);

INSERT INTO collection_track(Collection_id,Track_id)
VALUES 
('1','1'),
('1','2'),
('2','1'),
('2','2'),
('2','3'),
('2','4'),
('3','5'),
('4','6'),
('5','7'),
('5','8'),
('6','9'),
('6','10'),
('7','11'),
('7','12'),
('8','1'),
('8','4'),
('8','13'),
('8','14'),
('8','15'),
('8','16');

SELECT album_name,album_year from album
where album_year = 2018;

SELECT track_name,track_time from track 
ORDER BY track_time DESC
LIMIT 1;

SELECT track_name from track 
WHERE track_time >='00:03:50';

SELECT collection_name from collection 
WHERE collection_year BETWEEN 2018 AND 2020;

SELECT musician_name from musician 
WHERE musician_name NOT LIKE '% %';

SELECT track_name from track 
WHERE track_name LIKE '%My%';

