


SELECT business_id
FROM (SELECT event_type, AVG(occurences) AS avg_occur
      FROM Events
      GROUP BY event_type) tbl
JOIN Events e ON e.event_type = tbl.event_type
WHERE occurences > avg_occur
GROUP BY business_id
HAVING COUNT(*) > 1



