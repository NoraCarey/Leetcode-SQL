## MAX Function only consider Non-NULL values

## [Assignment Operators :=](https://dev.mysql.com/doc/refman/8.0/en/assignment-operators.html)

**:=** and **=** are both **Assignment Operators**, we could use them to Assign a value

# := Operator

For **:=**, we could use it in the **SET statement**

Unlike **=**, the **:=** operator is never interpreted as a comparison operator. This means we can use **:=** in any valid SQL statement (not just in SET statements) to assign a value to a variable.

We can make value assignments using **:=** in other statements besides **SELECT**, such as **UPDATE**

# = Operator

Within a **SET** statement, **=** is treated as an assignment operator, **=** is treated identically to **:=**

**=** is also treated as a comparison operator

## [Pivot table](https://linuxhint.com/mysql_pivot/)

The transformation of table data **from rows to columns** is called **pivoting tables**

Rotate rows to columns using **CASE statement** and **Aggregate Function** such as SUM(), MAX(), MIN(), COUNT(), it depends what kind of information you want to get.

## [ROW_NUMBER Window Function Pivot Table Explaination](https://leetcode.com/problems/students-report-by-geography/discuss/672308/(_)-MySQL-Solutions%3A-WINDOW-variables-(Follow-up-answer))

## [Assignment Operators Pivot Table Solution Explaination](https://leetcode.com/problems/students-report-by-geography/discuss/182616/follow-up-accepted-solution)

