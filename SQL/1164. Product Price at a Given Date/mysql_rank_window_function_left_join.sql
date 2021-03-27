

SELECT a.product_id, 
       IFNULL(new_price, 10) AS price
FROM (SELECT DISTINCT(product_id), 10 AS price
      FROM Products) a
LEFT JOIN (SELECT product_id, new_price 
           FROM (SELECT product_id, new_price, 
                        RANK() OVER(PARTITION BY product_id
                                    ORDER BY change_date DESC) AS ranking
                 FROM Products
                 WHERE change_date <= '2019-08-16') b
          WHERE ranking = 1) c
ON a.product_id = c.product_id;


