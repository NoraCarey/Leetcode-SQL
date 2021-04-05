

SELECT install_dt, COUNT(player_id) AS installs, 
       ROUND(SUM(IF(second_login - install_dt = 1, 1, 0)) / COUNT(player_id), 2) AS Day1_retention
FROM (SELECT DISTINCT player_id, FIRST_VALUE(event_date) OVER(PARTITION BY player_id
                                                              ORDER BY event_date) AS install_dt,
                      NTH_VALUE(event_date, 2) OVER(PARTITION BY player_id
                                                    ORDER BY event_date
                                                    RANGE BETWEEN UNBOUNDED PRECEDING 
                                                          AND UNBOUNDED FOLLOWING) AS second_login
      FROM Activity) a
GROUP BY install_dt
ORDER BY install_dt;

