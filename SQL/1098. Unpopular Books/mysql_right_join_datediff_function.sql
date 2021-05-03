

SELECT b.book_id, name
FROM (SELECT *
      FROM Orders
      WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23') a
RIGHT JOIN Books b ON a.book_id = b.book_id
WHERE DATEDIFF('2019-06-23', available_from) > 30
GROUP BY b.book_id
HAVING IFNULL(SUM(quantity), 0) < 10;
      
      
