

SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month, country, COUNT(id) AS trans_count,
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count, 
       IFNULL(SUM(amount), 0) AS trans_total_amount, 
       IFNULL(SUM(CASE WHEN state = 'approved' THEN amount END), 0) AS approved_total_amount
FROM Transactions
GROUP BY month, country;


