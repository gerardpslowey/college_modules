/* Using a nested select  query expression: 
List 
- the name, 
- vendor and 
- amount of units ordered for all products.  
List them from highest number ordered to lowest. */

SELECT 
    productName, productVendor, dc.numordered
FROM
    products
        JOIN
    (SELECT 
        SUM(quantityOrdered) AS numOrdered, productCode
    FROM
        orderdetails
    GROUP BY productCode) AS dc ON dc.productCode = products.productCode
ORDER BY dc.numordered DESC;