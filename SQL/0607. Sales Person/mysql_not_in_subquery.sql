


SELECT name 
FROM salesperson
WHERE sales_id NOT IN (SELECT sales_id
                       FROM orders o
                       JOIN company c on c.com_id = o.com_id
                       WHERE c.name = 'RED');
                       
                       
