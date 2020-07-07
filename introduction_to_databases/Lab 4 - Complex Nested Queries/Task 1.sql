/* Use classicmodels: List the full details of any product whose buyPrice is greater than the average buyPrice, 
and show by how much their buyPrice is greater than the average. 
Order the difference from the highest to lowest. 
 */
 
 
 SELECT 
    *, (buyPrice - (SELECT AVG(buyPrice) FROM products)) AS priceDifference
FROM
    products
WHERE
    buyPrice > (SELECT AVG(buyPrice) FROM products)
ORDER BY buyPrice DESC;