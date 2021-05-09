# [DATE Function](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date)

**DATE(expr)** function extracts the date part of the date or datetime expression expr.

```
SELECT DATE('2003-12-31 01:02:03');     -> '2003-12-31'
```

# [DAY(date) Function](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_day)

**DAY()** is a synonym for **DAYOFMONTH()**.

Returns the day of the month for date, in the range 1 to 31, or 0 for dates such as '0000-00-00' or '2008-00-00' that have a zero day part.

```
SELECT DAY('2007-02-03');            -> 3
```
