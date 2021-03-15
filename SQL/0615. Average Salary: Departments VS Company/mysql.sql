

SELECT department_avg.pay_month AS pay_month, 
       department_avg.department_id AS department_id,        
       CASE 
           WHEN department_avg > company_avg THEN 'higher'
           WHEN department_avg = company_avg THEN 'same'
           WHEN department_avg < company_avg THEN 'lower'
       END AS 'comparison'       
FROM (SELECT DATE_FORMAT(pay_date, '%Y-%m') AS pay_month, department_id,
             AVG(amount) AS department_avg
      FROM salary s
      JOIN employee e ON s.employee_id = e.employee_id
      GROUP BY pay_month, department_id) department_avg       
JOIN (SELECT DATE_FORMAT(pay_date, '%Y-%m') AS pay_month, AVG(amount) AS company_avg
      FROM salary
      GROUP BY pay_month) company_avg
ON department_avg.pay_month = company_avg.pay_month;


