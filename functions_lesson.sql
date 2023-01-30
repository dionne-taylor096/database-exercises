-- FUNCTIONS --
-- FORMAT: NAME_OF_FUNCTION (INPUT)

-- STRINGS --
-- CASE CONVERSION --
SELECT artist, upper(artist), lower(artist)
from albums;

SELECT substr('hello oneil class', 7, 5);
-- DATETIME --


-- NUMERICAL --
-- min, max, avg
-- COUNT
SELECT COUNT(*) FROM albums;
SELECT MIN(release_date) AS min_release_date, 
max(release_date),
round(AVG(release_date))
FROM albums 


-- CASTING --