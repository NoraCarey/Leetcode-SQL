

SELECT b.bin, IFNULL(COUNT(a.session_id), 0) AS Total
FROM (SELECT session_id, 
             CASE 
                 WHEN duration / 60 >= 0 AND duration / 60 < 5 THEN '[0-5>'
                 WHEN duration / 60 >= 5 AND duration / 60 < 10 THEN '[5-10> '
                 WHEN duration / 60 >= 10 AND duration / 60 < 15 THEN '[10-15>'
                 WHEN duration / 60 >= 15 THEN '15 or more'
             END bin
      FROM Sessions) a
RIGHT JOIN (SELECT '[0-5>' AS bin
            UNION 
            SELECT '[5-10>' AS bin
            UNION
            SELECT '[10-15>' AS bin
            UNION
            SELECT '15 or more' AS bin) b
ON a.bin = b.bin
GROUP BY b.bin;   



