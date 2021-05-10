

SELECT CONCAT_WS(', ', DAYNAME(day), DATE_FORMAT(day, '%M %e'), Year(DAY)) AS day
FROM Days;
