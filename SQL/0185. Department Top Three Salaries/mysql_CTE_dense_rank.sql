

WITH cte AS (SELECT d.Name AS Department, e.Name AS Employee, e.Salary AS Salary,
                    DENSE_RANK() OVER(PARTITION BY e.DepartmentId
                                      ORDER BY e.Salary DESC) AS ranking
             FROM Employee e JOIN Department d ON e.DepartmentId = d.Id)
             
SELECT Department, Employee, Salary
FROM cte
WHERE ranking < 4
ORDER BY Department, Salary DESC;

