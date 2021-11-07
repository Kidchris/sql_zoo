-- 1.Modify it to show the matchid and player name for all goals scored by Germany.
--  To identify German players, check for: teamid = 'GER'
SELECT matchid,
    player
from goal
    join eteam on teamid = id
where teamid = 'GER';
-- 2.Show id, stadium, team1, team2 for just game 1012
select distinct id,
    stadium,
    team1,
    team2
from game
    join goal on matchid = id
where id = 1012;
-- 3.Modify it to show the player, teamid, stadium and mdate for every German goal
SELECT player,
    teamid,
    stadium,
    mdate
FROM game
    JOIN goal ON (id = matchid)
where teamid = 'GER';
-- 4.Show the team1, team2 and player for every goal scored by 
-- a player called Mario player LIKE 'Mario%'
select team1,
    team2,
    player
from game
    join goal on matchid = id
where player like 'MArio%';
-- 5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtim
SELECT player,
    teamid,
    coach,
    gtime
FROM goal
    join eteam on teamid = id
WHERE gtime <= 10;
-- 6.List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
select mdate,
    teamname
from game g
    join eteam t on g.team1 = t.id
where coach = 'Fernando Santos';
-- 7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
select player
from goal
    join game on matchid = id
where stadium = 'National Stadium, Warsaw';
-- 8.The example query shows all goals scored in the Germany-Greece quarterfinal.
-- Instead show the name of all players who scored a goal against Germany.
SELECT distinct player
FROM game
    JOIN goal ON matchid = id
WHERE (
        team1 = 'GER'
        OR team2 = 'GER'
    )
    AND goal.teamid != 'GER';
-- 9.Show teamname and the total number of goals scored.
SELECT teamname,
    COUNT(player)
FROM eteam
    JOIN goal ON id = teamid
group by teamname
ORDER BY teamname;
-- 10.Show the stadium and the number of goals scored in each stadium
select stadium,
    count(player)
from game
    join goal on matchid = id
group by stadium;
-- 11.
SELECT matchid,
    mdate,
    COUNT(*)
FROM game
    JOIN goal ON (matchid = id)
WHERE (
        team1 = 'POL'
        OR team2 = 'POL'
    )
GROUP BY matchid,
    mdate;
-- 12.
SELECT matchid,
    mdate,
    COUNT(player)
FROM game
    JOIN goal ON id = matchid
WHERE goal.teamid = 'GER'
GROUP BY matchid,
    mdate;
--
SELECT mdate,
    team1,
    SUM(
        CASE
            WHEN teamid = team1 THEN 1
            ELSE 0
        END
    ) AS score1,
    team2,
    SUM(
        CASE
            WHEN teamid = team2 THEN 1
            ELSE 0
        END
    ) AS score2
FROM game
    LEFT JOIN goal ON id = matchid
GROUP BY mdate,
    matchid,
    team1,
    team2
ORDER BY mdate,
    matchid,
    team1,
    team2;