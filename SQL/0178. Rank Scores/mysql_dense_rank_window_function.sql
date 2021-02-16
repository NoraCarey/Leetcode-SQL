

SELECT Score, DENSE_RANK() OVER (ORDER BY score DESC) AS 'Rank'
FROM Scores;

