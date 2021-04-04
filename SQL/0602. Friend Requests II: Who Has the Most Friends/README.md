# [UNION / UNION ALL OPERATOR](https://www.mysqltutorial.org/sql-union-mysql.aspx/)

**UNION** operator allows you to combine two or more result sets of queries into a single result set. 

The following illustrates the syntax of the **UNION** operator:
```
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
...
```

To combine result set of two or more queries using the **UNION** operator, these are the basic rules that you must follow:

* First, the number and the orders of columns that appear in all **SELECT** statements must be the same.
* Second, the **data types** of columns must be the same or compatible.

By default, the **UNION** operator **removes duplicate rows** even if you don’t specify the DISTINCT operator explicitly.

If you use the **UNION ALL** explicitly, the **duplicate rows**, if available, **remain in the result**. Because **UNION ALL** does not need to handle duplicates, it performs faster than **UNION DISTINCT** .
