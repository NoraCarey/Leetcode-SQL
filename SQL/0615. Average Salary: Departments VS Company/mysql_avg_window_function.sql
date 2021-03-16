

SELECT DISTINCT pay_month, department_id,
       CASE
           WHEN department_avg > company_avg THEN 'higher'
           WHEN department_avg = company_avg THEN 'same'
           WHEN department_avg < company_avg THEN 'lower'
       END 'comparison'
FROM (SELECT DATE_FORMAT(pay_date, '%Y-%m') AS pay_month, department_id,
             AVG(amount) OVER(PARTITION BY DATE_FORMAT(pay_date, '%Y-%m')) AS company_avg,
             AVG(amount) OVER(PARTITION BY DATE_FORMAT(pay_date, '%Y-%m'), department_id) AS department_avg
      FROM salary s
      JOIN employee e ON s.employee_id = e.employee_id) tbl;
      
      
