


SELECT Id, Month, cumulative_salary as Salary
FROM (SELECT Id, 
             # calculate the cumulative salary over a period of 3 months
             # frame
             Month, SUM(Salary) OVER(PARTITION BY Id
                                     ORDER BY Month
                                     ROWS 2 PRECEDING) AS cumulative_salary,
             LAST_VALUE(Month) OVER(PARTITION BY Id
                                    ORDER BY Month
                                    RANGE BETWEEN UNBOUNDED PRECEDING AND 
                                                  UNBOUNDED FOLLOWING) AS recent_month
      FROM Employee) tbl
WHERE Month != recent_month
ORDER BY Id, Month DESC;


