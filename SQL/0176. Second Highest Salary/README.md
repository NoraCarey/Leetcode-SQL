
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
* The **_offset_** specifies the offset of the first row to return. The **_offset_** of the first row is **0, not 1**.
* The **_row_count_** specifies the number of rows to return

## IF function

The following ilustrates the **_IF_** Function:
```
IF(condition, value_if_true, value_if_false)
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

## IFNULL function

**_IFNULL_** function is one of the MySQL control flow functions that accepts **_two_** arguments and returns the first argument if it is **_not NULL_**.

The following illustrates the **_IFNULL_** function syntax:
```
IFNULL(expression_1,expression_2);
```


