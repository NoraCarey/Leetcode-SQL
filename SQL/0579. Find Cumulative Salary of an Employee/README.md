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

* You can specify just the start of the frame, in which case the current row is implicitly the end

or use BETWEEN to specify both frame endpoints:

[Window Function Frame Specification Example](https://blog.csdn.net/georgelee954/article/details/105763302?utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-14.control&dist_request_id=&depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-14.control)
