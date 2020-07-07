/* Using joins, list the title and category for all films where the category 
name begins with “A”.
Order your results alphabetically by film title. */

SELECT 
    f.title, c.name
FROM
    film f
        JOIN
    film_category fc ON f.film_id = fc.film_id
        JOIN
    category c ON c.category_id = fc.category_id
WHERE
    c.name LIKE 'A%'
ORDER BY f.title;