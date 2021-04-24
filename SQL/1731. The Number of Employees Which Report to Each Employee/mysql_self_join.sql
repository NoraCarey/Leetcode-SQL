

SELECT t1.reports_to AS employee_id, t2.name AS name, 
       COUNT(t1.employee_id) AS reports_count, ROUND(AVG(t1.age)) AS average_age
FROM Employees t1, Employees t2
WHERE t1.reports_to = t2.employee_id
GROUP BY t2.employee_id
ORDER BY 1;


