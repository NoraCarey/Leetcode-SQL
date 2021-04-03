

SELECT visited_on, amount, ROUND(average_amount, 2) AS average_amount
FROM (SELECT visited_on, 
             RANK() OVER(ORDER BY visited_on) AS ranking,
             SUM(amount) OVER(ORDER BY visited_on
                              ROWS 6 PRECEDING) AS amount,
             AVG(amount) OVER(ORDER BY visited_on
                              ROWS 6 preceding) AS average_amount
      FROM (SELECT visited_on, SUM(amount) AS amount
            FROM Customer
            GROUP BY visited_on) a) b
WHERE ranking >= 7;


