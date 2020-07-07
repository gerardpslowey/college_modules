/* Using a nested select query expression:
List 
- the name, 
- vendor and 
- amount of units ordered for all products.
List them from highest number ordered to lowest. 
Repeat but only where the amount of units exceeds 1000. */

SELECT 
    p.productName,
    p.productVendor,
    total as productCount
FROM
    products p
        JOIN
    (SELECT SUM(od.quantityOrdered) as total, od.productCode
		FROM orderdetails od
		GROUP BY od.productCode) AS s ON p.productCode = s.productCode
HAVING productCount > 1000
ORDER BY productCount DESC;