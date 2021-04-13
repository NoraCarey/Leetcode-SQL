

SELECT customer_id, product_id, product_name
FROM (SELECT c.customer_id, p.product_id, product_name,
             RANK() OVER(PARTITION BY customer_id
                         ORDER BY COUNT(o.order_id) DESC) AS ranking
      FROM Customers c 
      JOIN Orders o ON c.customer_id = o.customer_id
      JOIN Products p ON p.product_id = o.product_id
      GROUP BY c.customer_id, p.product_id) a
WHERE ranking = 1;


