
# Becasue N is a Local Variable Assignment, it is not a User-defined Variable Assignment, there is no need using @ here
# It is just SET N := N - 1, ('=' AND ':=' is the same)

# Calculations could not be used inside the RETRUN block, we need to do the calculations outside the block. 

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N := N - 1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT IFNULL((SELECT DISTINCT Salary
                     FROM Employee
                     ORDER BY Salary DESC
                     LIMIT 1 OFFSET N), NULL)     
  );
END

