
SELECT DISTINCT s.student_id, student_name
FROM Student s 
JOIN Exam e ON s.student_id = e.student_id
WHERE s.student_id IN (SELECT DISTINCT student_id FROM Exam) AND
      s.student_id NOT IN (SELECT student_id
                           FROM (SELECT exam_id, MAX(score) AS high, MIN(score) AS low
                                 FROM Exam
                                 GROUP BY exam_id) a
                           JOIN Exam e ON a.exam_id = e.exam_id AND 
                                          (e.score = high OR e.score = low))
ORDER BY 1;


