

WITH cte AS (SELECT product_name, p.product_id AS product_id, 
                    o.order_id AS order_id, order_date,
                    RANK() OVER(PARTITION BY product_name
                                ORDER BY order_date DESC) AS ranking
             FROM Customers c
             JOIN Orders o ON c.customer_id = o.customer_id
             JOIN Products p ON p.product_id = o.product_id)
             
             
SELECT product_name, product_id, order_id, order_date
FROM cte
WHERE ranking = 1
ORDER BY product_name, product_id, order_id;



