


SELECT Id, Month, cumulative_salary as Salary
FROM (SELECT Id, 
             # calculate the cumulative salary over a period of 3 months
             # frame_clause means the bound is 2 rows before the current row.
             # for row1, itself. 
             # for row2, itself plus row1
             # for row3, itself plus row1 and row2
             # for row4, itself plus row2 and row3   
             Month, SUM(Salary) OVER(PARTITION BY Id
                                     ORDER BY Month
                                     ROWS 2 PRECEDING) AS cumulative_salary,
      
             # find the the most recent month
             # because we use the LAST_VALUE Window Function, the frame_clause should use RANGE, which is corresponding the row values
             # and because we want to get the last value, we should consider all partition rows
             LAST_VALUE(Month) OVER(PARTITION BY Id
                                    ORDER BY Month
                                    RANGE BETWEEN UNBOUNDED PRECEDING AND 
                                                  UNBOUNDED FOLLOWING) AS recent_month
      FROM Employee) tbl
WHERE Month != recent_month
ORDER BY Id, Month DESC;


