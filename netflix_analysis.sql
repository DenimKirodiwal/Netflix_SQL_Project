-- Netflix Data Analysis using SQL

CREATE TABLE netflix
(
	show_id	VARCHAR(5),
	type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);

SELECT * FROM netflix;


--  15 business problems

-- 1. Count the number of Movies vs TV Shows
SELECT type,COUNT(*) as total_count
FROM netflix
GROUP BY 1;

-------------------------------------------------------------------------------------

-- 2. Find the most common rating for movies and TV shows
SELECT type,rating,COUNT(*) 
FROM netflix
GROUP BY 1 , 2
ORDER BY 1,3 DESC;

-------------------------------------------------------------------------------------

-- 3. List all movies released in a specific year (e.g., 2020)
SELECT *
FROM netflix
WHERE type = 'Movie' AND release_year = 2020;

-------------------------------------------------------------------------------------

-- 4. Find the top 5 countries with the most content on Netflix
SELECT
	UNNEST(STRING_TO_ARRAY(country,',')) as New_Country,
	COUNT(show_id)
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-------------------------------------------------------------------------------------

-- 5. Identify the longest movie
SELECT title , duration
FROM netflix
WHERE type = 'Movie' AND duration = (SELECT MAX(duration) FROM netflix)

-------------------------------------------------------------------------------------

-- 6. Find content added in the last 5 years
SELECT * 
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'

-------------------------------------------------------------------------------------

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT * FROM
(
SELECT * , UNNEST(STRING_TO_ARRAY(director, ',')) as director_name
FROM netflix
)
WHERE director_name = 'Rajiv Chilaka'

-------------------------------------------------------------------------------------

-- 8. List all TV shows with more than 5 seasons
SELECT type,title,duration 
FROM netflix
WHERE 
	type = 'TV Show'
	AND
	SPLIT_PART(duration,' ',1)::INT >= 5;

-------------------------------------------------------------------------------------

-- 9. Count the number of content items in each genre
SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in , ',')) as Genre,
	COUNT(show_id) as Total_Content
FROM netflix
GROUP BY 1
ORDER BY 2;

-------------------------------------------------------------------------------------

-- 10. Find each year and the average numbers of content release by India on netflix. 
--     return top 5 year with highest avg content release !
SELECT 
	country,
	release_year,
	COUNT(show_id) as total_release,
	ROUND(
		COUNT(show_id)::numeric/
	    (SELECT COUNT(show_id) FROM netflix WHERE country = 'India')::numeric * 100 
		,2
		)
		as avg_release
FROM netflix
WHERE country = 'India' 
GROUP BY country, 2
ORDER BY avg_release DESC 
LIMIT 5

-------------------------------------------------------------------------------------

-- 11. List all movies that are documentaries
SELECT title,listed_in 
FROM netflix
WHERE listed_in LIKE '%Documentaries%' AND type = 'Movie';

-------------------------------------------------------------------------------------

-- 12. Find all content without a director
SELECT * FROM netflix
WHERE director IS NULL

-------------------------------------------------------------------------------------
-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
SELECT * FROM netflix
WHERE 
	casts LIKE '%Salman Khan%'
	AND 
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

-------------------------------------------------------------------------------------

-- 14. Find the top 10 actors who have appeared in the highest number of movies
--     produced in India.
SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*) as total_movies
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

-------------------------------------------------------------------------------------

/*
Question 15:
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.
*/
SELECT 
	category,
	type,
    COUNT(*) AS content_count
FROM (
    SELECT 
		*,
        CASE 
            WHEN description ILIKE '%kill%' 
			OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY 1,2
ORDER BY 2
