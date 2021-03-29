

SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month, country, 
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_amount,
       SUM(CASE WHEN state = 'chargeback' THEN 1 ELSE 0 END) AS chargeback_count,
       SUM(CASE WHEN state = 'chargeback' THEN amount ELSE 0 END) AS chargeback_amount
FROM (SELECT trans_id AS id, country, 'chargeback' AS state, amount, c.trans_date AS trans_date
      FROM Chargebacks c
      LEFT JOIN Transactions t ON t.id = c.trans_id
      UNION ALL
      SELECT *
      FROM Transactions) a
GROUP BY month, country
HAVING approved_count + approved_amount + chargeback_count + chargeback_amount != 0;


