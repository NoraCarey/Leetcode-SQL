

SELECT LEAST(from_id, to_id) AS person1, GREATEST(from_id, to_id) AS person2,
       COUNT(duration) AS call_count, SUM(duration) AS total_duration
FROM Calls
GROUP BY person1, person2;

