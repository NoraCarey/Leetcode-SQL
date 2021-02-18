

WITH cte AS (SELECT id, 
                    Temperature - LAG(Temperature) OVER(ORDER BY recordDate) AS temperature_diff,
                    DATEDIFF(recordDate, LAG(recordDate) OVER(ORDER BY recordDate)) AS date_diff
             FROM Weather)
            
    
SELECT id
FROM cte
WHERE temperature_diff > 0 AND date_diff = 1;

