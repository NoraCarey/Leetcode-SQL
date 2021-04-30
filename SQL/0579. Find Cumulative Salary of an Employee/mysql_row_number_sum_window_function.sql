

WITH cte AS (SELECT *,
                    ROW_NUMBER() OVER(PARTITION BY Id
                                      ORDER BY Month DESC) AS ranking,
                    SUM(Salary) OVER(PARTITION BY Id
                                     ORDER BY Month
                                     ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS cumulative_salary
             FROM Employee)
                                     
                                     
SELECT Id, Month, cumulative_salary AS Salary
FROM cte
WHERE ranking != 1
ORDER BY Id, Month DESC;


