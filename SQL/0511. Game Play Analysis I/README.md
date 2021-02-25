## [FIRST_VALUE() Window Function](https://www.mysqltutorial.org/mysql-window-functions/mysql-first_value-function/)

The **_FIRST_VALUE()_** is a window function that allows you to select the first row of a window frame, partition, or result set.

The following illustrates the syntax of the **_FIRST_VALUE()_** function:
'''
FIRST_VALUE (expression) OVER (
   [partition_clause]
   [order_clause]
   [frame_clause]
)
'''

