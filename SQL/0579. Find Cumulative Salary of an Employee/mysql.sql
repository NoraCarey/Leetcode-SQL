


SELECT Id, Month, Salary
FROM (SELECT Id, Month, SUM(Salary) OVER(PARTITION BY Id
                                         ORDER BY Month
                                         ROWS 2 PRECEDING) AS Salary,
             LAST_VALUE(Month) OVER(PARTITION BY Id
                                    ORDER BY Month
                                    ROWS BETWEEN UNBOUNDED PRECEDING 
                                         AND UNBOUNDED FOLLOWING) AS recent_month
       FROM Employee) a
WHERE Month != recent_month
ORDER BY Id, Month DESC;



