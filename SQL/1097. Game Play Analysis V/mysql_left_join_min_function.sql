

SELECT install_dt, COUNT(player_id) AS installs,
       ROUND(COUNT(event_date) / COUNT(player_id), 2) AS Day1_retention
FROM (SELECT b.player_id, install_dt, event_date
      FROM (SELECT player_id, MIN(event_date) AS install_dt
            FROM Activity
            GROUP BY player_id) b
      LEFT JOIN Activity a 
      ON b.player_id = a.player_id AND
         b.install_dt + 1 = a.event_date) tbl
GROUP BY install_dt;


