

WITH cte AS (SELECT a.name AS activity, COUNT(f.id) AS cnt
             FROM Activities a
             LEFT JOIN Friends f ON f.activity = a.name
             GROUP BY a.name)
             
             
SELECT activity
FROM cte
WHERE cnt != (SELECT MAX(cnt) FROM cte) AND
      cnt != (SELECT MIN(cnt) FROM cte)
      
      
      
