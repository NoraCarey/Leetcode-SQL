

WITH RECURSIVE cte AS (SELECT @id := 1 AS id
                       UNION 
                       SELECT @id := @id + 1
                       FROM cte
                       WHERE id < (SELECT MAX(customer_id) FROM Customers))
                       

SELECT id AS ids
FROM cte
WHERE id NOT IN (SELECT customer_id
                 FROM Customers)
                 
                 
                 
