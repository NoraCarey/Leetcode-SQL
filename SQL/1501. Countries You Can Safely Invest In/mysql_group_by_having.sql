

SELECT DISTINCT c.name AS country
FROM Person p
JOIN Calls l ON caller_id = id OR id = callee_id
JOIN Country c ON LEFT(phone_number, 3) = country_code
GROUP BY country_code
HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls)


