
# The number of Limit start from 0

SELECT COALESCE((SELECT DISTINCT Salary
                 FROM Employee
                 ORDER BY Salary DESC
                 # LIMIT 1 OFFSET 1
                 LIMIT 1, 1), NULL) AS SecondHighestSalary;
                 
                 
                 
