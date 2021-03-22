


SELECT IFNULL(ROUND(SUM(session_count) / COUNT(user_id), 2), 0) AS average_sessions_per_user
FROM (SELECT user_id, COUNT(DISTINCT session_id) AS session_count
      FROM Activity
      WHERE DATEDIFF('2019-07-27', activity_date) < 30
      GROUP BY user_id) a
      
      
      
