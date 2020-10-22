USE sakila;
/* 1) List each pair of actors that have worked together.
*/

-- Creating view
DROP VIEW actors_movies;
CREATE VIEW actors_movies AS
SELECT fa.actor_id, CONCAT(a.first_name,' ',a.last_name) AS Name, f.title FROM film_actor fa
JOIN film f ON f.film_id = fa.film_id
JOIN actor a ON a.actor_id = fa.actor_id;

-- View Check
SELECT * FROM actors_movies;

-- Self join
SELECT am1.Name AS actor_1, am2.Name AS actor_2 FROM actors_movies am1
JOIN actors_movies am2 ON am1.title = am2.title AND am1.Name <> am2.Name
GROUP BY actor_1
ORDER BY actor_1;

/* 2) For each film, list actor that has acted in more films.
*/
SELECT am1.title AS movie1, am1.Name AS actor, am2.title AS movie2 FROM actors_movies am1
JOIN actors_movies am2 ON am1.title <> am2.title AND am1.Name = am2.Name
GROUP BY movie1
ORDER BY movie1;
