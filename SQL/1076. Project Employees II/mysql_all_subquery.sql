

SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(DISTINCT employee_id) >= ALL (SELECT COUNT(*)
                                          FROM Project
                                          GROUP BY project_id);
                                          
                                          
                                          
