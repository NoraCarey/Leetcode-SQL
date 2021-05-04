

SELECT b.product_id, 
       CASE
           WHEN a.price IS NOT NULL THEN price
           ELSE 10
       END AS price
FROM (SELECT product_id, new_price AS price, 
             ROW_NUMBER() OVER(PARTITION BY product_id
                               ORDER BY change_date DESC) AS ranking
      FROM Products
      WHERE change_date <= '2019-08-16') a
RIGHT JOIN (SELECT DISTINCT product_id
            FROM Products) b
ON b.product_id = a.product_id AND ranking = 1;


