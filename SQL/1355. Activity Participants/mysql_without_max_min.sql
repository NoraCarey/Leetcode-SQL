

SELECT activity
FROM Friends
GROUP BY activity
HAVING COUNT(id) > (SELECT COUNT(id)
                    FROM Friends
                    GROUP BY activity
                    ORDER BY COUNT(id)
                    LIMIT 1) AND
       COUNT(id) < (SELECT COUNT(ID)
                    FROM Friends
                    GROUP BY activity
                    ORDER BY COUNT(id) DESC
                    LIMIT 1);
                    
                    
                    
