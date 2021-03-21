

WITH cte AS (SELECT *, 
                    -- re-rank the visit dates that have more than 100 visitors 
                    -- the larger difference between id and rank, the more visit dates that have visitors less than 100 in the table
                    (id - ROW_NUMBER() OVER(ORDER BY ID)) AS grp 
            
             -- select the visit date that have more than 100 visitors                                  
             FROM (SELECT *
                   FROM Stadium
                   WHERE people >= 100) tbl)
                   
SELECT id, visit_date, people
FROM cte
WHERE grp IN (-- If ids were consecutive, the difference between the id and re-rank number would be the same. 
              -- If it's not, then the current number is a new island
              SELECT grp
              FROM cte
              GROUP BY grp
              HAVING COUNT(*) >= 3)
              
              
              
