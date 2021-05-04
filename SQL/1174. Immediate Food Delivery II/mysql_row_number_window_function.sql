

SELECT ROUND((SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(delivery_id)) * 100, 2) AS immediate_percentage
FROM (SELECT *,
             ROW_NUMBER() OVER(PARTITION BY customer_id
                               ORDER BY order_date) AS ranking
      FROM Delivery) a
WHERE ranking = 1;


