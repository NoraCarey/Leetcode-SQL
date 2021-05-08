

WITH RECURSIVE cte AS (SELECT id, login_date, 1 AS days
                       FROM Logins
                       UNION ALL
                       SELECT l.id, l.login_date, days + 1 AS days
                       FROM cte c
                       JOIN Logins l
                       ON l.id = c.id AND DATE_ADD(c.login_date, INTERVAL 1 DAY) = l.login_date)
                       

SELECT *
FROM Accounts 
WHERE id IN (SELECT DISTINCT id
             FROM cte
             WHERE days = 5)
ORDER BY id;



