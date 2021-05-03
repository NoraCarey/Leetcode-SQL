

SELECT student_id, course_id, grade
FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY student_id
                                  ORDER BY grade DESC, course_id) AS ranking
      FROM Enrollments) a
WHERE ranking = 1
ORDER BY student_id;


