


SELECT followee AS follower, COUNT(DISTINCT follower) AS num
FROM follow
WHERE followee IN (SELECT follower
                   FROM follow)
GROUP BY 1
ORDER BY 1;


