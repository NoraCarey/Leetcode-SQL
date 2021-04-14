

WITH cte AS (SELECT t1.machine_id, t1.process_id, (t2.timestamp - t1.timestamp) AS time_diff
             FROM Activity t1, Activity t2
             WHERE t1.machine_id = t2.machine_id AND t1.process_id = t2.process_id AND
                   t1.activity_type = 'start' AND t2.activity_type = 'end')
                   

SELECT machine_id, ROUND(SUM(time_diff) / COUNT(process_id), 3) AS processing_time
FROM cte 
GROUP BY machine_id
ORDER BY processing_time;




