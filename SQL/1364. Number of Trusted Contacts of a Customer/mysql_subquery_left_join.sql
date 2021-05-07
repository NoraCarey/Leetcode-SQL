


SELECT invoice_id, customer_name, price, 
       COUNT(contact_name) AS contacts_cnt, 
       SUM(CASE WHEN contact_email IN (SELECT email FROM Customers) THEN 1 ELSE 0 END) AS trusted_contacts_cnt
FROM Invoices i
LEFT JOIN Customers cu ON i.user_id = cu.customer_id
LEFT JOIN Contacts co ON cu.customer_id = co.user_id
GROUP BY invoice_id, customer_name
ORDER BY invoice_id;



