

(SELECT name AS results
 FROM Users u
 JOIN Movie_Rating r ON u.user_id = r.user_id
 GROUP BY name
 ORDER BY COUNT(movie_id) DESC, name
 LIMIT 1)
UNION
(SELECT title AS results
 FROM Movie_Rating r
 JOIN Movies m ON r.movie_id = m.movie_id
 WHERE DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
 GROUP BY title
 ORDER BY AVG(rating) DESC, title
 LIMIT 1);
 
 
 
 
