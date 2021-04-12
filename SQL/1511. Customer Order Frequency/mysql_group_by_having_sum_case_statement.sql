

SELECT c.customer_id, c.name
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id 
JOIN Product p ON p.product_id = o.product_id
GROUP BY 1, 2
HAVING SUM(CASE WHEN DATE_FORMAT(order_date, '%Y-%m') = '2020-06' THEN o.quantity * p.price ELSE 0 END) >= 100 AND 
       SUM(CASE WHEN DATE_FORMAT(order_date, '%Y-%m') = '2020-07' THEN o.quantity * p.price ELSE 0 END) >= 100
       
       
       
