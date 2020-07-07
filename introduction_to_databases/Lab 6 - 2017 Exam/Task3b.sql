/* List 
- the name of the employee, 
- the number of customers that employee has, 
- their manager's name and 
- the total amount of money they have made through orders. 
For the top 3 most profitable employees  */

SELECT 
    em.firstName AS employeeFname,
    em.lastName AS employeeLname,
    COUNT(DISTINCT (cu.customerNumber)) as custNumber,
    m.firstName AS managerFname,
    m.lastName AS managerLname,
    SUM(od.priceEach * od.quantityordered) AS pop
FROM
    employees em
        JOIN
    customers cu ON em.employeeNumber = cu.salesRepEmployeeNumber
        JOIN
    orders o ON cu.customerNumber = o.customerNumber
        JOIN
    orderdetails od ON od.orderNumber = o.orderNumber
        JOIN
    employees AS m ON em.reportsTo = m.employeeNumber
GROUP BY em.employeeNumber
ORDER BY pop DESC
LIMIT 3;