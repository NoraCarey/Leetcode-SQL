

SELECT state AS period_state, MIN(day) AS start_date, MAX(day) AS end_date
FROM (SELECT day, state,
            (RANK() OVER (ORDER BY day) - ranking) AS grp
      FROM (
            SELECT fail_date AS day, 'failed' AS state, 
                   RANK() OVER (ORDER BY fail_date) AS ranking
            FROM Failed
            WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
            UNION 
            SELECT success_date AS day, 'succeeded' AS state, 
                   RANK() OVER (ORDER BY success_date) AS ranking
            FROM Succeeded
            WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31') a) b
GROUP BY grp, state
ORDER BY start_date


