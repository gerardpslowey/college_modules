/* Using a subquery, list 
- the name, 
- population and 
- continent 
for all countries, which have a greater than average population than the continent the country is in.  
Order your results alphabetically by the country name. */
 
 SELECT 
    Name, Population, Continent AS countryContinent
FROM
    Country
WHERE
    Population > (SELECT AVG(Population) AS avgPopulation FROM Country
					GROUP BY Continent HAVING Continent = countryContinent)
ORDER BY Name;