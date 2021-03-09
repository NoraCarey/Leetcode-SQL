


# SELECT ROUND(SUM(TIV_2016), 2) AS TIV_2016
# FROM insurance
# WHERE TIV_2015 IN (SELECT TIV_2015
#                    FROM insurance
#                    GROUP BY TIV_2015
#                    HAVING COUNT(PID) > 1) AND
#      CONCAT(LAT, ',', LON) IN (SELECT CONCAT(LAT, ",", LON) AS location
#                                 FROM insurance
#                                 GROUP BY location
#                                 HAVING COUNT(PID) = 1);


SELECT ROUND(SUM(TIV_2016), 2) AS TIV_2016
FROM insurance a
WHERE EXISTS (SELECT *
              FROM insurance b
              WHERE a.PID != b.PID AND a.TIV_2015 = B.TIV_2015) AND
      NOT EXISTS (SELECT *
                  FROM insurance c
                  WHERE a.PID != c.PID AND 
                        (a.LAT, a.LON) = (c.LAT, c.LON))
              
              
              
