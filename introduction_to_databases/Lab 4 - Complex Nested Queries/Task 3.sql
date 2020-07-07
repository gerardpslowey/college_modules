 /* List out all customers who meet the following criteria:
 - have a creditLimit greater than any customers who live in Austria
 - have more than one salesRepEmployee in their country */
 
SELECT *
FROM customers
WHERE creditLimit > ALL(SELECT creditLimit FROM customers WHERE country = 'Austria') AND
    country = ANY(SELECT country FROM customers GROUP BY country HAVING COUNT(DISTINCT (salesRepEmployeeNumber)) > 1)