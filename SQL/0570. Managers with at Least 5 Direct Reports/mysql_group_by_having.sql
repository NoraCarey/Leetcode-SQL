
SELECT Name
FROM (SELECT ManagerId, COUNT(ManagerId) AS manager_num
      FROM Employee
      GROUP BY ManagerId
      HAVING manager_num >= 5) tbl
JOIN Employee e ON tbl.ManagerId = e.Id;





