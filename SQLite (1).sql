SELECT * FROM movies; 

--find the director who directed the most movies
SELECT c2 as director, COUNT(*) as movie_count
from movies 
GROUP By c2 
ORDER By movie_count DESC
Limit 5;

-- find the average movie duration of each genre
SELECT c2 as director, AVG (c5) as avg_duration
FROM movies
GROUP By c2;

-- find the highest average rating
SELECT c3 as genre, AVG (c6) as avg_rating
FROM movies
GROUP By c3
ORDER BY avg_rating DESC
LIMIT 1;

-- find number of movies released each year
SELECT strftime ('%Y', c4) as release_year, COUNT (*) as movie_count
FROM movies
GROUP by release_year
ORDER BY release_year;

-- find number of longest movies 
SELECT c3 as genre, max(c5) as longest_movie_duration
from movies
GROUP BY c3;

-- find the movie with hight rating
SELECT * from movies order by c6 DESC Limit 20;
Select c1 as title, c6 as rating
from movies
order by c6 DESC 
LIMIT 10;

-- find average rating of the movies by director
SELECT c2 as director, avg(c6) as avg_rating
from movies
group by c2 order by avg_rating DESC;

--Find movies released in the last 5 years
SELECT c1 as title, c4 as release_date
from movies
where c4>= date ('now', '-5 years');

-- find movies with rating above 9 and a duration below 2 hours
SELECT c1 as title, c6 as rating, c5 as duration from movies
WHERE c6> 9 and c5<120;

-- find which genre has the most movies
SELECT c3 as genre, count(*) as movie_count from movies GROUP by c3 ORDER by movie_count DESC limit 10;

--Find the top-rated movies based on their ratings
SELECT c1 as title, c6 as rating from movies ORDER BY c6 DESC LIMIT 5;

-- Find the director associated with the top-rated movie
SELECT c2 as director, c1 as title, c6 as rating from movies ORDER by c6 DESC LIMIT 5;

--Identify the movie that has the longest runtime
SELECT c1 as title, c5 as duration from movies order by c5 DESC LIMIT 5;

--Find movies have "Action" in their genre and a rating above 7
SELECT c1 as title, c3 as genre, c6 as rating from movies WHERE c3 LIKE '%Action%' and c6 > 7;

--Get the longest movies in the dataset
SELECT c1 as title, c5 as duration from movies order by c5 DESC LIMIT 5;

--find how often the word 'Love' appears in movie titles
SELECT count(*) as love_movies_count from movies WHERE c1 LIKE '%Love%';

--find the movies were released between 2010 and 2020
SELECT c1 as title, c4 as release_date from movies where strftime ('%Y', release_date) BETWEEN '2010' and '2020';

--find how well movies with 'War' in their title perform
select AVG(c6) as avg_rating from movies WHERE c1 like '%War%';

--Look for movies that are critically acclaimed but shorter in length
SELECT c1 as title, c6 as rating, c5 as duration from movies order by c6 DESC, c5 ASC LIMIT 5;

--find what are the most common words in movie titles
SELECT lower (substr(c1, instr (c1, ' ')+1)) as common_word, count(*) as count_word from movies
group by common_word order by count_word desc LIMIT 10;
