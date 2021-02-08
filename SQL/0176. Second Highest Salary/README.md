
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

Mysql [LIMIT OFFSET Solution](mysql_limit_offset.sql):
```sql
SELECT Salary AS SecondHighestSalary
FROM Employee
ORDER BY Salary DESC
LIMIT 1, 1;
```




