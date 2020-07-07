/* Return all the countries, 
- the cities in each country and 
- each country’s population for
countries with an excess of 10 million people.
Order the results by population, starting with the highest population. */

SELECT 
    c.Name, COUNT(cty.Name) AS cityNumber, c.Population
FROM
    Country c
        JOIN
    City cty ON c.code = cty.countrycode
WHERE
    c.Population > 10000000
GROUP BY CountryCode
ORDER BY c.Population DESC;