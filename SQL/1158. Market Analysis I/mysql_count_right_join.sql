

SELECT user_id AS buyer_id, join_date, COUNT(order_id) AS orders_in_2019 
FROM (SELECT buyer_id, order_id
      FROM Orders
      WHERE YEAR(order_date) = 2019) a
RIGHT JOIN Users u ON a.buyer_id = u.user_id
GROUP BY user_id;

