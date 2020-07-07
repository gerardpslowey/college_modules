/*  List the count of the orders shipped for each customer. Order by times of order from highest to lowest. */ 

SELECT 
    customerNumber, 
    COUNT(orderNumber) AS shippedOrders
FROM
    orders
WHERE
    status = 'Shipped'
GROUP BY customerNumber
ORDER BY shippedOrders DESC;