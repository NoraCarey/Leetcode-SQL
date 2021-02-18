## [**Delete Duplicate Rows in MySQL**](https://www.mysqltutorial.org/mysql-delete-duplicate-rows/)

## Delete duplicate rows using DELETE JOIN statement

The following statement deletes duplicate rows and keeps the highest id:
```
DELETE t1 FROM contacts t1
INNER JOIN contacts t2 
WHERE 
    t1.id < t2.id AND 
    t1.email = t2.email;
    
SELECT * FROM contacts;
```

MySQL [DETELTE JOIN SOLUTION](mysql_delete_duplicate_rows_using_delete_join_statement.sql)


## Delete duplicate rows using an intermediate table

* Step 1. **_Create a new table_** whose structure is the same as the original table:
```
CREATE TABLE source_copy LIKE source;
```

* Step 2. **_Insert distinct rows_** from the original table to the new table:
```
INSERT INTO source_copy
SELECT * FROM source
GROUP BY col; -- column that has duplicate values
```

* Step 3. **_drop the original table_** and **_rename_** the immediate table to the original one
```
DROP TABLE source;
ALTER TABLE source_copy RENAME TO source;
```

MySQL [INTERMEDIATE TABLE SOLUTION](mysql_delete_duplicate_rows_using_an_intermediate_table.sql)

## Delete duplicate rows using the ROW_NUMBER() function

The following statement uses the **_ROW_NUMBER()_** function to assign a sequential integer number to each row. If the email is duplicate, the row number will be **_greater than one_**.

Example:
```
DELETE FROM contacts 
WHERE 
	id IN (
	SELECT 
		id 
	FROM (
		SELECT 
			id,
			ROW_NUMBER() OVER (
				PARTITION BY email
				ORDER BY email) AS row_num
		FROM 
			contacts
		
	) t
    WHERE row_num > 1
);
```

MySQL [ROW NUMBER SOLUTION](mysql_delete_duplicate_rows_using_row_number.sql)



