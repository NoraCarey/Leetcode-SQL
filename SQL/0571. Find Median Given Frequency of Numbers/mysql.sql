

# SELECT AVG(n.Number) AS median
# FROM Numbers n
# WHERE n.Frequency >= ABS((SELECT SUM(Frequency)
#                           FROM Numbers 
#                           WHERE n.Number <= Number) - 
#                          (SELECT SUM(Frequency) 
#                           FROM Numbers
#                           WHERE n.Number >= Number));
                          
                          

WITH cte AS (SELECT Number, Frequency,
                    SUM(Frequency) OVER(ORDER BY Number) AS Freq,
                    ((SUM(Frequency) OVER()) / 2) AS median_num
                    
             FROM Numbers)
             
SELECT AVG(Number) AS median
FROM cte
WHERE median_num BETWEEN (Freq - Frequency) AND Freq;

