# [RLIEK Operator](https://www.geeksforgeeks.org/rlike-operator-in-mysql/)

**RLIKE Fuction** is used to performs a pattern match of a string expression against a pattern.

* **^	caret(^)** matches Beginning of string
* **$**	End of string
* **[abc]**	Any character listed between the square brackets
```
Gives all the names containing ‘j’ or ‘z’.Example – Lorentz, Rajs
SELECT name FROM student_tbl WHERE name REGEXP '[jz]';
```
* **[^abc]**	Any character not listed between the square brackets
```
Gives all the names not containing ‘j’ or ‘z’. Example – nerton, sewall
SELECT name FROM student_tbl WHERE name REGEXP '[^jz]';
```
* **[A-Z]**	match any upper case letter
* **[a-z]**	match any lower case letter
```
Retrieve all names that contain a letter in the range of ‘b’ and ‘g’, followed by any character, followed by the letter ‘a’. Example – Tobias, sewall
Matches any single character(.)
SELECT name FROM student_tbl WHERE name REGEXP '[b-g].[a]';
```
* **[0-9]**	match any digit from 0 through to 9
* *	Zero or more instances of string preceding it
```
a* Match any sequence of zero or more 'a' characters.
mysql> SELECT 'Ban' REGEXP '^Ba*n';                     -> 1
mysql> SELECT 'Baaan' REGEXP '^Ba*n';                   -> 1
mysql> SELECT 'Bn' REGEXP '^Ba*n';                      -> 1
```
* **+**	One or more instances of strings preceding it
```
Match any sequence of one or more 'a' characters.
mysql> SELECT 'Ban' REGEXP '^Ba+n';                     -> 1
mysql> SELECT 'Bn' REGEXP '^Ba+n';                      -> 0
```
* **.**	Any single character

* **?**	Match zero or one instances of the strings preceding it
```
Gives all the titles containing ‘com’. Example – comedy , romantic comedy.
SELECT title FROM movies_tbl WHERE title REGEXP 'com?';

a? Match either zero or one 'a' character.
mysql> SELECT 'Bn' REGEXP '^Ba?n';                      -> 1
mysql> SELECT 'Ban' REGEXP '^Ba?n';                     -> 1
mysql> SELECT 'Baan' REGEXP '^Ba?n';                    -> 0
```
* **[[:<:]]**	matches the beginning of words
```
Gives all the titles starting with character “for”. Example – Forgetting Sarah Marshal.
SELECT title FROM movies_tbl WHERE title REGEXP '[[:<:]]for';
```
* **[[:>:]]**	matches the end of words
```
Gives all the titles ending with character “ack”. Example – Black.
SELECT title FROM movies_tbl WHERE REGEXP 'ack[[:>:]]';
```
* **[:class:]**	matches a character class i.e. **[:alpha:]** to match letters, **[:space:]** to match white space, **[:punct:]** is match punctuations and **[:upper:]** for upper class letters
```
Gives all the titles containing alphabetic character only. Example – stranger things, Avengers.
SELECT title FROM movies_tbl WHERE REGEXP '[:alpha:]';
```
* **p1|p2|p3**	Alternation; matches any of the patterns p1, p2, or p3
```
Gives all the names containing ‘be’ or ‘ae’. Example – Abel, Baer.
SELECT name FROM student_tbl WHERE name REGEXP 'be|ae';
```
* **{n}**	n instances of preceding element
* **{m,n}**	m through n instances of preceding element

To be more precise, a{n} matches exactly n instances of a. 
a{n,} matches n or more instances of a. 
a{m,n} matches m through n instances of a, inclusive. If both m and n are given, m must be less than or equal to n.

```
mysql> SELECT 'abcde' REGEXP 'a[bcd]{2}e';              -> 0
mysql> SELECT 'abcde' REGEXP 'a[bcd]{3}e';              -> 1
mysql> SELECT 'abcde' REGEXP 'a[bcd]{1,10}e';           -> 1
```

To use a literal instance of a special character in a regular expression, precede it by **two backslash (\)** characters. 

The MySQL parser interprets one of the backslashes, and the regular expression library interprets the other. 
For example, to match the string 1+2 that contains the special + character, only the last of the following regular expressions is the correct one:
```
mysql> SELECT '1+2' REGEXP '1+2';                       -> 0
mysql> SELECT '1+2' REGEXP '1\+2';                      -> 0
mysql> SELECT '1+2' REGEXP '1\\+2';                     -> 1
```

# [REGEXP Operator](https://www.geeksforgeeks.org/mysql-regular-expressions-regexp/)

**Regular expressions (Regexp)** is the operator used when performing regular expression pattern matches. **RLIKE** is the synonym
