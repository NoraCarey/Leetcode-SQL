

# Assume there will be only one winning candidate

SELECT Name
FROM Candidate c
RIGHT JOIN Vote v ON c.id = v.CandidateId
GROUP BY c.id, c.Name
ORDER BY COUNT(c.id) DESC
LIMIT 1;

      
      
