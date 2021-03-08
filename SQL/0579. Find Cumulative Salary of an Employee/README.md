# [LAST_VALUE](https://www.mysqltutorial.org/mysql-window-functions/mysql-last_value-function/)

The **LAST_VALUE()** function is a window function that allows you to select the last row in an ordered set of rows.

The following shows the syntax of the **LAST_VALUE()** function:
```
LAST_VALUE (expression) OVER (
   [partition_clause]
   [order_clause]
   [frame_clause]
)
```

# [Window Function Frame Specification](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/window-functions-frames.html#:~:text=The%20definition%20of%20a%20window,how%20to%20define%20the%20subset.&text=By%20defining%20a%20frame%20to,running%20totals%20for%20each%20row.)

The **frame clause**, if given, has this syntax:

```
frame_clause:
    frame_units frame_extent

frame_units:
    {ROWS OR RANGE}
```

## In the **absence of a frame clause**, the default frame depends on whether an **ORDER BY** clause is present.

* **With ORDER BY**: The default frame includes rows from the **partition start through the current row, including all peers of the current row** (rows equal to the current row according to the ORDER BY clause). The default is equivalent to this frame specification:

```
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
```

* **Without ORDER BY**: The default frame includes **all partition rows** (because, without ORDER BY, all partition rows are peers). The default is equivalent to this frame specification:

```
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
```

## The **frame_units** value indicates the type of relationship between the current row and frame rows:

* **ROWS**: The frame is defined by beginning and ending row positions. Offsets are differences in **row numbers** from the current row number.

* **RANGE**: The frame is defined by rows within a value range. Offsets are differences in **row values** from the current row value.

## The **frame_extent** value indicates the start and end points of the frame.

There are two methods to write the frame_extent

* You can specify just the **start of the frame**, in which case the current row is implicitly the end:
```
frame_extent:
    {frame_start}
```

* Or use **BETWEEN** to specify both frame endpoints:
```
frame_extent:
    {BETWEEN frame_start AND frame_end}
```

The **frame_start** or **frame_end** has following forms:
```
frame_start, frame_end: {
    CURRENT ROW
  | UNBOUNDED PRECEDING
  | UNBOUNDED FOLLOWING
  | expr PRECEDING
  | expr FOLLOWING
}
```

With **BETWEEN** syntax, **frame_start** must occur before than **frame_end**.

The permitted **frame_start and frame_end** values have these meanings:

* **CURRENT ROW**: For **ROWS**, the bound is the current row. For **RANGE**, the bound is the peers of the current row.

* **UNBOUNDED PRECEDING**: The bound is the **first partition row**.

* **UNBOUNDED FOLLOWING**: The bound is the **last partition row**.

* **expr PRECEDING**: 

For **ROWS**, the bound is expr rows before the current row. 

For **RANGE**, the bound is the rows with values equal to the current row value minus expr; if the current row value is NULL, the bound is the peers of the row. If the current row value is **NULL**, the bound is the peers of the row.

* **expr FOLLOWING**: 

For **ROWS**, the bound is expr rows after the current row. 

For **RANGE**, the bound is the rows with values equal to the current row value plus expr; if the current row value is **NULL**, the bound is the peers of the row.

For **expr PRECEDING** (and **expr FOLLOWING**), **expr** can be a **nonnegative numeric literal**, or a temporal interval of the form **INTERVAL val unit**. 

For **INTERVAL expressions**, **val** specifies nonnegative interval value, and **unit** is a keyword indicating the units in which the value should be interpreted. For example, **DAY, MINUTE_SECOND**

Examples of valid **expr PRECEDING** and **expr FOLLOWING** indicators:
```
10 PRECEDING
INTERVAL 5 DAY PRECEDING
5 FOLLOWING
INTERVAL '2:30' MINUTE_SECOND FOLLOWING
```

![]()
