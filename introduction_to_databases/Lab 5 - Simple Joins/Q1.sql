/* Use the world schema: 
Using a Join, list the names and populations of the cities where English is the official language spoken. */

SELECT 
    c.Name as cityName, c.Population as cityPop
FROM
    City c
        INNER JOIN
    CountryLanguage cl ON cl.Language = 'English' AND cl.IsOfficial = 'T'
GROUP BY cityName;