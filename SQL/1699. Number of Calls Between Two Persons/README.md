# [LEAST Function](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#function_least)

**_LEAST(value1,value2,...)_**

With two or more arguments, returns the **_smallest (minimum-valued) argument_**. The arguments are compared using the following rules:

* If any argument is **_NULL_**, the result is NULL. No comparison is needed.
* If all arguments are integer-valued, they are compared as integers.
* If the arguments comprise a **_mix of numbers and strings_**, they are compared as strings.
* f any argument is a _**nonbinary (character) string_**, the arguments are compared as nonbinary strings.

```
SELECT LEAST(34.0,3.0,5.0,767.0);

SELECT LEAST('B','A','C');
```


# [GREATEST Function](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#function_greatest)

**_GREATEST(value1,value2,...)_**

With two or more arguments, returns the **_largest (maximum-valued) argument_**. The arguments are compared using the same rules as for **_LEAST()_**.

**GREATEST() returns NULL if any argument is NULL**.

