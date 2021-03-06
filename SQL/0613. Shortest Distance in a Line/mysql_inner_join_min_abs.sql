
# Assume there is no duplicate points in the table

SELECT MIN(ABS(t1.x - t2.x)) AS shortest
FROM point t1
JOIN point t2 ON t1.x != t2.x;

