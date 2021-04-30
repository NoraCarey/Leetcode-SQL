

SELECT ROUND(MIN(SQRT(POW(ABS(t1.x - t2.x), 2) + POW(ABS(t1.y - t2.y), 2))), 2)AS shortest
FROM point_2d t1, point_2d t2
WHERE (t1.x, t1.y) != (t2.x, t2.y);

