 /* Use sakila schema: List the customer_id, inventory_id who borrowed film from staff with id of 1. */
 
 SELECT 
    customer_id, inventory_id
FROM
    rental
WHERE
    staff_id = 1;
 