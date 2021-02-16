

## [**RANK**, **DENSE_RANK**, **ROW_NUMBER functions**](https://codingsight.com/similarities-and-differences-among-rank-dense_rank-and-row_number-functions/)

**RANK function** 

The **_RANK_** function is used to retrieve ranked rows based on the condition of the ORDER BY clause.

Example:
```
SELECT name,company, power,
RANK() OVER(PARTITION BY company ORDER BY power DESC) AS PowerRank
FROM Cars
```
The **_RANK_** function skips the next N-1 positions before incrementing the counter. For instance, there is a tie for the values in the power column between the 1st and 2nd rows, therefore the RANK function skips the next (2-1 = 1) one record and jumps directly to the 3rd row.


**DENSE_RANK function** 

The **_DENSE_RANK_** function is similar to RANK function however the DENSE_RANK function does not skip any ranks if there is a tie between the ranks of the preceding records. 

Example:
```
SELECT name,company, power,
DENSE_RANK() OVER(PARTITION BY company ORDER BY power DESC) AS DensePowerRank
FROM Cars
```


**ROW_NUMBER function** 

Unlike the **_RANK_** and **_DENSE_RANK_** functions, the **_ROW_NUMBER_** function simply returns the row number of the sorted records starting with 1. 

Example: 
```
SELECT name, company, power,
ROW_NUMBER() OVER(PARTITION BY company ORDER BY power DESC) AS RowRank
FROM Cars
```



**_PARTITION BY_** used in conjunction with **_RANK_** function to change the scope of the ranking, added another level of sort to the output.
