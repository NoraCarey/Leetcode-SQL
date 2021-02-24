## LAG(), LEAD() functions

[**LAG() function**](https://www.mysqltutorial.org/mysql-window-functions/mysql-lag-function/)

The **_LAG()_** function is a window function that allows you to look back a number of rows and access data of that row from the current row.

The following illustrates the syntax of the **_LAG()_** function:
```
LAG(<expression>[,offset[, default_value]]) OVER (
    PARTITION BY expr,...
    ORDER BY expr [ASC|DESC],...
)
```

If **_offset_** is 0, then the LAG() function evaluates the expression for the current row. If you don’t specify the offset, then the **_LAG()_** function uses **_1_** by default. If you omit the default_value, the LAG() function returns **_NULL_** by default.

[**LEAD() function**](https://www.mysqltutorial.org/mysql-window-functions/mysql-lead-function/)

The **_LEAD()_** function is a window function that allows you to look forward a number of rows and access data of that row from the current row.

Similar to the **_LAG()_** function, the **_LEAD()_** function is very useful for calculating the difference between the current row and the subsequent row within the same result set. And the usage of **_LEAD()_** functions is the same as **_LAG()'s_**

## [DATEDIFF function](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_datediff)

The syntax of the MySQL **DATEDIFF function** is as follows:
```
DATEDIFF(date_expression_1,date_expression_2);
```

date_expression_1 and date_expression_2 are **date** or **date-and-time** expressions. Only the **date** parts of the values are used in the calculation.

