-- show the name, continent and population of all countrie
SELECT name,
    continent,
    population
FROM world;
-- how the name for the countries that have a population of at least 200 million
SELECT name
FROM world
WHERE population > 200000000;
--