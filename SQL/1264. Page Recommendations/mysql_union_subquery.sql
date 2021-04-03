

SELECT DISTINCT page_id AS recommended_page
FROM (SELECT user1_id AS user_id, user2_id AS friend_id, page_id
      FROM Friendship f
      JOIN Likes l on f.user2_id = l.user_id 
      WHERE user1_id = 1
      UNION 
      SELECT user2_id AS user_id, user1_id AS friend_id, page_id
      FROM Friendship f
      JOIN Likes l on f.user1_id = l.user_id 
      WHERE user2_id = 1) a
WHERE page_id NOT IN (SELECT page_id 
                      FROM Likes
                      WHERE user_id = 1)
ORDER BY page_id


