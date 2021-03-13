

# Instead of union just one id, with UNION pair id, we remove all duplicate rows
# and we avoid the double counting situation while person 1 sending request to person 2, and person 2 also sending request to person 1

SELECT id1 AS id, COUNT(*) AS num
FROM (SELECT requester_id AS id1, accepter_id AS id2
      FROM request_accepted
      UNION 
      SELECT accepter_id AS id1, requester_id AS id2
      FROM request_accepted) tbl
GROUP BY id1
ORDER BY num DESC
LIMIT 1;


