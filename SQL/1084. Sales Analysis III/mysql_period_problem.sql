

SELECT p.product_id, product_name
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY product_id
HAVING MAX(sale_date) <= '2019-03-31' AND MIN(sale_date) >= '2019-01-01';


