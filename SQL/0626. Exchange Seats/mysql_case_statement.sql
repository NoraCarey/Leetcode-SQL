


SELECT CASE
           WHEN MOD(id, 2) != 0 AND id != (SELECT COUNT(*) FROM seat) THEN (id + 1)
           WHEN MOD(id, 2) != 0 AND id = counts THEN id
           WHEN MOD(id, 2) = 0 THEN (id - 1)
      END AS id, student           
FROM seat, (SELECT COUNT(*) AS counts
            FROM seat) tbl
ORDER BY 1;



