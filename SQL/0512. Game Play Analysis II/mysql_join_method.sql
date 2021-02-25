

SELECT a.player_id, a.device_id
FROM (SELECT player_id, MIN(event_date) AS first_login
      FROM Activity
      GROUP BY player_id) tbl
JOIN Activity a ON a.player_id = tbl.player_id AND a.event_date = tbl.first_login;

