

SELECT dept_name, COUNT(student_id) AS student_number
FROM student s
RIGHT JOIN department d ON s.dept_id = d.dept_id
GROUP BY dept_name
ORDER BY student_number DESC, dept_name;

