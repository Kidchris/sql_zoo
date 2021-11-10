-- 1.List the films where the yr is 1962 [Show id, title]
SELECT id,
    title
FROM movie
WHERE yr = 1962;
--  2.Give year of 'Citizen Kane'
Select yr
from movie
where title = 'Citizen Kane';
-- 3.List all of the Star Trek movies, include the id, title and yr 
-- (all of these movies include the words Star Trek in the title). 
-- Order results by year.
select id,
    title,
    yr
from movie
where title like '%Star Trek%'
order by yr;
-- 4.What id number does the actor 'Glenn Close' have?
select actor.id
from actor
where name = 'Glenn Close';
-- 5.What is the id of the film 'Casablanca'
select id
from movie
where title = 'Casablanca';
-- 6.Obtain the cast list for 'Casablanca'.
select name
from casting
    join actor on actorid = id
where movieid = 11768;
-- 7.Obtain the cast list for the film 'Alien'
SELECT actor.name
FROM actor
    JOIN casting ON actor.id = casting.actorid
    JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Alien';
-- 8.List the films in which 'Harrison Ford' has appeared
Select title
from movie
    join casting on movie.id = movieid
    join actor on actorid = actor.id
where name = 'Harrison Ford';
-- 9.List the films where 'Harrison Ford' has appeared 
-- but not in the starring role
Select title
from movie
    join casting on movie.id = movieid
    join actor on actorid = actor.id
where name = 'Harrison Ford'
    and ord <> 1;
-- 10.List the films together with the leading star for all 1962 films.
select title,
    name
from movie
    join casting on movieid = movie.id
    join actor on actorid = actor.id
where yr = 1962
    and casting.ord = 1;
-- 11.Busy years for Rock Hudson
SELECT yr,
    COUNT(title)
FROM movie
    JOIN casting ON movie.id = movieid
    JOIN actor ON actorid = actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
-- 12.Lead actor in Julie Andrews movies
SELECT movie.title,
    actor.name
FROM movie
    JOIN casting ON movie.id = casting.movieid
    JOIN actor ON casting.actorid = actor.id
WHERE movie.id IN (
        SELECT movieid
        FROM casting
        WHERE actorid = (
                SELECT id
                FROM actor
                WHERE name = 'Julie Andrews'
            )
    )
    AND casting.ord = 1;
-- 13. Actors with 15 leading roles
select name
from actor
    join casting on actorid = id
WHERE ord = 1
GROUP BY actor.name
HAVING COUNT(*) >= 15
order by name -- 
SELECT movie.title,
    COUNT(actorid)
FROM movie
    JOIN casting ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(actorid) DESC,
    movie.title;
-- 15. List all the people who have worked with 'Art Garfunkel'.
SELECT actor.name
FROM actor
    JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid IN (
        SELECT casting.movieid
        FROM casting
            JOIN movie ON casting.movieid = movie.id
        WHERE casting.actorid = (
                SELECT actor.id
                FROM actor
                WHERE name = 'Art Garfunkel'
            )
    )
    AND actor.name <> 'Art Garfunkel';