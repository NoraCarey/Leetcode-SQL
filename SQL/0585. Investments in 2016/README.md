
## CONCAT() Function

The **CONCAT()** function adds two or more expressions together.
```
CONCAT(expression1, expression2, expression3,...)
```

## CONCAT_WS() Function

The **CONCAT_WS()** function adds two or more expressions together with a separator.
```
CONCAT_WS(separator, expression1, expression2, expression3,...)
```

## [GROUP_CONCAT() function](https://www.w3resource.com/mysql/aggregate-functions-and-grouping/aggregate-functions-and-grouping-group_concat.php)

**GROUP_CONCAT()** function returns a string with concatenated non-NULL value from a group.

Returns NULL when there are no non-NULL values.

## [EXISTS Condition](https://www.techonthenet.com/mysql/exists.php)

The MySQL **EXISTS condition** is used in combination with a subquery and is considered "to be met" if the subquery returns at least one row. It can be used in a SELECT, INSERT, UPDATE, or DELETE statement.

The syntax for the **EXISTS condition** in MySQL is:
```
WHERE EXISTS ( subquery );
```

subquery: A **SELECT** statement that usually starts with SELECT * rather than a list of expressions or column names.






