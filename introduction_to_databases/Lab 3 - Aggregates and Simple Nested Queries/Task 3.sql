/* Count the number of shipped orders made by customer 350. */

SELECT 
    customerNumber, COUNT(orderNumber) AS OrdersShipped
FROM
    orders
WHERE
    customerNumber = '350'
        AND status = 'Shipped';
