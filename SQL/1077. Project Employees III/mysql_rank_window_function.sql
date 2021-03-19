

SELECT project_id, employee_id
FROM (SELECT project_id, e.employee_id,
             RANK() OVER(PARTITION BY project_id
                         ORDER BY experience_years DESC) AS ranking
      FROM Project p
      JOIN Employee e ON p.employee_id = e.employee_id) tbl
WHERE ranking = 1;



