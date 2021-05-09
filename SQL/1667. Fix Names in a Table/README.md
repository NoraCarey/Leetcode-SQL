# [SUBSTRING Function](https://www.w3schools.com/sql/func_mysql_substring.asp)

The **SUBSTRING()** function extracts a substring from a string (starting at any position).

The **SUBSTR()** and **MID()** functions equals to the SUBSTRING() function.

Syntax
```
SUBSTRING(string, start, length)
OR
SUBSTRING(string FROM start FOR length)
```

* **string**:	Required. The string to extract from
* **start**:	Required. The start position. Can be both a positive or negative number. If it is a positive number, this function extracts from the beginning of the string. If it is a negative number, this function extracts from the end of the string
* **length**:	Optional. The number of characters to extract. If omitted, the whole string will be returned (from the start position)
