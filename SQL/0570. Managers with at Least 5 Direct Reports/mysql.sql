
SELECT NAME 
FROM (SELECT ManagerId, COUNT(Id)
      FROM Employee 
      GROUP BY ManagerId
      HAVING COUNT(Id) >= 5) tbl
JOIN Employee e ON tbl.ManagerId = e.Id;


