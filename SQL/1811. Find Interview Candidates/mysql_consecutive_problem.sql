

(SELECT name, mail
 FROM Contests c
 JOIN Users u ON c.gold_medal = u.user_id
 GROUP BY u.user_id
 HAVING COUNT(u.user_id) >= 3)
UNION
(SELECT name, mail
 FROM (SELECT user_id, contest_id,
              (contest_id - RANK() OVER(PARTITION BY user_id
                                        ORDER BY contest_id)) AS grp
       FROM (SELECT contest_id, gold_medal AS user_id
             FROM Contests 
             UNION ALL
             SELECT contest_id, silver_medal AS user_id
             FROM Contests 
             UNION ALL
             SELECT contest_id, bronze_medal AS user_id
             FROM Contests) a) b
 JOIN Users u ON b.user_id = u.user_id
 GROUP BY b.user_id, grp
 HAVING COUNT(contest_id) >= 3)
 
 
 
