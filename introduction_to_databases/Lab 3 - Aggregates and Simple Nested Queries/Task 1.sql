/* Use classicmodels:
From the orderdetails table, list the total amount and the number of different types of product in each order. */

SELECT 
    orderNumber,
    SUM(quantityOrdered) AS ItemsOrdered,
    COUNT(DISTINCT productCode) AS DifferentItems
FROM
    orderdetails
GROUP BY orderNumber;