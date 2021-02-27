

# Assume there will be more than one winning candidate

SELECT b.Name
FROM (SELECT a.id, a.Name, RANK() OVER(ORDER BY a.count_nums DESC) AS ranking
      FROM (SELECT c.id, c.Name, COUNT(c.id) AS count_nums
            FROM Candidate c 
            RIGHT JOIN Vote v ON c.id = v.CandidateId
            GROUP BY c.id, c.Name) a) b
WHERE b.ranking = 1;


