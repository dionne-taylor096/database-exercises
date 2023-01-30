DESCRIBE albums;
SELECT DISTINCT artist
FROM albums;
-- a. How many rows are in the albums table? 6
SELECT COUNT( DISTINCT artist) AS artist_count
FROM albums;
-- b. How many unique artist names are in the albums table? 23
DESCRIBE albums;
-- c. What is the primary key for the albums table? Primary key in ab=lbums is : id.
SELECT MIN(release_date), MAX(release_date)
FROM albums;
-- d. What is the oldest release date for any album in the albums table? What is the most recent release date? 1967, 2011
SELECT *
FROM albums
WHERE artist = 'Pink Floyd';
-- a. The name of all albums by Pink Floyd. The Dark Side of the Moon and The Wall
SELECT *
FROM albums
WHERE name LIKE 'Sgt%';
-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released. 1967
SELECT *
FROM albums
WHERE name = 'Nevermind';
-- c. The genre for the album Nevermind. Grunge, Alternative Rock
SELECT *
FROM albums
WHERE release_date BETWEEN '1990' AND '1999';

-- d. Which albums were released in the 1990s. -- WHERE release_date BETWEEN '1990' AND '1999';
SELECT *
FROM albums
WHERE sales < 20;
-- e. Which albums had less than 20 million certified sales. SELECT * FROM albums WHERE sales < 20;
SELECT *
FROM albums
WHERE genre = 'rock'
OR genre LIKE '%rock';
-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a 
-- genre of "Hard rock" or "Progressive rock"? Query results for rock genre alone will only yield an exacty match for rock.