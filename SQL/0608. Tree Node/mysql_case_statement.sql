


SELECT id, CASE
               WHEN p_id IS NULL THEN 'Root' 
               WHEN id IN (SELECT p_id FROM tree) THEN 'Inner'
               ELSE 'Leaf'
            End 'Type'
FROM tree
ORDER BY id;


