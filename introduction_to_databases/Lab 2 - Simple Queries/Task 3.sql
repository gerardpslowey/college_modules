/* Use sakila schema: Get the title, description, release_year, rental_rate of the film that been released in 2006.  */

SELECT 
    title, description, release_year, rental_rate
FROM
    film
WHERE
    release_year = 2006;