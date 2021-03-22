

SELECT ROUND(AVG(daily_percent) * 100, 2) AS average_daily_percent
FROM (SELECT COUNT(DISTINCT r.post_id) / COUNT(DISTINCT tbl.post_id) AS daily_percent
      FROM (SELECT post_id, action_date
            FROM Actions
            WHERE extra = 'spam') tbl
      LEFT JOIN Removals r ON tbl.post_id = r.post_id
      GROUP BY action_date) a
      
      
