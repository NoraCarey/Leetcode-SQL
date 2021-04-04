

WITH cte1 AS (SELECT name, COUNT(movie_id) AS movie_count
              FROM Users u
              JOIN Movie_Rating r ON u.user_id = r.user_id
              GROUP BY name
              ORDER BY movie_count DESC, name
              LIMIT 1),
              
    cte2 AS (SELECT title, AVG(rating) AS avg_rating
             FROM Movie_Rating r
             JOIN Movies m ON r.movie_id = m.movie_id
             WHERE DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
             GROUP BY title
             ORDER BY avg_rating DESC, title
             LIMIT 1)
             
SELECT name AS results
FROM cte1
UNION
SELECT title AS results
FROM cte2;


