

SELECT IF(COUNT(DISTINCT Salary) = 1, NULL, (SELECT Salary
                                             FROM Employee
                                             ORDER BY Salary DESC
                                             LIMIT 1, 1)) AS SecondHighestSalary
FROM Employee;
