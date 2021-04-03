

SELECT DISTINCT visited_on, amount, ROUND(amount/7, 2) AS average_amount
FROM (SELECT visited_on, 
      SUM(amount) OVER(ORDER BY visited_on 
                       RANGE BETWEEN INTERVAL 6 DAY PRECEDING
                             AND CURRENT ROW) AS amount,
      DENSE_RANK() OVER(ORDER BY visited_on) AS ranking
      FROM Customer) AS t
WHERE ranking >= 7


