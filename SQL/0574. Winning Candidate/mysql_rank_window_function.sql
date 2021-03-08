

# Assume there will be more than one winning candidate

SELECT Name
FROM (SELECT Name, RANK() OVER(ORDER BY vote_num DESC) AS ranking
      FROM (SELECT Name, COUNT(v.CandidateId) AS vote_num
            FROM Candidate c
            RIGHT JOIN Vote v ON c.id = v.CandidateId
            GROUP BY Name) tbl1) tbl2
WHERE ranking = 1;


