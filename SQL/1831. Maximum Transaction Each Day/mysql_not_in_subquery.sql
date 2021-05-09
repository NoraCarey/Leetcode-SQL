

SELECT transaction_id
FROM Transactions
WHERE (DATE(day), amount) IN (SELECT DATE(day), MAX(amount)
                              FROM Transactions
                              GROUP BY 1)
ORDER BY 1;


