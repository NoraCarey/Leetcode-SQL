

WITH RECURSIVE cte AS (SELECT 1 AS customer_id
                       UNION ALL
                       SELECT customer_id + 1 AS customer_id
                       FROM cte
                       WHERE customer_id < (SELECT max(customer_id) FROM Customers))
                       
                       
SELECT customer_id AS ids
FROM cte
WHERE customer_id NOT IN (SELECT customer_id
                          FROM Customers)
ORDER BY 1;
                 
                 
                 
