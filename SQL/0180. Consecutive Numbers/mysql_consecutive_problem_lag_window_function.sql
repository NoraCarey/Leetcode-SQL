

SELECT DISTINCT tbl.Num1 AS ConsecutiveNums
FROM (SELECT Num AS Num1, LAG(Num, 1) OVER() AS Num2, LAG(Num, 2) OVER() AS Num3
      FROM Logs) AS tbl
WHERE tbl.Num1 = tbl.Num2 AND tbl.Num2 = tbl.Num3;


