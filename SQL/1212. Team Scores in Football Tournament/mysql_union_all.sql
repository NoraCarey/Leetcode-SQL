

SELECT t.team_id, team_name, IFNULL(scores, 0) AS num_points
FROM (SELECT team_id, SUM(score) AS scores
      FROM (SELECT host_team AS team_id, 
                   CASE 
                       WHEN host_goals > guest_goals THEN 3
                       WHEN host_goals = guest_goals THEN 1
                       WHEN host_goals < guest_goals THEN 0
                   END AS score
            FROM Matches
            UNION ALL
            SELECT guest_team AS team_id, 
                   CASE 
                       WHEN guest_goals > host_goals THEN 3
                       WHEN guest_goals = host_goals THEN 1
                       WHEN guest_goals < host_goals THEN 0
                   END AS score
            FROM Matches) a
      GROUP BY team_id) b
RIGHT JOIN Teams t ON t.team_id = b.team_id
ORDER BY num_points DESC, t.team_id;

