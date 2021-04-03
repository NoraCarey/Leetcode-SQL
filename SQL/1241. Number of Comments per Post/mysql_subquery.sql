

SELECT sub_id AS post_id, IFNULL(nums, 0) AS number_of_comments
FROM (SELECT DISTINCT sub_id
      FROM Submissions 
      WHERE parent_id IS NULL) a
LEFT JOIN (SELECT parent_id, COUNT(DISTINCT sub_id) AS nums
           FROM Submissions
           GROUP BY parent_id) b
ON sub_id = parent_id
ORDER BY post_id;

