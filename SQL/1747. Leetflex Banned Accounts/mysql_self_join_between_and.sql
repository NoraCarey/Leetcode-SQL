

SELECT DISTINCT t1.account_id
FROM LogInfo t1, LogInfo t2
WHERE t1.account_id = t2.account_id AND t1.ip_address != t2.ip_address AND
      t2.login BETWEEN t1.login AND t1.logout;

       
       
       
