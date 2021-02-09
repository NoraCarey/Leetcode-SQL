## [SET statements](https://dev.mysql.com/doc/refman/5.7/en/set-variable.html)

**_SET_** Syntax for Variable Assignment
**_SET_** syntax for variable assignment enables you to assign values to different types of variables that affect the operation of the server or clients:

**User-Defined Variable Assignment**

You can store a value in a user-defined variable in one statement and refer to it later in another statement. 
This enables you to pass values from one statement to another.
User variable names are not case-sensitive. Names have a maximum length of 64 characters.

A user-defined variable is written as **_@var_name_** and is assigned an expression value as follows:
```
SET @var_name = expr;
```

Examples:
```
SET @name = 43;
SET @total_tax = (SELECT SUM(tax) FROM taxable_transactions);
```

**Parameter and Local Variable Assignment**

**_SET_** applies to parameters and local variables in the context of the stored object within which they are defined.

Example:
```
CREATE PROCEDURE p(increment INT)
BEGIN
  DECLARE counter INT DEFAULT 0;
  WHILE counter < 10 DO
    -- ... do work ...
    SET counter = counter + increment;
  END WHILE;
END;
```

## [**RANK**, **DENSE_RANK**, **ROW_NUMBER Functions**](https://codingsight.com/similarities-and-differences-among-rank-dense_rank-and-row_number-functions/)

**_RANK_** function

The **_RANK_** function is used to retrieve ranked rows based on the condition of the ORDER BY clause.

Example:
```
SELECT name,company, power,
RANK() OVER(PARTITION BY company ORDER BY power DESC) AS PowerRank
FROM Cars
```
The **_RANK_** function skips the next N-1 positions before incrementing the counter.


**_PARTITION BY_** used in conjunction with **_RANK_** function to change the scope of the ranking, added another level of sort to the output.








