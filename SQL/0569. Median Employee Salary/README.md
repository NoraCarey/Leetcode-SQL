## [Build-in Functions](https://www.w3schools.com/sql/sql_ref_mysql.asp)

Built in functions are simply functions come already implemented in the MySQL server.These functions allow us to perform different types of manipulations on the data. The built in functions can be basically categorized into the following most used categories.

* String functions
* Numeric functions
* Date and time functions
* Aggregate functions (count(), sum(), avg(), max(), min())
* Other functions

## [COUNT Window Function](https://medium.com/analytics-vidhya/mysql-window-functions-37e1bb222d30)

The **COUNT()** window function counts the number of input rows. 

**COUNT(*)** counts all of the rows in the target table if they **do or do not include nulls**. 

**COUNT(expression)** computes the number of rows with **non-NULL values** in a specific column or expression.

## [ROW_NUMBER() Window Function](https://codingsight.com/similarities-and-differences-among-rank-dense_rank-and-row_number-functions/)

Unlike the **_RANK_** and **_DENSE_RANK_** functions, the **_ROW_NUMBER_** function simply returns the row number of the sorted records starting with 1. 

Example: 
```
SELECT name, company, power,
ROW_NUMBER() OVER(PARTITION BY company ORDER BY power DESC) AS RowRank
FROM Cars
```

## CEIL(), FLOOR() function

The **CEIL()** function returns the smallest integer value that is bigger than or equal to a number.

The **FLOOR()** function returns the largest integer value that is smaller than or equal to a number.


