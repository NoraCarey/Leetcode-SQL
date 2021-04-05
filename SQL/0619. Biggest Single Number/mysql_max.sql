

# using MAX() Function, when there is num, it returns num, else it returns NULL
SELECT MAX(num) AS num
FROM (SELECT num
      FROM my_numbers
      GROUP BY num
      HAVING COUNT(*) = 1) a


      
