

WITH cte AS (SELECT x, y, ROW_NUMBER() OVER() AS ranking
             FROM point_2d)
             

SELECT ROUND(SQRT(POW((t1.x - t2.x) , 2) + POW((t1.y - t2.y), 2)), 2) AS shortest
FROM cte t1
JOIN cte t2 ON t1.ranking != t2.ranking
ORDER BY shortest 
LIMIT 1;


