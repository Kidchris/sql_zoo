-- 1.Displays Nobel prizes for 1950.
SELECT yr,
    subject,
    winner
FROM nobel
WHERE yr = 1950;
--  2.Show who won the 1962 prize for Literature.
SELECT winner
FROM nobel
WHERE yr = 1962
    AND subject = 'Literature';
-- 3.Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr,
    subject
FROM nobel
WHERE winner = 'Albert Einstein';
-- 4.Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner
FROM nobel
WHERE yr >= 2000
    AND subject = 'Peace';
-- 5.Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT *
FROM nobel
WHERE subject = 'Literature'
    AND yr BETWEEN 1980 AND 1989;
--  6.
-- Show all details of the presidential winners:
-- Theodore Roosevelt
-- Woodrow Wilson
-- Jimmy Carter
-- Barack Obama
SELECT *
FROM nobel
WHERE winner IN (
        'Jimmy Carter',
        'Woodrow Wilson',
        'Barack Obama',
        'Theodore Roosevelt'
    );
-- 7.Show the winners with first name John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';
-- 8.Show the year, subject, and name of Physics winners 
-- for 1980 together with the Chemistry winners for 1984.
SELECT yr,
    subject,
    winner
FROM nobel
WHERE subject = 'Physics'
    AND yr = 1980
    OR subject = 'Chemistry'
    AND yr = 1984;
-- 9.Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT yr,
    subject,
    winner
FROM nobel
WHERE subject != 'Chemistry'
    AND subject != 'Medicine'
    AND yr = 1980;
-- 10.Early Medicine, Late Literature
SELECT yr,
    subject,
    winner
FROM nobel
WHERE (
        yr < 1910
        AND subject = 'Medicine'
    )
    OR (
        subject = 'Literature'
        AND yr >= 2004
    );
-- 11.Umerlaut
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';
-- 12.Apostrophe
SELECT *
FROM nobel
WHERE winner = 'EUGENE O\'NEILL';
--  13.Knights of the realm' 
SELECT winner,
    yr,
    subject
FROM nobel
WHERE winner LIKE 'Sir%';
-- 14. Chemistry AND PYSICS LAST
SELECT winner,
    subject
FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('Physics', 'Chemistry'),
    subject,
    winner;

