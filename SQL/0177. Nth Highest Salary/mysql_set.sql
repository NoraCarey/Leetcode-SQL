
# Becasue N is a Local Variable Assignment, it is not a User-defined Variable Assignment, there is no need using @ here
# It is just SET N := N - 1, ('=' AND ':=' is the same)


CREATE FUNCTION getNthHighestSalary(N INT) 
RETURNS INT
BEGIN
SET N := N - 1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT COALESCE((SELECT DISTINCT Salary
                       FROM Employee
                       ORDER BY Salary DESC
                       LIMIT N, 1), NULL)
          );
END

