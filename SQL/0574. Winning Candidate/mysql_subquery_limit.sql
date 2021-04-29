

# Assume there will be only one winning candidate

SELECT Name
FROM Candidate
WHERE id = (SELECT CandidateId
            FROM Vote
            GROUP BY CandidateId
            ORDER BY COUNT(id) DESC
            LIMIT 1)

      
      
