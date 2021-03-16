

SELECT IF(id != (SELECT COUNT(*) FROM seat), IF(MOD(id, 2) = 0, id - 1, id + 1), 
                                             IF(MOD(id, 2) = 0, id - 1, id)) AS id, student
FROM seat
ORDER BY 1;


