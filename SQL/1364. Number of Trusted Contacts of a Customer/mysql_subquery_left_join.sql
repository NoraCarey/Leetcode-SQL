


SELECT invoice_id, customer_name, price, 
       IFNULL(COUNT(contact_name), 0) AS contacts_cnt, 
       IFNULL(SUM(CASE WHEN contact_name IN (SELECT customer_name
                                             FROM Customers) 
                       THEN 1 ELSE 0 END), 0) AS trusted_contacts_cnt
FROM Invoices i
JOIN Customers c ON i.user_id = c.customer_id
LEFT JOIN Contacts co ON c.customer_id = co.user_id
GROUP BY invoice_id, customer_name, price
ORDER BY invoice_id;



