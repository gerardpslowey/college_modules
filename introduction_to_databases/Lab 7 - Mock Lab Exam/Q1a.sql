/* List 
- the code, 
- line, 
- name, 
- vendor and
- MSRP of all Classic Cars from the products table 
Sort by their selling price from highest to lowest. */

SELECT 
    p.productCode,
    p.productLine,
    p.productName,
    p.productVendor,
    p.MSRP
FROM
    products p
WHERE
    productLine = 'Classic Cars'
ORDER BY MSRP DESC;