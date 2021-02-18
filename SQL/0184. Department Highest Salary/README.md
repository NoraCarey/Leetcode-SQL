## [**CTE or common table expression**](https://www.mysqltutorial.org/mysql-cte/)

# MySQL CTE syntax

A **_common table expression_** is a named temporary result set that exists only within the execution scope of a single SQL statement e.g.,**_SELECT, INSERT, UPDATE, or DELETE_**.


Similar to a **_derived table_**, a **_CTE_** is not stored as an object and last only during the execution of a query.

Unlike a **_derived table_**, a **_CTE_** can be self-referencing (a recursive CTE) or can be referenced multiple times in the same query. In addition, a **_CTE_** provides better readability and performance in comparison with a **_derived table_**.

After the **_CTE_** is defined, you can use it as a view in a **_SELECT, INSERT, UPDATE, DELETE, or CREATE VIEW_** statement.

The following illustrates the basic syntax of a **_CTE_**
```
WITH cte_name (column_list) AS (
    query
) 
SELECT * FROM cte_name;
```

Notice that the number of columns in the **_query_** must be the same as the number of columns in the **_column_list_**. If you **_omit_** the **_column_list_**, the **_CTE_** will use the column list of the query that defines the **_CTE_**


# The WITH clause usages

There are some contexts that you can use the **_WITH_** clause to make **_common table expressions_**:

* First, a **_WITH_** clause can be used at the beginning of **_SELECT, UPDATE, and DELETE_** statements:
```
WITH ... SELECT ...
WITH ... UPDATE ...
WITH ... DELETE ...
```

* Second, a **_WITH_** clause can be used at the beginning of a **_subquery_** or a **_derived table subquery_**:
```
SELECT ... WHERE id IN (WITH ... SELECT ...);

SELECT * FROM (WITH ... SELECT ...) AS derived_table;
```

* Third, a **_WITH_** clause can be used immediately preceding **_SELECT_** of the statements that include a **_SELECT_** clause:
```
CREATE TABLE ... WITH ... SELECT ...
CREATE VIEW ... WITH ... SELECT ...
INSERT ... WITH ... SELECT ...
REPLACE ... WITH ... SELECT ...
DECLARE CURSOR ... WITH ... SELECT ...
EXPLAIN ... WITH ... SELECT ...
```




