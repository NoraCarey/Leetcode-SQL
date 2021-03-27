

SELECT a.spend_date, a.platform, 
       IFNULL(SUM(amount), 0) AS total_amount,
       COUNT(user_id) as total_users
FROM (SELECT DISTINCT(spend_date), 'mobile' AS platform FROM Spending
      UNION ALL 
      SELECT DISTINCT(spend_date), 'desktop' AS platform FROM Spending
      UNION ALL
      SELECT DISTINCT(spend_date), 'both' AS platform FROM Spending) a
LEFT JOIN (SELECT user_id, spend_date, 
                  CASE WHEN COUNT(*) = 1 THEN platform ELSE 'both' END AS platform,
                  SUM(amount) AS amount
           FROM Spending
           GROUP BY user_id, spend_date) b
ON a.spend_date = b.spend_date AND a.platform = b.platform
GROUP BY a.spend_date, a.platform;


