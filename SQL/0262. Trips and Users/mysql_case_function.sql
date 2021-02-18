

SELECT t.Request_at AS Day, 
       ROUND((SUM(CASE WHEN t.Status != 'completed' THEN 1 ELSE 0 END) / COUNT(t.Id)), 2) AS 'Cancellation Rate'
FROM Trips t
LEFT JOIN Users u1 ON t.Client_Id = u1.Users_Id
LEFT JOIN Users u2 ON t.Driver_Id = u2.Users_id
WHERE u1.Banned = 'No' # AND u2.Banned = 'No' 
      AND t.Request_at >= '2013-10-01' AND t.Request_at <= '2013-10-03'
GROUP BY t.Request_at
ORDER BY t.Request_at;

