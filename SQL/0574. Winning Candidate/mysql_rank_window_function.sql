

SELECT Name
FROM (SELECT Name, Rank() OVER(ORDER BY a.vote_nums DESC) AS ranking
      FROM (SELECT Name, COUNT(c.id) AS vote_nums
            FROM Candidate c
            JOIN Vote v ON c.id = v.CandidateId
            GROUP BY Name) a) b
WHERE b.ranking = 1;


