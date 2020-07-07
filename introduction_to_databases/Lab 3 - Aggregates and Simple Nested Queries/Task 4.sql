/*  List all the customers that made more shipped orders than customer 350. */

SELECT 
    customerNumber, COUNT(orderNumber) AS shippedOrders
FROM
    orders
WHERE
    status = 'Shipped'
GROUP BY customerNumber
HAVING shippedOrders > (SELECT COUNT(orderNumber) FROM orders WHERE customerNumber = 350 AND status = 'Shipped')
ORDER BY shippedOrders DESC;
