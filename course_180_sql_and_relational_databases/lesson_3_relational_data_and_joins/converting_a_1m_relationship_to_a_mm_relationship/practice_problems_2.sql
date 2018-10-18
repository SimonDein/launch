/*
Write the SQL statement needed to create a join table that will allow a film to have multiple directors, and directors to have multiple films. Include an id column in this table, and add foreign key constraints to the other columns.
*/

CREATE TABLE directors_films (
         id serial PRIMARY key,
    film_id int    REFERENCES films(id),
director_id int    REFERENCES directors(id),
UNIQUE (film_id, director_id)
);