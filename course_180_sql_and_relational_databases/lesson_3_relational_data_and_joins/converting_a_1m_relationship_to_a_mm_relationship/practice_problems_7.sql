-- Write a SQL statement that determines how many films each director in the database has directed. Sort the results by number of films (greatest first) and then name (in alphabetical order).

  SELECT directors.name AS director, COUNT(films.id) AS films_made
    FROM directors
         INNER JOIN directors_films
         ON directors.id = directors_films.director_id
         INNER JOIN films
         ON films.id = directors_films.film_id
GROUP BY director
ORDER BY films_made DESC,
         director ASC;