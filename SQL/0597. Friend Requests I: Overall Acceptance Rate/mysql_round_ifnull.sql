

SELECT IFNULL(ROUND(COUNT(DISTINCT CONCAT(requester_id, accepter_id)) / 
                    COUNT(DISTINCT CONCAT(sender_id, send_to_id)), 2), 0)
       AS accept_rate
FROM FriendRequest, RequestAccepted;
