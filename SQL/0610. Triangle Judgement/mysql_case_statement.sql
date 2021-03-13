

SELECT x, y, z,
       CASE
            WHEN x > 0 AND y > 0 AND z > 0 AND (x+y) > z AND (y+z) > x AND 
                 (x+z) > y THEN 'Yes'
            ELSE 'No'
        END 'triangle'
FROM triangle;


