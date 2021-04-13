

SELECT customer_id, product_id, product_name
FROM (SELECT customer_id, product_id, product_name, order_num, 
             RANK() OVER(PARTITION BY customer_id
                         ORDER BY order_num DESC) AS ranking
      FROM (SELECT DISTINCT c.customer_id, p.product_id, product_name,
                   COUNT(o.order_id) OVER(PARTITION BY c.customer_id, 
                                                       p.product_id) AS order_num
            FROM Customers c 
            JOIN Orders o ON c.customer_id = o.customer_id
            JOIN Products p ON p.product_id = o.product_id) a) b
WHERE ranking = 1;


