

SELECT username, activity, startDate, endDate
FROM (SELECT *,
             ROW_NUMBER() OVER(PARTITION BY username
                               ORDER BY startDate DESC) AS ranking,
             COUNT(username) OVER(PARTITION BY username) AS nums
      FROM UserActivity) a
WHERE ranking = 2 OR nums = 1



