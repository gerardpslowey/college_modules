/* Using a Join, list 
- the names and populations of each city within each country, clearly
- showing both the names and populations of both the cities and countries. 
Also, 
- show the percentage of the country population each city contains. */

SELECT 
    co.Name AS CountryName,
    co.Population AS CountryPopulation,
    c.Name AS CityName,
    c.Population AS CityPopulation,
    ((c.Population / co.Population) * 100) AS popPercentage
FROM
    City c
        INNER JOIN
    Country co ON c.CountryCode = co.Code;