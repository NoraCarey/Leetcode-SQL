

SELECT project_id, e.employee_id
FROM Project p
JOIN Employee e ON p.employee_id = e.employee_id
WHERE (project_id, experience_years) IN (SELECT project_id, MAX(experience_years)
                                         FROM Project p
                                         JOIN Employee e ON p.employee_id = e.employee_id
                                         GROUP BY project_id)
                                         
                                         
                                         
