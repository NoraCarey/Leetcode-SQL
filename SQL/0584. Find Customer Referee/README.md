
MySQL uses three-valued logic -- **TRUE, FALSE and UNKNOWN**. 

Anything compared to **NULL** evaluates to the third value: **UNKNOWN**.

Therefore, when we use comparison operators such as '=', '<>', '>', MySQL could not identify **NULL value**, we should use **IS NULL, IS NOT NULL** to test.
