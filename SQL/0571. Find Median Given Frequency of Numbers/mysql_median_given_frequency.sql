-- Take array [1,3,2] for example, is the first number 1 the median? No, because this array only have 3 elements but there are 2 of them (3, 2) are greater than 1. 
-- To continue, we know 3 is not the median as well since there are 2 elements smaller. But for the last element 2, there are equal amount of bigger and smaller numbers. 
-- So it is the median in this array!

-- What if an array has even amount of distinct values, the median is the average of the middle two elements next to each other after sorting this array. 
-- For example, [1, 5, 2, 7], the median number for this array should be (2 + 5) / 2. 
-- For 2, only 1 is smaller than it, and 5, 7 is bigger than it. 
-- For 5, 1 and 2 is smaller than it, only 7 is bigger than it. 
-- Either of 2 or 5, the difference(absolute value) of its bigger and smaller number than itself in this array is 1, 
-- which is the exactly frequency of a element in the distinct array.

-- So in general, the median's frequency should be equal or grater than the absolute difference of its bigger elements and small ones in an array no matter 
-- whether it has odd or even amount of numbers and whether they are distinct. This rule is the key, and it is represented as the following code.


SELECT AVG(n.Number) AS median
FROM Numbers n
WHERE n.Frequency >= ABS((SELECT SUM(Frequency)
                          FROM Numbers 
                          WHERE n.Number >= Number) - 
                         (SELECT SUM(Frequency)
                          FROM Numbers 
                          WHERE n.Number <= Number));
                          
                          

