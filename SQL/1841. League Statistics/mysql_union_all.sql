

WITH cte AS (SELECT home_team_id AS team_id, home_team_goals AS goal_for, 
                    away_team_goals AS goal_against, 
                    CASE
                        WHEN home_team_goals = away_team_goals THEN 1
                        WHEN home_team_goals > away_team_goals THEN 3
                        WHEN home_team_goals < away_team_goals THEN 0
                    END AS point
             FROM Matches
             UNION ALL
             SELECT away_team_id AS team_id, away_team_goals AS goal_for, 
                    home_team_goals AS goal_against, 
                    CASE
                        WHEN home_team_goals = away_team_goals THEN 1
                        WHEN home_team_goals < away_team_goals THEN 3
                        WHEN home_team_goals > away_team_goals THEN 0
                    END AS point
             FROM Matches)
             

SELECT team_name, COUNT(cte.team_id) AS matches_played, SUM(point) AS points,
       SUM(goal_for) AS goal_for, SUM(goal_against) AS goal_against, 
       (SUM(goal_for) - SUM(goal_against)) AS goal_diff
FROM cte      
JOIN Teams t ON t.team_id = cte.team_id
GROUP BY team_name
ORDER BY 3 DESC, 6 DESC, 1;


