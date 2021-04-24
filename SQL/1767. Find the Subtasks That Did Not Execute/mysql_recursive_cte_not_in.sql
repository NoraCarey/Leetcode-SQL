


WITH recursive cte AS (SELECT task_id, subtasks_count AS subtask_id
                       FROM Tasks
                       UNION ALL
                       SELECT task_id, (subtask_id - 1) AS subtask_id
                       FROM cte
                       WHERE subtask_id > 1)
                       

SELECT task_id, subtask_id
FROM cte
WHERE (task_id, subtask_id) NOT IN (SELECT task_id, subtask_id FROM Executed)



