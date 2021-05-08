

SELECT item_category AS Category, 
       IFNULL(MAX(Monday), 0) AS Monday, 
       IFNULL(MAX(Tuesday), 0) AS Tuesday, 
       IFNULL(MAX(Wednesday), 0) AS Wednesday,
       IFNULL(MAX(Thursday), 0) AS Thursday, 
       IFNULL(MAX(Friday), 0) AS Friday, 
       IFNULL(MAX(Saturday), 0) AS Saturday, 
       IFNULL(MAX(Sunday), 0) AS Sunday
FROM (SELECT item_category, 
       CASE WHEN DAYOFWEEK(order_date) = 2 THEN SUM(quantity) END AS Monday,
       CASE WHEN DAYOFWEEK(order_date) = 3 THEN SUM(quantity) END AS Tuesday,
       CASE WHEN DAYOFWEEK(order_date) = 4 THEN SUM(quantity) END AS Wednesday,
       CASE WHEN DAYOFWEEK(order_date) = 5 THEN SUM(quantity) END AS Thursday,
       CASE WHEN DAYOFWEEK(order_date) = 6 THEN SUM(quantity) END AS Friday,
       CASE WHEN DAYOFWEEK(order_date) = 7 THEN SUM(quantity) END AS Saturday,
       CASE WHEN DAYOFWEEK(order_date) = 1 THEN SUM(quantity) END AS Sunday
      FROM Items i
      LEFT JOIN Orders o ON i.item_id = o.item_id
      GROUP BY item_category, DAYOFWEEK(order_date)) a
GROUP BY item_category
ORDER BY item_category;



