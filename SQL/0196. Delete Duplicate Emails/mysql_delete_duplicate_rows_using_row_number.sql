

DELETE FROM Person
WHERE Id IN (SELECT Id 
             FROM (SELECT Id, Email, ROW_NUMBER() OVER(PARTITION BY Email
                                                       ORDER BY Id) AS ranking
                   FROM Person) tbl
             WHERE ranking > 1);
             
             
             
