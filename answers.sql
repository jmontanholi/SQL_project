MODULE 0
0.1. 
SELECT population FROM world
  WHERE name = 'Germany'
-------------------------------
0.2. 
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
-------------------------------
0.3.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
------------------------------- 
MODULE 1
1.1.
SELECT name FROM world
  WHERE name LIKE 'Y%'
-------------------------------
1.2.
SELECT name FROM world
  WHERE name LIKE '%Y'
-------------------------------
1.3.
SELECT name FROM world
  WHERE name LIKE '%X%'
-------------------------------
1.4.
SELECT name FROM world
  WHERE name LIKE '%land'
-------------------------------
1.5.
SELECT name FROM world
  WHERE name LIKE 'C%ia'
-------------------------------
1.6.
SELECT name FROM world
  WHERE name LIKE '%oo%'
-------------------------------
1.7.
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
-------------------------------
1.8.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name
-------------------------------
1.9.
SELECT name FROM world
 WHERE name LIKE '%o__o%'
-------------------------------
1.10.
SELECT name FROM world
 WHERE name LIKE '____'
-------------------------------
1.11.
SELECT name
  FROM world
 WHERE name LIKE capital
-------------------------------
1.12.
SELECT name
  FROM world
 WHERE capital LIKE concat(name,' City')
-------------------------------
1.13.
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%')
-------------------------------
1.14.
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%_')
-------------------------------
1.15.
SELECT name, REPLACE(capital, name,'')
FROM world
WHERE capital LIKE concat(name,'_%')
-------------------------------
MODULE 2
2.1.
SELECT name, continent, population FROM world
-------------------------------
2.2.
SELECT name
  FROM world
 WHERE population > 200000000
-------------------------------
2.3.
SELECT name, gdp/population
FROM world
WHERE population > 200000000
-------------------------------
2.4.
SELECT name, population/1000000
FROM world
WHERE continent = 'South America'
-------------------------------
2.5.
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')
-------------------------------
2.6.
SELECT name
FROM world
WHERE name LIKE '%United%'
-------------------------------
2.7.
SELECT name, population, area 
FROM world 
WHERE population > 250000000 OR area > 3000000
-------------------------------
2.8.
SELECT name, population, area 
FROM world 
WHERE area > 3000000 XOR population > 250000000
-------------------------------
2.9.
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world 
WHERE continent = 'South America'
-------------------------------
2.10.
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp > 1000000000000
-------------------------------
2.11.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)
-------------------------------
2.12.
SELECT name, capital 
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital
-------------------------------
2.13.
SELECT name
FROM world
WHERE name LIKE '%u%' 
  and name LIKE '%a%' 
  and name LIKE '%o%' 
  and name LIKE '%i%'
  and name LIKE '%e%'
  and name NOT LIKE '% %'
-------------------------------
MODULE 3
3.1.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
-------------------------------
3.2.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
-------------------------------
3.3.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'
-------------------------------
3.4.
SELECT winner 
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000
-------------------------------
3.5.
SELECT * 
FROM nobel
WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989
-------------------------------
3.6.
SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')
-------------------------------
3.7.
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'
-------------------------------
3.8.
SELECT *
FROM nobel
WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984
-------------------------------
3.9.
SELECT * 
FROM nobel
WHERE yr = 1980
  AND subject <> 'Chemistry'
  AND subject <> 'Medicine'
-------------------------------
3.10.
SELECT * 
FROM nobel
WHERE subject = 'Medicine' AND yr < 1910
   OR subject = 'Literature' AND yr >= 2004
-------------------------------
3.11.
SELECT *
FROM nobel
WHERE winner LIKE 'PETER Gr_nberg'
-------------------------------
3.12.
SELECT *
FROM nobel
WHERE winner LIKE 'EUGENE O_NEILL'
-------------------------------
3.13.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr desc, winner
-------------------------------
3.14.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner
-------------------------------
MODULE 4
4.1.
SELECT name
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Russia')
-------------------------------
4.2.
SELECT name 
FROM world 
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')
-------------------------------
4.3.
SELECT name, continent
FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') OR continent = (SELECT continent FROM world WHERE name = 'Australia') 
ORDER BY name
-------------------------------
4.4.
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')
-------------------------------
4.5.
SELECT name, CONCAT(ROUND((population*100)/(SELECT population FROM world WHERE name = 'Germany'),0), '%') AS percentage
FROM world
WHERE continent = 'Europe'
-------------------------------
4.6.
SELECT name 
FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe')
-------------------------------
4.7.
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area > 0)
-------------------------------
4.8.
SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent)
-------------------------------
4.9.
SELECT name, continent, population FROM world x
  WHERE 25000000 >= ALL
    (SELECT population FROM world y
       WHERE y.continent = x.continent)
-------------------------------
4.10.
SELECT name, continent
FROM world x
  WHERE x.population/3 > ALL
    (SELECT population FROM world y
        WHERE y.continent = x.continent AND x.name != y.name)
-------------------------------
MODULE 5
5.1.
SELECT SUM(population)
FROM world
-------------------------------
5.2.
SELECT DISTINCT continent FROM world
-------------------------------
5.3.
SELECT SUM(gdp) FROM world
WHERE continent = 'Africa'
-------------------------------
5.4.
SELECT COUNT(name) 
FROM world
WHERE area > 1000000
-------------------------------
5.5.
SELECT SUM(population) 
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
-------------------------------
5.6.
SELECT continent, COUNT(name) 
FROM world
GROUP BY continent
-------------------------------
5.7.
SELECT continent, COUNT(name) 
FROM world
WHERE population > 10000000
GROUP BY continent
-------------------------------
5.8.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000
-------------------------------
MODULE 6
6.1.
SELECT matchid, player FROM goal 
WHERE teamid= 'GER'
-------------------------------
6.2.
SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012
-------------------------------
6.3.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
    WHERE teamid = 'GER'
