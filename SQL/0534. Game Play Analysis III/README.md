## [SUM() Window Function](https://mysqlserverteam.com/mysql-8-0-2-introducing-window-functions/)

When we add a **_OVER ()_** syntax after the **_SUM(i)_**, it signals that this is a **_window function_**, as opposed to a **_grouped aggregate function_**.

**This is the set of aggregate functions in MySQL that support windowing:**

COUNT, 
SUM, 
AVG, 
MIN, 
MAX, 
BIT_OR, 
BIT_AND, 
BIT_XOR,
STDDEV_POP (and its synonyms STD, STDDEV), 
STDDEV_SAMP,
VAR_POP (and its synonym VARIANCE),
VAR_SAMP**

**The set of specialized window functions are:**

RANK, 
DENSE_RANK, 
PERCENT_RANK, 
CUME_DIST, 
NTILE,
ROW_NUMBER, 
FIRST_VALUE, 
LAST_VALUE, 
NTH_VALUE, 
LEAD,
LAG



