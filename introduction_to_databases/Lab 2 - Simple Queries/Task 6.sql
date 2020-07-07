/* Use classicmodels: From payments table, list customers who spent more than 30000 in total, 
order the result by the total amount from highest to lowest. */

SELECT 
    customerNumber, SUM(amount) AS amountSpent
FROM
    payments
WHERE
    amount > 30000
GROUP BY customerNumber
ORDER BY amountSpent DESC;