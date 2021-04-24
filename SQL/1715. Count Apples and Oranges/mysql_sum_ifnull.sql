

SELECT SUM(apple_count) AS apple_count, SUM(orange_count) AS orange_count
FROM (SELECT box_id, (b.apple_count + IFNULL(c.apple_count, 0)) AS apple_count, 
             (b.orange_count + IFNULL(c.orange_count, 0)) AS orange_count
      FROM Boxes b
      LEFT JOIN Chests c ON c.chest_id = b.chest_id
      GROUP BY box_id) a


# Simplified

SELECT SUM(b.apple_count + IFNULL(c.apple_count, 0)) AS apple_count, 
       SUM(b.orange_count + IFNULL(c.orange_count, 0)) AS orange_count
FROM Boxes b
LEFT JOIN Chests c ON c.chest_id = b.chest_id;



