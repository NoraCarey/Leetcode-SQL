

SELECT DISTINCT u.user_id, user_name, (credit + IFNULL(amount, 0)) AS credit,
       CASE 
           WHEN  (credit + IFNULL(amount, 0)) >= 0 THEN 'No'
           ELSE 'Yes'
       END credit_limit_breached 
FROM (SELECT user_id, SUM(amount) AS amount
      FROM (SELECT paid_by AS user_id, (-amount) AS amount
            FROM Transactions 
            UNION ALL
            SELECT paid_to AS user_id, amount
            FROM Transactions) a
      GROUP BY user_id) b
RIGHT JOIN Users u ON u.user_id = b.user_id;


