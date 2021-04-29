
SELECT e2.name
FROM Employee e1, Employee e2
WHERE e1.ManagerId = e2.Id
GROUP BY e1.ManagerId
HAVING COUNT(e2.id) >= 5;



