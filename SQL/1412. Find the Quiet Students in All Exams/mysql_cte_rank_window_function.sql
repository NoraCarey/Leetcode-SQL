


WITH cte AS (SELECT student_id, 
                    RANK() OVER(PARTITION BY exam_id 
                                ORDER BY score DESC) AS high_score,
                    RANK() OVER(PARTITION BY exam_id
                                ORDER BY score) AS low_score
             FROM Exam)
             
             
SELECT DISTINCT s.student_id, student_name
FROM Student s
JOIN Exam e ON s.student_id = e.student_id
WHERE e.student_id NOT IN (SELECT student_id
                           FROM cte 
                           WHERE high_score = 1 OR low_score = 1)
ORDER BY s.student_id;


