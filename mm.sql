--a
SELECT*FROM person
--b
SELECT*FROM movie
SELECT movie_id,title,popularity FROM movie WHERE release_date>'2016-01-01' AND budget>100000000
--c
SELECT *FROM movie_crew WHERE (job='Producer'OR job='Editor') AND person_id LIKE'27%'
--d
SELECT person_id,character_name FROM movie_cast WHERE character_name LIKE 'A%' ORDER BY character_name ASC
--e
SELECT AVG(budget)AS [Average Budget of Movies in the 1930s]FROM movie WHERE release_date BETWEEN '1930' AND '1939';
--f
SELECT DISTINCT job FROM movie_crew ORDER BY job ASC 
--g
SELECT COUNT(*) AS [Number of People],movie_id, job FROM movie_crew GROUP BY movie_id,job ORDER BY [Number of People] DESC;

--h
SELECT m.title, m.overview, m.release_date,pc.country_id,c.country_name
FROM movie AS m
JOIN production_country as pc ON m.movie_id=pc.movie_id
JOIN country as c ON pc.country_id=c.country_id
WHERE c.country_name='Turkey';

--üsttekini önce böyle yazarsan aklýna gelir
SELECT*
FROM movie AS m
JOIN production_country as pc ON m.movie_id=pc.movie_id
JOIN country as c ON pc.country_id=c.country_id
WHERE c.country_name='Turkey';

--i
--add a new department name as AI Visualizer
INSERT INTO department(department_id, department_name) 
      VALUES ('13','AI Visualizer');

      DELETE FROM department WHERE department_id = 13


--j
SELECT m.title, g.genre_name, pc.company_name
FROM movie m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genre g ON mg.genre_id = g.genre_id
JOIN movie_company mc ON m.movie_id = mc.movie_id
JOIN production_company pc ON mc.company_id = pc.company_id
WHERE g.genre_name = 'Science Fiction'
  AND pc.company_name LIKE 'Warner Bros.%';

--k
CREATE VIEW [Warner Bros Sci-Fi Movies] AS
SELECT movie.title, genre.genre_name, production_company.company_name
FROM movie
INNER JOIN movie_genres ON movie_genres.movie_id = movie.movie_id
INNER JOIN genre ON genre.genre_id = movie_genres.genre_id
INNER JOIN movie_company ON movie_company.movie_id = movie.movie_id
INNER JOIN production_company ON production_company.company_id = movie_company.company_id
WHERE genre.genre_name = 'Science Fiction' AND production_company.company_name LIKE 'Warner Bros%';

SELECT*FROM [Warner Bros Sci-Fi Movies]











