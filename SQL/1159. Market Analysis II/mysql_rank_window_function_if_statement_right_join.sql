

SELECT user_id AS seller_id, 
       IF(item_brand IS NOT NULL, IF(item_brand = favorite_brand, 'yes', 'no'), 'no') AS 2nd_item_fav_brand
FROM (SELECT seller_id, item_brand
      FROM (SELECT seller_id, item_id,
                   RANK() OVER(PARTITION BY seller_id
                               ORDER BY order_date) AS ranking
            FROM Orders) a
      JOIN Items i ON a.item_id = i.item_id
      WHERE ranking = 2) b
RIGHT JOIN Users u ON u.user_id = b.seller_id;


