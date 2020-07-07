/* List the title release_year and description for all films rated “PG” */

SELECT title, release_year, description
FROM film
WHERE rating = "PG";