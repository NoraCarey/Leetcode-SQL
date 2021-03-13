

WITH cte AS (SELECT seat_id, seat_id - ROW_NUMBER() OVER(ORDER BY seat_id) AS grp
             FROM cinema
             WHERE free = 1)


SELECT seat_id
FROM cte
WHERE grp in (SELECT grp
              FROM cte
              GROUP BY grp
              HAVING COUNT(*) >= 2);
