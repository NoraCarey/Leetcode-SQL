

SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id
FROM (SELECT log_id, (log_id - RANK() OVER(ORDER BY log_id)) AS grp
      FROM Logs) a
GROUP BY grp;


