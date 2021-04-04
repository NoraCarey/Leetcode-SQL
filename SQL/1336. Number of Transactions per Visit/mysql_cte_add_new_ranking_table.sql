

WITH cte AS (SELECT v.user_id, v.visit_date, 
                    IFNULL(COUNT(transaction_date), 0) AS transactions_count
             FROM Transactions t
             RIGHT JOIN Visits v
             ON t.user_id = v.user_id AND t.transaction_date = v.visit_date
             GROUP BY 1, 2),
     row_nums AS (SELECT ROW_NUMBER() OVER () as ranking 
                  FROM Transactions 
                  UNION 
                  SELECT 0) 

SELECT ranking as transactions_count, IFNULL(COUNT(transactions_count), 0) AS visits_count
FROM cte 
RIGHT JOIN row_nums ON transactions_count = ranking
WHERE ranking <= (SELECT MAX(transactions_count) FROM cte)
GROUP BY ranking
ORDER BY 1


