

WITH recursive month_tbl AS (SELECT 1 AS month
                             UNION ALL
                             SELECT month + 1 AS month
                             FROM month_tbl
                             WHERE month < 12),
                             
               driver_tbl AS (SELECT CASE
                                         WHEN YEAR(join_date) = 2019 THEN 1 ELSE MONTH(join_date)
                                     END AS month,
                                     COUNT(driver_id) AS driver_nums
                              FROM Drivers
                              WHERE YEAR(join_date) < 2021
                              GROUP BY 1),
                              
               ride_tbl AS (SELECT MONTH(requested_at) AS month,
                                   COUNT(DISTINCT driver_id) AS ride_nums
                            FROM Rides r
                            JOIN AcceptedRides a ON r.ride_id = a.ride_id
                            WHERE YEAR(requested_at) = 2020
                            GROUP BY 1)
                            

SELECT m.month AS month, 
       ROUND(IFNULL((ride_nums / SUM(driver_nums) OVER(ORDER BY month)), 0) * 100, 2)  AS working_percentage
FROM month_tbl m
LEFT JOIN driver_tbl d ON m.month = d.month
LEFT JOIN ride_tbl r ON m.month = r.month;


