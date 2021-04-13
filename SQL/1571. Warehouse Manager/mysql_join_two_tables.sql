

SELECT name AS warehouse_name, SUM(Width * Length * Height * units) AS volume
FROM Warehouse w
JOIN Products p ON w.product_id = p.product_id
GROUP BY 1;



