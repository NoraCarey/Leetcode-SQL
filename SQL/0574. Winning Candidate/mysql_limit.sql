

# Assume there will be only one winning candidate

SELECT Name
FROM Candidate c
RIGHT JOIN Vote v ON c.id = v.CandidateId
GROUP BY c.Name
ORDER BY COUNT(v.CandidateId) DESC
LIMIT 1;


      
      
