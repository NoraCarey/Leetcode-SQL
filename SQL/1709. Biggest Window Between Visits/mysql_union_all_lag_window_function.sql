

SELECT user_id, MAX(DATEDIFF(visit_date,last_visit)) AS biggest_window
FROM (SELECT user_id, visit_date, 
             LAG(visit_date) OVER(PARTITION BY user_id
                                  ORDER BY visit_date) AS last_visit
      FROM (SELECT DISTINCT user_id, '2021-1-1' AS visit_date
            FROM UserVisits
            UNION
            SELECT *
            FROM UserVisits) a) b
GROUP BY user_id
ORDER BY user_id;



