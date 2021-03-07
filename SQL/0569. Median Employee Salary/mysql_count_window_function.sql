

# Window Function COUNT() calculates the number of employees in each company
# Window Function ROW_NUMBER() records the salary ranking for each employee in each company


SELECT Id, Company, Salary
FROM (SELECT Id, Company, Salary,
             COUNT(Salary) OVER(PARTITION BY Company) AS count_num,
             ROW_NUMBER() OVER(PARTITION BY Company
                               ORDER BY Salary) AS ranking
      FROM Employee) tbl
# select the employees have the median salary in each company 
# if company have the odd number employees, floor() and ceil() will return to the same number
# if company have the even number employees, floor() and ceil() will return to two consecutive numbers
WHERE ranking = FLOOR((count_num + 1) / 2) OR 
      ranking = CEIL((count_num + 1) / 2);


