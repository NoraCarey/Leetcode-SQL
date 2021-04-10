

WITH RECURSIVE cte AS (SELECT MIN(period_start) AS date
                       FROM Sales
                       UNION ALL
                       SELECT DATE_ADD(date, INTERVAL 1 DAY) AS date
                       FROM cte
                       WHERE date <= ALL(SELECT MAX(period_end) FROM Sales))

SELECT s.product_id, p.product_name, LEFT(date, 4) AS report_year,
       SUM(average_daily_sales) AS total_amount
FROM Product p 
JOIN Sales s ON p.product_id = s.product_id
JOIN cte c ON c.date >= s.period_start AND c.date <= s.period_end
GROUP BY 1, 2, 3
ORDER BY 1, 3;


