

SELECT c.customer_id, c.customer_name  
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY 1, 2
HAVING SUM(product_name = 'A') >= 1 AND SUM(product_name = 'B') >= 1 AND
       SUM(product_name = 'C') = 0
ORDER BY 1;


