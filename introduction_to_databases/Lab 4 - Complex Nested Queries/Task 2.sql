/*  List out the products with a profit greater than the average profit for all products. 
Order the products by the profit multiplied by stock levels. 
(Hint: The profit for each product is MSPR - buyPrice) */
 
 
 SELECT 
    productName,
    MSRP,
    buyPrice,
    ROUND(MSRP - buyPrice, 2) AS Profit
FROM
    products
WHERE
    (MSRP - buyPrice) > (SELECT (AVG(MSRP) - AVG(buyPrice)) AS avgProfit FROM products)
ORDER BY ((MSRP - buyPrice) * quantityInStock);