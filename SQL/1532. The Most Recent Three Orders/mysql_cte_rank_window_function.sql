

WITH cte AS (SELECT name AS customer_name, o.customer_id AS customer_id, 
                    order_id, order_date,
                    RANK() OVER(PARTITION BY o.customer_id
                                ORDER BY order_date DESC) AS ranking
             FROM Customers c
             JOIN Orders o ON c.customer_id = o.customer_id)
             
SELECT customer_name, customer_id, order_id, order_date
FROM cte
WHERE ranking <= 3
ORDER BY customer_name, customer_id, order_date DESC;



