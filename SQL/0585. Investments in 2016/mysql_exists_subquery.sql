

SELECT ROUND(SUM(TIV_2016), 2) AS TIV_2016
FROM insurance a
WHERE EXISTS (SELECT *
              FROM insurance b
              WHERE a.PID != b.PID AND a.TIV_2015 = b.TIV_2015) AND
      NOT EXISTS (SELECT *
                  FROM insurance c
                  WHERE a.PID != c.PID AND 
                        CONCAT(a.LAT, a.LON) = CONCAT(c.LAT, c.LON));
                        
                        
                        
