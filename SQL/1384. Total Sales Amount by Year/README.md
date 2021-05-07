# [Recursive CTE](https://www.mysqltutorial.org/mysql-recursive-cte/)

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


