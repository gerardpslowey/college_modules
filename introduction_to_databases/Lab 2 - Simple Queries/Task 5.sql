/* Use classicmodels: Get detailed information of a product which has more than 5000 of quantityInStock and MSRP is twice bigger than buyPrice. 
Order the results by product name in alphabetical order. */

SELECT 
    *
FROM
    products
WHERE
    quantityInStock > 5000 AND MSRP > 2 * buyPrice
ORDER BY productName;