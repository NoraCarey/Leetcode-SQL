

SELECT a.player_id, player_name, COUNT(a.player_id) AS grand_slams_count
FROM (SELECT Wimbledon AS player_id
      FROM Championships
      UNION ALL 
      SELECT Fr_open AS player_id
      FROM Championships
      UNION ALL 
      SELECT US_open AS player_id
      FROM Championships
      UNION ALL
      SELECT Au_open AS player_id
      FROM Championships) a
JOIN Players p ON a.player_id = p.player_id
GROUP BY a.player_id, player_name;



