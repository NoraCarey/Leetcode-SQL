

SELECT *
FROM Users 
# WHERE mail RLIKE '^[A-Za-z][A-Za-z0-9\_\.\-]*@leetcode.com$';
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9\_\.\-]*@leetcode.com$';



