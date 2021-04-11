

SELECT s.company_id, employee_id, employee_name,ROUND(salary * (1 - tax_rate), 0) AS salary
FROM (SELECT company_id, 
             CASE 
                 WHEN MAX(salary) < 1000 THEN 0
                 WHEN MAX(salary) >= 1000 AND MAX(salary) <= 10000 THEN 0.24
                 WHEN MAX(salary) > 10000 THEN 0.49
             END tax_rate
      FROM Salaries
      GROUP BY company_id) a
JOIN Salaries s ON a.company_id = s.company_id


