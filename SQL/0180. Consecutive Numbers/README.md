## [**Window Functions**](https://www.mysqltutorial.org/mysql-window-functions/)

The **window functions** allow you to solve query problems in new, easier ways, and with better performance.

**Nonaggregate window functions**: for each row from a query, perform a calculation using rows related to that row.

They include **_CUME_DIST(), DENSE_RANK(), PERCENT_RANK(), RANK(), ROW_NUMBER(), FIRST_VALUE(),  LAST_VALUE(), NTH_VALUE(), LAG(), LEAD(), NTILE()_**

## Window function syntax

The general syntax of calling a window function is as follows:
```
window_function_name(expression) OVER ( 
   [partition_defintion]
   [order_definition]
   [frame_definition]
)
```

In this syntax:
* First, specify the window function name followed by an expression.

* Second, specify the **_OVER_** clause which has three possible elements: partition definition, order definition, and frame definition.

You can specify one or more expressions in the **_PARTITION BY_** clause. Multiple expressions are separated by commas.

The **_ORDER BY_** clause specifies how the rows are ordered within a partition.

A **_frame_** is a subset of the current partition. To define the subset, you use the frame clause as follows:
```
frame_unit {<frame_start>|<frame_between>}
```

The **frame unit** specifies the type of relationship between the current row and frame rows. It can be **_ROWS_** or **_RANGE_**. The offsets of the current row and frame rows are the row numbers if the frame unit is **_ROWS_** and row values the frame unit is **_RANGE_**.

The **_frame_start_** and **_frame_between_** define the frame boundary.

The **frame_start** contains one of the following:

* **_UNBOUNDED PRECEDING_**: frame starts at the first row of the partition.
* **_N PRECEDING_**: a physical N of rows before the first current row. N can be a literal number or an expression that evaluates to a number.
* **_CURRENT ROW_**: the row of the current calculation

The **frame_between** is as follows:
```
BETWEEN frame_boundary_1 AND frame_boundary_2  
```

The **_frame_boundary_1_** and **_frame_boundary_2_** can each contain one of the following:

* **_frame_start_**: as mentioned previously.
* **_UNBOUNDED FOLLOWING_**: the frame ends at the final row in the partition.
* **_N FOLLOWING_**: a physical N of rows after the current row.

## LAG(), LEAD() functions

**[LAG() function]**(https://www.mysqltutorial.org/mysql-window-functions/mysql-lag-function/)

The **_LAG()_** function is a window function that allows you to look back a number of rows and access data of that row from the current row.

The following illustrates the syntax of the **_LAG()_** function:
```
LAG(<expression>[,offset[, default_value]]) OVER (
    PARTITION BY expr,...
    ORDER BY expr [ASC|DESC],...
)
```

If **_offset_** is 0, then the LAG() function evaluates the expression for the current row. If you don’t specify the offset, then the **_LAG()_** function uses **_1_** by default. If you omit the default_value, the LAG() function returns **_NULL_** by default.

**[LEAD() function]**(https://www.mysqltutorial.org/mysql-window-functions/mysql-lead-function/)

The **_LEAD()_** function is a window function that allows you to look forward a number of rows and access data of that row from the current row.

Similar to the **_LAG()_** function, the **_LEAD()_** function is very useful for calculating the difference between the current row and the subsequent row within the same result set. And the usage of **_LEAD()_** functions is the same as **_LAG()'s_**











