


WITH cte AS (SELECT account_id, MONTH(day) AS month,
                    SUM(amount) AS total_amount
             FROM Transactions
             WHERE type = 'Creditor'
             GROUP BY 1, 2)
            
            
SELECT DISTINCT account_id
FROM (SELECT a.account_id, (month - RANK() OVER(PARTITION BY a.account_id
                                                ORDER BY month)) AS grp
      FROM Accounts a
      JOIN cte c ON a.account_id = c.account_id
      WHERE total_amount > max_income) a
GROUP BY a.account_id, grp
HAVING COUNT(a.account_id) >= 2;



