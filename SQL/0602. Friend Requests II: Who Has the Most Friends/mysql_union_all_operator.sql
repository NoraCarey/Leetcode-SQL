

SELECT id, SUM(nums) AS num
FROM (SELECT requester_id AS id, COUNT(accepter_id) AS nums
      FROM request_accepted
      GROUP BY requester_id
      UNION ALL
      SELECT accepter_id AS id, COUNT(requester_id) AS nums
      FROM request_accepted
      GROUP BY accepter_id) tbl
GROUP BY id
ORDER BY num DESC
LIMIT 1;


