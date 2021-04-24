

SELECT activity 
FROM (SELECT activity, 
             RANK() OVER(ORDER BY participants DESC) AS max_rank,
             RANK() OVER(ORDER BY participants) AS min_rank
      FROM (SELECT DISTINCT activity, 
                   COUNT(name) OVER(PARTITION BY activity) AS participants
            FROM Friends) a) b
WHERE max_rank <> 1 AND min_rank <> 1;
               
               
               
                    
                    
                    
