# [LEAD Window Function](https://www.sqltutorial.org/sql-window-functions/sql-lead/#:~:text=SQL%20LEAD()%20is%20a,which%20follows%20the%20current%20row.&text=The%20LEAD()%20function%20can,value%20of%20the%20following%20row.)

**LEAD()** is a window function that provides access to a row at a specified physical offset which follows the current row.

For example, by using the **LEAD() function**, from the current row, you can access data of the next row, or the second row that follows the current row, or the third row that follows the current row, and so on.

The syntax of the **LEAD()** function is as follows:
```
LEAD(return_value [,offset[, default ]]) OVER (
    PARTITION BY expr1, expr2,...
	ORDER BY expr1 [ASC | DESC], expr2,...
)
```

* **return_value**: The return value of the following row offsetting from the current row.
* **offset**: The number of rows forwards from the current row from which to access data. The offset must be a non-negative integer. If you don’t specify offset, it defaults to 1.
* **default**: The function returns default if the offset goes beyond the scope of the partition. If you do not specify default, NULL is returned.

