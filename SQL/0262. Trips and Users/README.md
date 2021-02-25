## [CASE Expression](https://www.mysqltutorial.org/mysql-case-function/) 

**_CASE_** expression allows us to add **_if-else logic_** to a query. Generally speaking, you can use the CASE expression anywhere that allows a valid expression e.g., SELECT, WHERE and ORDER BY clauses.

The CASE expression has two forms: **_simple CASE_** and **_searched CASE_**.

## Simple CASE expression

The following illustrates the syntax of a **_simple  CASE expression_**:
```
CASE value
   WHEN value1 THEN result1
   WHEN value2 THEN result2
   …
   [ELSE else_result]
END
```

## Searched CASE expression

The following shows the syntax of a **_searched CASE expression_**:
```
CASE
   WHEN expression1 THEN result1
   WHEN expression2 THEN result2
   …
   [ELSE else_result]
END
```
