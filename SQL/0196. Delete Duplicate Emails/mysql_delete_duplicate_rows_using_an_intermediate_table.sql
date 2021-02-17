

CREATE TABLE Person_temp
LIKE Person;

INSERT INTO Person_temp
SELECT *
FROM Person
GROUP BY Email;

DROP TABLE Person;
ALTER TABLE Person_temp 
RENAME TO Person;

