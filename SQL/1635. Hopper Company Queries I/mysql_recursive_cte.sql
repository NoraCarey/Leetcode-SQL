


WITH recursive cte1 AS (SELECT 1 AS month
                        UNION ALL
                        SELECT month + 1 AS month
                        FROM cte1
                        WHERE month < 12),
                        
               cte2 AS (SELECT CASE
                                   WHEN YEAR(join_date) = 2019 THEN 1 ELSE MONTH(join_date) END AS month,
                               COUNT(driver_id) AS driver_nums
                        FROM Drivers
                        WHERE YEAR(join_date) < 2021
                        GROUP BY 1),
            
               cte3 AS (SELECT MONTH(requested_at) AS month, COUNT(r.ride_id) AS accepted_rides
                        FROM Rides r
                        JOIN AcceptedRides a ON r.ride_id = a.ride_id
                        WHERE YEAR(requested_at) = 2020
                        GROUP BY 1)
                        
SELECT cte1.month AS month, 
       IFNULL(SUM(driver_nums) OVER(ORDER BY month), 0) AS active_drivers,
       IFNULL(accepted_rides, 0) AS accepted_rides
FROM cte1
LEFT JOIN cte2 ON cte1.month = cte2.month
LEFT JOIN cte3 ON cte1.month = cte3.month;



