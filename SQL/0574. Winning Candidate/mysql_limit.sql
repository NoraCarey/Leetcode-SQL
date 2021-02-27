

SELECT Name
FROM Candidate c
JOIN Vote v ON c.id = v.CandidateId
GROUP BY Name
ORDER BY COUNT(c.id) DESC
LIMIT 1;
      
      
      
