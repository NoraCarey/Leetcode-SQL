
## LIMIT clause

The following illustrates the **_LIMIT_** clause syntax with two arguments:
```
SELECT 
    select_list
FROM
    table_name
LIMIT [offset,] row_count;
```

In this syntax:
* The **_offset_** specifies the offset of the first row to return. The **_offset_** of the first row is 0, not 1.
* The **_row_count_** specifies the number of rows to return

## IF function

The following ilustrates the **_IF_** Function:
```
IF(condition, value_if_true, value_if_false)
```

Mysql [IF LIMIT OFFSET Solution](mysql_if_limit_offset.sql):
```sql
SELECT IF(COUNT(DISTINCT Salary) = 1, NULL, (SELECT Salary
                                             FROM Employee
                                             ORDER BY Salary DESC
                                             LIMIT 1, 1)) AS SecondHighestSalary
FROM Employee;
```

## COALESCE function

The following illustrates the **_COALESCE_** function syntax:
```
COALESCE(value1,value2,...);
```

The **_COALESCE_** function takes a number of arguments and returns the first **_non-NULL_** argument. 
In case all arguments are **_NULL_**, the **_COALESCE_** function returns NULL.

The following shows some simple examples of using the **_COALESCE_** function:
```
SELECT COALESCE(NULL, 0);  -- 0
SELECT COALESCE(NULL, NULL); -- NULL;
```

Mysql [COALESCE_LIMIT_OFFSET Solution](mysql_coalesce_limit_offset.sql):
```sql
SELECT COALESCE((SELECT DISTINCT Salary
                 FROM Employee
                 ORDER BY Salary DESC
                 LIMIT 1, 1), NULL) AS SecondHighestSalary;
```

## IFNULL function

**_IFNULL_** function is one of the MySQL control flow functions that accepts **_two_** arguments and returns the first argument if it is **_not NULL_**.

The following illustrates the **_IFNULL_** function syntax:
```
IFNULL(expression_1,expression_2);
```

Mysql [IFNULL_LIMIT_OFFSET Solution](mysql_ifnull_limit_offset.sql):
```
SELECT IFNULL((SELECT DISTINCT Salary
                 FROM Employee
                 ORDER BY Salary DESC
                 LIMIT 1, 1), NULL) AS SecondHighestSalary;
```

## [**RANK**, **DENSE_RANK**, **ROW_NUMBER functions**](https://codingsight.com/similarities-and-differences-among-rank-dense_rank-and-row_number-functions/)

**RANK function** 

The **_RANK_** function is used to retrieve ranked rows based on the condition of the ORDER BY clause.

Example:
```
SELECT name,company, power,
RANK() OVER(PARTITION BY company ORDER BY power DESC) AS PowerRank
FROM Cars
```
The **_RANK_** function skips the next N-1 positions before incrementing the counter. For instance, there is a tie for the values in the power column between the 1st and 2nd rows, therefore the RANK function skips the next (2-1 = 1) one record and jumps directly to the 3rd row.


**DENSE_RANK function** 

The **_DENSE_RANK_** function is similar to RANK function however the DENSE_RANK function does not skip any ranks if there is a tie between the ranks of the preceding records. 

Example:
```
SELECT name,company, power,
DENSE_RANK() OVER(PARTITION BY company ORDER BY power DESC) AS DensePowerRank
FROM Cars
```


**ROW_NUMBER function** 

Unlike the **_RANK_** and **_DENSE_RANK_** functions, the **_ROW_NUMBER_** function simply returns the row number of the sorted records starting with 1. 

Example: 
```
SELECT name, company, power,
ROW_NUMBER() OVER(PARTITION BY company ORDER BY power DESC) AS RowRank
FROM Cars
```



**_PARTITION BY_** used in conjunction with **_RANK_** function to change the scope of the ranking, added another level of sort to the output.



