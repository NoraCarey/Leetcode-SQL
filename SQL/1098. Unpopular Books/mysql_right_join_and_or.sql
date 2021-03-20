

SELECT b.book_id, name
FROM (SELECT book_id, SUM(quantity) AS total_amt, MAX(dispatch_date) AS last_dt
      FROM Orders
      WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
      GROUP BY book_id) a
RIGHT JOIN Books b
ON b.book_id = a.book_id
WHERE (total_amt < 10 OR total_amt IS NULL) AND 
      DATEDIFF('2019-06-23', available_from) > 30;
      
      
      
