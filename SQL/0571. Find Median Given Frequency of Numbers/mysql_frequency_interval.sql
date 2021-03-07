


WITH cte AS (SELECT Number, Frequency,
                    SUM(Frequency) OVER(ORDER BY Number) AS total_frequency,
                    (SUM(Frequency) OVER()) / 2 AS median_index
             FROM Numbers)
             
SELECT AVG(Number) AS median
FROM cte
WHERE median_index BETWEEN (total_frequency - Frequency) AND total_frequency;



