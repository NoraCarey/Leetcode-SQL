

WITH cte AS (SELECT *, (id - ROW_NUMBER() OVER(ORDER BY ID)) AS grp 
             FROM (SELECT *
                   FROM Stadium
                   WHERE people >= 100) tbl)
                   
SELECT id, visit_date, people
FROM cte
WHERE grp IN (SELECT grp
              FROM cte
              GROUP BY grp
              HAVING COUNT(*) >= 3)
              
              
              
