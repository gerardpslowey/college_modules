/* Using a nested select query expression:
List 
- the name, 
- vendor and 
- amount of units ordered for all products.
List them from highest number ordered to lowest. */

SELECT 
    p.productName,
    p.productVendor,
    total as productCount
FROM
    products p
        JOIN
    (SELECT SUM(od.quantityOrdered) as total, 
		od.productCode FROM orderdetails od GROUP BY od.productCode) AS s ON p.productCode = s.productCode
ORDER BY productCount DESC;