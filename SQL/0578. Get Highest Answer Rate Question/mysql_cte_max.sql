
# Assume there will more than one question_id show up

WITH cte AS (SELECT question_id, 
                    (SUM(CASE WHEN answer_id IS NOT NULL THEN 1 ELSE 0 END) /                              COUNT(*)) AS rate
             FROM survey_log
             GROUP BY question_id) 
 
SELECT question_id AS survey_log
FROM cte
WHERE rate = (SELECT MAX(rate) FROM cte);


