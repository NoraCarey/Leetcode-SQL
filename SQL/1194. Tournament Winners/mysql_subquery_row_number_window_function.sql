

SELECT group_id, player_id
FROM (SELECT p.player_id, group_id,
             ROW_NUMBER() OVER(PARTITION BY group_id
                               ORDER BY total_scores DESC, p.player_id) AS ranking
      FROM (SELECT player_id, SUM(scores) AS total_scores
            FROM (SELECT first_player AS player_id, SUM(first_score) AS scores
                  FROM Matches
                  GROUP BY player_id
                  UNION ALL
                  SELECT second_player AS player_id, SUM(second_score) AS scores
                  FROM Matches
                  GROUP BY player_id) a
            GROUP BY player_id) b
      RIGHT JOIN Players p ON b.player_id = p.player_id) c
WHERE ranking = 1;


