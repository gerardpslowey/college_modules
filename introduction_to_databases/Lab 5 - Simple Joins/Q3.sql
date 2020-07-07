/* List 
- the customer’s name, 
- number, 
- full details of all orders and 
- payment amounts 
of customers who have spent more on an order than any order made by the customer called Signal Gift Stores.
(Hint: Will be a join but not a natural join) */

SELECT 
    c.customerName,
    c.CustomerNumber,
    o.*,
    p.amount
FROM
    customers c
        LEFT JOIN
    orders o ON c.customerNumber = o.customerNumber
        LEFT JOIN
    payments p ON o.customerNumber = p.customerNumber
WHERE
    amount > (SELECT MAX(amount) FROM payments JOIN customers ON payments.customerNumber = customers.customerNumber WHERE
            customers.customerName = 'Signal Gift Stores');
