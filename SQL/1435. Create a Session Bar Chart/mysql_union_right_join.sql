

SELECT b.bin, IFNULL(total, 0) AS total
FROM (SELECT CASE
                 WHEN duration / 60 >= 0 AND duration / 60 < 5 THEN '[0-5>'
                 WHEN duration / 60 >= 5 AND duration / 60 < 10 THEN '[5-10>'
                 WHEN duration / 60 >= 10 AND duration / 60 < 15 THEN '[10-15>'
                 ELSE '15 or more'
              END bin, COUNT(session_id) AS total
      FROM Sessions
      GROUP BY bin) a
RIGHT JOIN (SELECT '[0-5>' AS bin
            UNION
            SELECT '[5-10>' AS bin
            UNION
            SELECT '[10-15>' AS bin
            UNION
            SELECT '15 or more' AS bin) b
ON a.bin = b.bin;



