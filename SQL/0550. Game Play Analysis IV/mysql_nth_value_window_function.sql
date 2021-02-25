

WITH cte AS (SELECT DISTINCT player_id, 
                    DATEDIFF((FIRST_VALUE(event_date) OVER(PARTITION BY player_id
                                                            ORDER BY event_date)),
                    (NTH_VALUE(event_date, 2) OVER(PARTITION BY player_id
                                               ORDER BY event_date))) AS date_diff
             FROM Activity)


SELECT ROUND((SUM(CASE WHEN date_diff = -1 THEN 1 ELSE 0 END) / COUNT(DISTINCT player_id)), 2) 
       AS fraction
FROM cte;


