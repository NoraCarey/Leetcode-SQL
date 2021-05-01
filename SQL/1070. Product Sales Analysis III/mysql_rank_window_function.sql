

SELECT product_id, year AS first_year, quantity, price
FROM (SELECT *,
             RANK() OVER(PARTITION BY product_id
                         ORDER BY year) AS ranking
      FROM Sales) a
WHERE ranking = 1;      


