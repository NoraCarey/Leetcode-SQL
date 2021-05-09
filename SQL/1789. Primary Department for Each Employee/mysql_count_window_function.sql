

SELECT employee_id, department_id
FROM (SELECT *, COUNT(department_id) OVER(PARTITION BY employee_id) AS counts
      FROM Employee) a
WHERE primary_flag = 'Y' OR counts = 1


