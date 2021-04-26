

SELECT tbl1.Name AS Employee
FROM Employee tbl1 JOIN Employee tbl2 ON tbl1.ManagerId = tbl2.Id
WHERE tbl1.Salary > tbl2.Salary;