-------------------------------
6.4.
SELECT team1, team2, player
FROM game
INNER JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'
-------------------------------
6.5.
SELECT player, teamid, coach, gtime
  FROM goal
INNER JOIN eteam ON teamid=id
 WHERE gtime<=10
-------------------------------
6.6.
SELECT mdate, teamname
FROM game JOIN eteam
ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'
-------------------------------
6.7.
Select player 
FROM goal 
JOIN game ON (matchid = id) 
WHERE stadium = 'National Stadium, Warsaw'
-------------------------------
6.8.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid!='GER'
-------------------------------
6.9.
SELECT teamname, COUNT(player)
FROM goal 
JOIN eteam ON id = teamid
GROUP BY teamname
-------------------------------
6.10.
SELECT stadium, COUNT(matchid) AS 'All goals'
FROM game 
JOIN goal ON matchid = id
GROUP BY stadium
-------------------------------
6.11.
SELECT DISTINCT matchid, mdate, COUNT(teamid)
FROM game
JOIN goal ON matchid = id
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid, mdate
-------------------------------
6.12.
SELECT matchid, mdate, COUNT(player)
FROM game
JOIN goal ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid,mdate
-------------------------------
6.13.
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
    game LEFT JOIN goal ON (id = matchid)
    GROUP BY mdate,team1,team2
    ORDER BY mdate, matchid, team1, team2
-------------------------------
MODULE 7
7.1.
SELECT id, title
 FROM movie
 WHERE yr=1962
-------------------------------
7.2.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'
-------------------------------
7.3.
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr
-------------------------------
7.4.
SELECT id
FROM actor
WHERE name = 'Glenn Close'
-------------------------------
7.5.
SELECT id 
FROM movie
WHERE title = 'Casablanca'
-------------------------------
7.6.
SELECT name
FROM actor
INNER JOIN casting ON id = actorid
WHERE movieid = 11768
-------------------------------
7.7.
SELECT name
FROM actor
INNER JOIN casting ON id = actorid
INNER JOIN movie ON movie.id = casting.movieid
WHERE title = 'Alien'
-------------------------------
7.8.
SELECT title
FROM movie
INNER JOIN casting ON movie.id = casting.movieid
INNER JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'
-------------------------------
7.9.
SELECT title
FROM movie
INNER JOIN casting ON movie.id = casting.movieid
INNER JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford' AND ord > 1
-------------------------------
7.10.
SELECT title, name
FROM movie
INNER JOIN casting ON movie.id = casting.movieid
INNER JOIN actor ON casting.actorid = actor.id
WHERE yr = 1962 AND ord = 1
-------------------------------
7.11.
SELECT yr, COUNT(title)
FROM movie
INNER JOIN casting ON movie.id = casting.movieid
INNER JOIN actor ON actor.id = casting.actorid
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
-------------------------------
7.12.
SELECT title, name
FROM movie
INNER JOIN casting ON movie.id = casting.movieid
INNER JOIN actor on actor.id = casting.actorid
WHERE movie.id IN (SELECT casting.movieid
FROM casting
WHERE casting.actorid = 179) AND ord = 1
-------------------------------
7.13.
SELECT name 
FROM actor 
JOIN casting ON actor.id = actorid 
WHERE ord = 1 
GROUP BY name
HAVING COUNT(movieid) >= 15
-------------------------------
7.14.
SELECT title, COUNT(actorid)
FROM movie
JOIN casting ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title
-------------------------------
7.15.
SELECT DISTINCT name 
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE director = 'Art Garfunkel' OR movieid IN (SELECT movieid FROM casting WHERE actorid = 1112) AND name != 'Art Garfunkel'
-------------------------------
MODULE 8
8.1.
SELECT name
FROM teacher 
WHERE dept IS NULL
-------------------------------
8.2.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
-------------------------------
8.3.
SELECT DISTINCT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON teacher.dept = dept.id
-------------------------------
8.4.
SELECT teacher.name, dept.name
FROM teacher RIGHT join dept
ON teacher.dept = dept.id
-------------------------------
8.5.
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher
-------------------------------
8.6.
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id
-------------------------------
8.7.
SELECT COUNT(name), COUNT(mobile)
FROM teacher
-------------------------------
8.8.
SELECT dept.name, COUNT(teacher.name)
FROM dept
LEFT JOIN teacher ON teacher.dept = dept.id
GROUP BY dept.name
-------------------------------
8.9.
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci'
     ELSE 'Art'
     END
FROM teacher
-------------------------------
8.10.
SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci'
     WHEN dept = 3 THEN 'Art'
     ELSE 'None'
     END
FROM teacher
-------------------------------
MODULE 9
9.1.
SELECT COUNT(id)
FROM stops
-------------------------------
9.2.
SELECT id
FROM stops
WHERE name = 'Craiglockhart'
-------------------------------
9.3.
SELECT id, name
FROM stops
JOIN route ON stops.id = route.stop
WHERE company = 'LRT' AND num = '4'
-------------------------------
9.4.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2
-------------------------------
9.5.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149
-------------------------------
9.6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'
-------------------------------
9.7.
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop =137
-------------------------------
9.8.
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross'
-------------------------------
9.9.
SELECT DISTINCT stopb.name, b.company, b.num
FROM route a
JOIN route b ON (a.num = b.num AND a.company = b.company)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart'
-------------------------------
9.10.
-------------------------------
