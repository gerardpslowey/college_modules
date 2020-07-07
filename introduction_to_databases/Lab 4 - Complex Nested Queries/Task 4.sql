/* List all customers from any country where all the customers in that country 
have a creditLimit greater than any customers living in Austria. 
(Hint: try using min() and max()) */

SELECT 
    *
FROM
    customers
WHERE
    country = ANY(SELECT country FROM customers GROUP BY country HAVING MIN(creditLimit) > 
					(SELECT MAX(creditLimit) FROM customers WHERE country = 'Austria'));