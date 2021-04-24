

WITH cte AS (SELECT transaction_id, RANK() OVER(PARTITION BY DATE(day)
                                                ORDER BY amount DESC) AS ranking
             FROM Transactions)
    
SELECT transaction_id
FROM cte
WHERE ranking = 1
ORDER BY transaction_id;


