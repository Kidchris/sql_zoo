-- Modify it to show the population of Germany
SELECT population
FROM world
WHERE name = 'Germany';
--   Show the name and the population for 'Sweden', 'Norway' and 'Denmark
SELECT name,
  population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
-- Modify it to show the country and the area for countries with an area between 200,000 and 250,000
SELECT name,
  area
FROM world
WHERE area BETWEEN 200000 AND 250000;
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name,
  (gdp / population)
FROM world
WHERE population > 200000000;
-- how the name and population in millions for the countries of the continent 'South America'
SELECT name,
  population / 1000000
FROM world
WHERE continent LIKE 'South America';
-- Show the name and population for France, Germany, Italy
SELECT name,
  population
FROM world
WHERE name IN('France', 'GERMANY', 'Italy');
-- Show the countries which have a name that includes the word 'United'
SELECT name,
  population
FROM world
WHERE name IN('France', 'GERMANY', 'Italy');
-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name,
  population,
  area
FROM world
WHERE area > 3000000
  OR population > 250000000;
-- Show the countries that are big by area (more than 3 million) or 
-- big by population (more than 250 million) but not both. 
-- Show name, population and area.
SELECT name,
  population,
  area
FROM world
WHERE area > 3000000
  XOR population > 250000000;
-- Show the name and population in millions and the GDP in billions 
-- for the countries of the continent 'South America'
SELECT name,
  ROUND(population / 1000000, 2),
  ROUND(gdp / 1000000000, 2)
FROM world
WHERE continent = 'SOUTH AMERICA';
-- Show per-capita GDP for the trillion dollar countries to the nearest $1000
SELECT name,
  ROUND(gdp / population, -3)
FROM world
WHERE gdp > 1000000000000;
-- Show the name and capital where the name and the capital have the same number of characters.
SELECT name,
  capital
FROM world
WHERE LENGTH(capital) = LENGTH(name);
-- Show the name and the capital where the first letters of each match. 
-- Don't include countries where the name and the capital are the same word.
SELECT name,
  capital
FROM world
WHERE name != capital
  AND LEFT(name, 1) = LEFT(capital, 1);
--  Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%i%'
  AND name LIKE '%u%'
  AND name LIKE '%o%'
  AND name LIKE '%e%'
  AND name NOT LIKE '% %'