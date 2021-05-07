# [Recursive CTE](https://www.mysqltutorial.org/mysql-recursive-cte/)

A **_recursive common table expression (CTE)_** is a CTE that has a subquery which refers to the CTE name itself. The following illustrates the syntax of a recursive CTE
```
WITH RECURSIVE cte_name AS (
                            initial_query  -- anchor member
                            UNION ALL
                            recursive_query -- recursive member that references to the CTE name
                            )
SELECT * FROM cte_name;
```

A **_recursive CTE_** consists of three main parts:

* An initial query that forms the base result set of the CTE structure. The initial query part is referred to as an anchor member.
* A recursive query part is a query that references to the CTE name, therefore, it is called a recursive member. The recursive member is joined with the anchor member by a **_UNION ALL or UNION DISTINCT_** operator.
* A termination condition that ensures the recursion stops when the recursive member returns no row.

The **_execution order_** of a recursive CTE is as follows:

* First, separate the members into two: anchor and recursive members.
* Next, execute the anchor member to form the base result set ( R0) and use this base result set for the next iteration.
* Then, execute the recursive member with Ri result set as an input and make Ri+1 as an output.
* After that, repeat the third step until the recursive member returns an empty result set, in other words, the termination condition is met.
* Finally, combine result sets from R0 to Rn using UNION ALL operator.

The recursive member must **_not contain_** the following constructs:

* **_Aggregate functions_** e.g., MAX, MIN, SUM, AVG, COUNT, etc.
* **_GROUP BY_** clause
* **_ORDER BY_** clause
* **_LIMIT_** clause
* **_DISTINCT_**

Note that the above constraint **does not apply to the anchor member**.

See the following simple recursive CTE example:
```
WITH RECURSIVE cte_count (n) AS (
                                 SELECT 1
                                 UNION ALL
                                 SELECT n + 1 
                                 FROM cte_count 
                                 WHERE n < 3
                                 )
                                 
SELECT n 
FROM cte_count;
```


# [LEFT Function](https://www.w3schools.com/sql/func_mysql_left.asp)

# [DATE_ADD Function / DATE_SUB Function](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-add)

**DATE_ADD(date,INTERVAL expr unit)**
**DATE_SUB(date,INTERVAL expr unit)**

These functions perform date arithmetic. 
The **_date_** argument specifies the **_starting date or datetime value_**. 

**_expr_** is an expression specifying the **_interval value_** to be added or subtracted from the starting date. **expr** is evaluated as a string. it may start with a - for **_negative intervals_**.

**_unit_** is a keyword indicating the units in which the expression should be interpreted

* **_DATE_** if the date argument is a DATE value and your calculations involve only **_YEAR, MONTH, and DAY parts_** (that is, no time parts)
* **_DATETIME_** if the first argument is a DATETIME (or TIMESTAMP) value, or if the first argument is a DATE and the unit value uses **_HOURS, MINUTES, or SECONDS_**

```
SELECT DATE_ADD('2018-05-01',INTERVAL 1 DAY);
SELECT DATE_ADD('2100-12-31 23:59:59', INTERVAL '1:1' MINUTE_SECOND);
SELECT DATE_SUB('2025-01-01 00:00:00', INTERVAL '1 1:1:1' DAY_SECOND);
```

# [LEAST Function](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#function_least)

# [GREATEST Function](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#function_greatest)


