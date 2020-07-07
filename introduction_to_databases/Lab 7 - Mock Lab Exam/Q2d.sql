/* Using a nested select query expression: 
Find all 
- countries that have a city with over 8 million people and 
- out of those countries find the number of languages spoken in each and 
- order the results by the number of languages spoken. */

SELECT
    cc.Name AS countryName,
    COUNT(cl.language) AS NumberofLanguages
FROM
    Country cc
        JOIN
    CountryLanguage cl ON cc.Code = cl.CountryCode
WHERE
    cc.Name IN (SELECT c.Name FROM Country c JOIN City cty ON c.code = cty.countryCode WHERE cty.population > 8000000)
GROUP BY cc.Name
ORDER BY NumberofLanguages;