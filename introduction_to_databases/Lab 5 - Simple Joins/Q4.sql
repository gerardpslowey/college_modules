/* List the customer name and the full names of the contact person from all customers who have never placed an order */

SELECT 
    customerName, contactFirstName, contactLastName
FROM
    customers
        LEFT JOIN
    orders USING (customerNumber)
WHERE
    orderNumber IS NULL;