


SELECT e.student_id, MIN(course_id) AS course_id, grade
FROM (SELECT student_id, MAX(grade) AS max_grade
      FROM Enrollments
      GROUP BY student_id) tbl
JOIN Enrollments e ON e.student_id = tbl.student_id
WHERE grade = max_grade
GROUP BY e.student_id, grade
ORDER BY e.student_id;


