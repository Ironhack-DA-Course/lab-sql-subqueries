-- Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT * FROM sakila.inventory;

SELECT * FROM sakila.film
WHERE title LIKE "%Hunchback Impossible%";

SELECT film_id,COUNT(i.inventory_id) FROM (
SELECT i.inventory_id, film_id FROM sakila.film as f
WHERE f.title LIKE "%Hunchback Impossible%"
JOIN sakila.inventory AS i
ON f.film_id = i.film_id
) AS fi
GROUP BY fi.film_id;

SELECT film_id FROM sakila.film as f
JOIN sakila.inventory AS i 
ON f.film_id = i.film_id
HAVING f.title LIKE "%Hunchback Impossible%";

SELECT COUNT(film_id) FROM (
SELECT film_id FROM sakila.film as f
HAVING f.title LIKE "%Hunchback Impossible%"
JOIN sakila.inventory AS i 
ON f.film_id = i.film_id
);


-- List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT AVG(`length`) FROM sakila.film;
SELECT * FROM sakila.film
WHERE `length` > (SELECT AVG(`length`) FROM sakila.film);

-- Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.actor;

SELECT  f.title, first_name, last_name FROM sakila.actor AS a
JOIN sakila.film_actor AS fa
ON a.actor_id = fa.actor_id
JOIN sakila.film AS f
ON fa.film_id = f.film_id
WHERE f.title LIKE "%Alone Trip%";


SELECT first_name, last_name FROM (
SELECT f.title, first_name, last_name FROM sakila.actor as a
JOIN sakila.film_actor AS fa
ON a.actor_id = fa.actor_id
JOIN sakila.film AS f
ON fa.film_id = f.film_id
) AS actor_film_title
WHERE actor_film_title.title LIKE "%Alone Trip%";