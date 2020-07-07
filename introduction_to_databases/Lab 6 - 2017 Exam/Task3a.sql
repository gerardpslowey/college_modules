 /* List 
 - the name, 
 - the textDescription, and 
 - the total quantity of products were ordered in that product line. 
 Order your results from the highest quantities to lowest. */
 
 SELECT 
    pl.productLine,
    pl.textDescription,
    SUM(quantityOrdered) AS tot
FROM
    productlines pl
        JOIN
    products p ON pl.productLine = p.productLine
        JOIN
    orderdetails od ON p.productCode = od.productCode
GROUP BY pl.productLine
ORDER BY tot DESC;