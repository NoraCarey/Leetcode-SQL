

SELECT u.user_id, user_name, (credit + IFNULL(SUM(amount), 0)) AS credit, 
       CASE WHEN (credit + IFNULL(SUM(amount), 0)) < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached 
FROM (SELECT paid_by AS user_id, -amount AS amount
      FROM Transactions
      UNION ALL
      SELECT paid_to AS user_id, amount AS amount
      FROM Transactions) a
RIGHT JOIN Users u ON a.user_id = u.user_id
GROUP BY u.user_id;
