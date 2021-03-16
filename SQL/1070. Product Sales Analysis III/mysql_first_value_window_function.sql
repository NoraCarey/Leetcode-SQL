

SELECT DISTINCT s.product_id, first_year, quantity, price
FROM (SELECT product_id, FIRST_VALUE(year) OVER(PARTITION BY product_id
                                                ORDER BY year) AS first_year
      FROM Sales) tbl
JOIN sales s ON tbl.product_id = s.product_id
WHERE s.year = tbl.first_year 


