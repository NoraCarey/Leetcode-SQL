

SELECT player_id, event_date, 
      (SELECT SUM(games_played)
       FROM Activity 
       WHERE event_date <= a.event_date AND player_id = a.player_id) AS games_played_so_far 
FROM Activity a
ORDER BY player_id, event_date;


