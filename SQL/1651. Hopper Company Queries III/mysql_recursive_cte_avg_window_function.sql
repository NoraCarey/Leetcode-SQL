

WITH recursive month_tbl AS (SELECT 1 AS month
                             UNION ALL
                             SELECT month + 1 AS month
                             FROM month_tbl
                             WHERE month < 12),
                             
               ride_tbl AS (SELECT MONTH(requested_at) AS month,
                                   SUM(ride_distance) AS distance,
                                   SUM(ride_duration) AS duration
                            FROM Rides r
                            JOIN AcceptedRides a ON a.ride_id = r.ride_id
                            WHERE YEAR(requested_at) = 2020
                            GROUP BY 1)
                            

SELECT m.month AS month,       
       ROUND(AVG(IFNULL(distance, 0)) OVER(ORDER BY month ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING), 2) AS average_ride_distance,
       ROUND(AVG(IFNULL(duration,0)) OVER(ORDER BY month ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING), 2) AS  average_ride_duration
FROM month_tbl m 
LEFT JOIN ride_tbl r ON m.month = r.month
LIMIT 10;





