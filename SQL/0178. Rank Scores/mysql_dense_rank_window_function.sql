# DENSE_RANK() makes sure after a tie, the next ranking number should be the next consecutive integer value. 
# In other words, there should be no "holes" or "gaps" between ranks.

SELECT Score, DENSE_RANK() OVER (ORDER BY score DESC) AS 'Rank'
FROM Scores;

