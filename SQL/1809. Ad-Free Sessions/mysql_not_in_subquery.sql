

SELECT session_id 
FROM Playback
WHERE session_id NOT IN (SELECT DISTINCT session_id
                         FROM Playback p
                         JOIN Ads a ON p.customer_id = a.customer_id
                         WHERE timestamp BETWEEN start_time AND end_time);
                         
                         
                         
