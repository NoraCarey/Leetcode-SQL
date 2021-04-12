

SELECT co.name AS country
FROM Person p
JOIN Country co ON LEFT(p.phone_number, 3) = co.country_code
JOIN Calls ca ON p.id = ca.caller_id OR p.id = ca.callee_id
GROUP BY co.name
HAVING AVG(duration) > (SELECT SUM(duration) / COUNT(*) FROM Calls);


