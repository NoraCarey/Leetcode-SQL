

SELECT product_id, sales.year AS first_year, quantity, price
FROM Sales
WHERE (product_id, sales.year) IN (SELECT product_id, MIN(year) as year
                                   FROM Sales
                                   GROUP BY product_id) ;



