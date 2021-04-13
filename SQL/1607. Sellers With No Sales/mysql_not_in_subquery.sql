

SELECT seller_name
FROM Seller
WHERE seller_id NOT IN (SELECT seller_id 
                        FROM Orders 
                        WHERE YEAR(sale_date) = 2020
                        GROUP BY seller_id)
ORDER BY seller_name ASC;


