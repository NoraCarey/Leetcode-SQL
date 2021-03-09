

SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING COUNT(order_number) >= ALL (SELECT COUNT(order_number)
                                   FROM Orders
                                   GROUP BY customer_number);
                                   
                                   
