

SELECT st.student_id, st.student_name, su.subject_name, 
       COUNT(e.subject_name) AS attended_exams
FROM Students st
JOIN Subjects su
LEFT JOIN examinations e
ON st.student_id = e.student_id AND e.subject_name = su.subject_name
GROUP BY st.student_id, su.subject_name
ORDER BY st.student_id;



