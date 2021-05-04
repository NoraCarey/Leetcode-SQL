

SELECT u.user_id AS seller_id, 
       CASE 
            WHEN b.item_brand = u.favorite_brand THEN 'yes'
            ELSE 'no' 
       END AS '2nd_item_fav_brand'
FROM (SELECT seller_id, item_brand
      FROM (SELECT DISTINCT seller_id, 
                            NTH_VALUE(item_id, 2) OVER(PARTITION BY seller_id
                                                       ORDER BY order_date
                                                       RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS second_item
            FROM Orders) a
      JOIN Items i ON a.second_item = i.item_id) b
RIGHT JOIN Users u ON user_id = seller_id


