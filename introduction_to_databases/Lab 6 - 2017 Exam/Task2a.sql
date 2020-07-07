/* List 
- the name of the city, 
- the population of a city, 
- the name of the country the city is in, 
- and the percentage of the country's population that live in the city, 
for all countries that have a life expectancy between 50 and 70 years of age. 
Order your results by the percentage from highest to lowest */

SELECT 
    ci.name AS cityName,
    ci.Population AS cityPopulation,
    co.Name AS countryName,
    ((ci.Population / co.Population) * 100) AS percentPopulation
FROM
    City ci
        JOIN
    Country co ON ci.CountryCode = co.Code
WHERE
    co.LifeExpectancy BETWEEN 50 AND 70
ORDER BY percentPopulation DESC;