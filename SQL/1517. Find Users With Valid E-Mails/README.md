# [RLIEK Operator](https://www.geeksforgeeks.org/rlike-operator-in-mysql/)

**_RLIKE Fuction-** is used to performs a pattern match of a string expression against a pattern.

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
* **+**	One or more instances of strings preceding it
* **.**	Any single character
* **?**	Match zero or one instances of the strings preceding it
```
Gives all the titles containing ‘com’. Example – comedy , romantic comedy.
SELECT title FROM movies_tbl WHERE title REGEXP 'com?';
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


# [REGEXP Operator](https://www.geeksforgeeks.org/mysql-regular-expressions-regexp/)

**Regular expressions (Regexp)** is the operator used when performing regular expression pattern matches. **RLIKE** is the synonym
