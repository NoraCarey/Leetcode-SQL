

WITH cte AS (SELECT v.user_id, v.visit_date, 
                    # to  calculate how many transactions happend when the user visit the bank
                    # using IFNULL() function to return 0 while there is no transaction for the user in the visiting date
                    IFNULL(COUNT(transaction_date), 0) AS transactions_count
             FROM Visits v
             LEFT JOIN Transactions t
             ON v.user_id = t.user_id AND v.visit_date = t.transaction_date
             GROUP BY 1, 2),
    # for the result table the transactions_count start from 0 to max(trasactions_count),
    # we build a new table to record the transactions_count in case the original table missing some numbers
    row_nums AS (SELECT ROW_NUMBER() OVER() AS num
                 FROM Transactions
                 UNION 
                 SELECT 0) 

SELECT num AS transactions_count, 
       # using COUNT(transactions_count) to calculate how many visitors did the transactions_count 
       # IFNULL() function returns 0 while there is no visitors did the transactions_count
       IFNULL(COUNT(transactions_count), 0) AS visits_count
FROM row_nums 
LEFT JOIN cte ON num = transactions_count
WHERE num <= (SELECT MAX(transactions_count) FROM cte)
GROUP BY num
ORDER BY num;


