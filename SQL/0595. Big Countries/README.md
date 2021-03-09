
## [UNION operator](https://www.mysqltutorial.org/sql-union-mysql.aspx/)

use MySQL **UNION operator** to combine two or more result sets from multiple **SELECT** statements into a single result set.

The following illustrates the syntax of the **UNION** operator:
```
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
...
```

By default, **duplicate rows** are removed from **UNION** results. 

The optional **DISTINCT** keyword has the same effect but makes it explicit.

With the optional **ALL** keyword, duplicate-row removal does not occur and the result includes all matching rows from all the SELECT statements.

To combine result set of two or more queries using the UNION operator, these are the basic rules that you must follow:

* First, the number and the orders of columns that appear in all SELECT statements must be the same.

* Second, the data types of columns must be the same or compatible.
