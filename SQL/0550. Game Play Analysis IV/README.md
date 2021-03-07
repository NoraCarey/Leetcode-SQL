## [NTH_VALUE Window Function](https://www.mysqltutorial.org/mysql-window-functions/mysql-nth_value-function/)

The **_NTH_VALUE()_** is a window function that allows you to get a value from the Nth row in an ordered set of rows.

The following shows the syntax of the **_NTH_VALUE() function_**:

```
NTH_VALUE(expression, N)
FROM FIRST
OVER (
    partition_clause
    order_clause
    frame_clause
)
```

The **_NTH_VALUE() function_** returns the value of expression from the Nth row of the window frame. If that Nth row does not exist, the function returns **_NULL_**. N must be a **_positive integer_** e.g., 1, 2, and 3.

**NOTICE**

If there is no frame caluse to set limit for the output, the outputs for (N-1) rows is **_NULL_**. 
For example, if we want to get the second highest salary using NTH_VALUE, the output for the first row with the highest salary is NULL.

## [Window Function Frame Specification](https://docs.oracle.com/cd/E17952_01/mysql-8.0-en/window-functions-frames.html#:~:text=The%20definition%20of%20a%20window,how%20to%20define%20the%20subset.&text=By%20defining%20a%20frame%20to,running%20totals%20for%20each%20row.)


