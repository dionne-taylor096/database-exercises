-- FUNCTIONS --
SELECT DATABASE();
-- FORMAT: NAME_OF_FUNCTION (INPUT)

-- STRINGS --
-- CASE CONVERSION --
SELECT artist, upper(artist), lower(artist)
from albums;
-- REPLACE: replace an element with something else
-- format: REPLACE(string, from_string, new_string)
SELECT REPLACE('hello oneil class!', 'oneil','O\'Neil');
SELECT genre, REPLACE(lower(genre), 'rock', '****ROCK8***') as genre_ROCKS
from albums;
SELECT substr('hello oneil class', 7, 5);
-- DATETIME --
SELECT now();
SELECT CURRENT_DATE();
SELECT curtime();
SELECT NOW(), CONVERT_TZ(NOW(),'+00:00', '-06:00');
-- NUMERICAL --
-- min, max, avg
-- COUNT
SELECT COUNT(*) FROM albums;
SELECT MIN(release_date) AS min_release_date, 
max(release_date),
round(AVG(release_date))
FROM albums;


-- CASTING --
SELECT 1 + '2';
SELECT MONTH ('2023-01-30');
SELECT DAY ('2023-01-30');
SELECT YEAR ('2023-01-30');

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username, first_name, last_name, birth_date
FROM employees