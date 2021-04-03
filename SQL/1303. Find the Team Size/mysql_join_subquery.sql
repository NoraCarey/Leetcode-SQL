


SELECT employee_id, team_size
FROM (SELECT team_id, COUNT(employee_id) AS team_size
      FROM Employee
      GROUP BY team_id) a
JOIN Employee e ON a.team_id = e.team_id
ORDER BY employee_id


