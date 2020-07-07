/* Using a subquery, list 
- the name, 
- population and 
- continent 
for all countries, which have a greater than average population than the continent the country is in.  
 Order your results alphabetically by the country name. */
 
 SELECT 
    co.Name, co.Population, co.Continent
FROM
    country co
        JOIN
    (SELECT c.continent, AVG(c.Population) AS avgpop FROM country c 
		GROUP BY c.continent) AS s ON co.Continent = s.Continent
WHERE
    co.Population > s.avgpop
ORDER BY co.name