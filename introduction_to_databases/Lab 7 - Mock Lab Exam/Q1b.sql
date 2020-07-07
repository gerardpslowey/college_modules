/* List 
- the last name, 
- location city, 
- phone number and 
- number of orders placed for customers who have placed 5 or more orders. 
List them with the highest number of orders placed first. */

SELECT 
    c.contactLastName,
    c.city,
    c.phone,
    COUNT(o.orderNumber) as order_quantity
FROM
    customers c
        join
    orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber
HAVING order_quantity >= 5
ORDER BY order_quantity DESC;