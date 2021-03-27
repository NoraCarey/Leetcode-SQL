

SELECT ROUND((SUM(CASE WHEN first_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(DISTINCT d.customer_id)) * 100, 2) AS immediate_percentage
FROM (SELECT customer_id, MIN(order_date) AS first_date
      FROM Delivery
      GROUP BY customer_id) a
LEFT JOIN Delivery d ON a.customer_id = d.customer_id;



