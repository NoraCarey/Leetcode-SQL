

SELECT a.spend_date, a.platform, 
       IFNULL(SUM(amount), 0) AS total_amount,
       COUNT(user_id) as total_users
FROM (SELECT DISTINCT(spend_date), 'desktop' platform FROM Spending
      UNION ALL
      SELECT DISTINCT(spend_date), 'mobile' platform FROM Spending
      UNION ALL
      SELECT DISTINCT(spend_date), 'both' platform FROM Spending) a
LEFT JOIN (SELECT user_id, spend_date, 
                  IF(mobile_amount != 0, (IF(desktop_amount != 0, 'both', 'mobile')), 'desktop') AS platform,
                  (mobile_amount + desktop_amount) AS amount
           FROM (SELECT user_id, spend_date,
                        SUM(CASE WHEN platform = 'mobile' THEN amount ELSE 0 END) AS mobile_amount,
                        SUM(CASE WHEN platform = 'desktop' THEN amount ELSE 0 END) AS desktop_amount
                 FROM Spending
                 GROUP BY user_id, spend_date) b) c
ON a.spend_date = c.spend_date AND a.platform = c.platform
GROUP BY a.spend_date, a.platform
ORDER BY a.spend_date;


