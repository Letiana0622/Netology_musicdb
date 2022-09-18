select genre_id, count(musician_id) from genre_musician
group by genre_id;

select album_year, count(track_name) from track as t
join album as a on t.album_id = a.album_id
group by a.album_year
having a.album_year between 2019 and 2020;

select album_name, AVG(track_time) from track as t
join album as a on t.album_id = a.album_id
group by a.album_name;

select musician_name from musician as m
join musician_album as ma on m.musician_id = ma.musician_id
join album as a on ma.album_id = a.album_id
where a.album_year != 2020
group by m.musician_id;

select collection_name from musician as m
join musician_album as ma on m.musician_id = ma.musician_id
join album as a on ma.album_id = a.album_id
join track as t on a.album_id = t.album_id
join collection_track as ct on t.track_id = ct.track_id
join collection as c on ct.collection_id = c.collection_id
where m.musician_name like '%Bah%';

select album_name from genre as g
join genre_musician gm on g.genre_id = gm.genre_id
join musician m on gm.musician_id = m.musician_id
join musician_album as ma on m.musician_id = ma.musician_id
join album as a on ma.album_id = a.album_id
group by a.album_name, a.album_id
having count(distinct g.genre_id)>1;

select track_name from track as t
left join collection_track as ct on t.track_id = ct.track_id
where ct.collection_id = 0 ;

select musician_name, min(track_time) from musician as m
join musician_album as ma on m.musician_id = ma.musician_id
join album as a on ma.album_id = a.album_id
join track as t on a.album_id = t.album_id
group by m.musician_name
order by min(t.track_time)
limit 3;

select album_name, count(track_id) from album as a
join track as t on a.album_id = t.album_id
group by a.album_name
order by count(t.track_id)
limit 5;

