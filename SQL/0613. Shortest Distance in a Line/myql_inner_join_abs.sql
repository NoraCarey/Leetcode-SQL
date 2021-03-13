
# Assume there is no duplicate point in the table

WITH cte AS (SELECT x, ROW_NUMBER() OVER() AS ranking
             FROM point)
             

SELECT ABS(t1.x - t2.x) AS shortest
FROM cte t1
JOIN cte t2 ON t1.ranking != t2.ranking
ORDER BY shortest
LIMIT 1;

