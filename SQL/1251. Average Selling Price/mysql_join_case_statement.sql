

SELECT product_id, ROUND(SUM(price * units) / SUM(units), 2) AS average_price
FROM (SELECT p.product_id, price,
             CASE 
                 WHEN purchase_date BETWEEN start_date AND end_date THEN units
                 ELSE 0
             END AS units
      FROM Prices p
      JOIN UnitsSold u ON p.product_id = u.product_id) a
GROUP BY product_id;


