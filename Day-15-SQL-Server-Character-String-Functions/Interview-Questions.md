# 🧠 Day 15 — SQL Server Character / String Functions

## Interview Questions & Answers

---

## 📌 Basic Interview Questions

### 1. What are Character / String Functions in SQL Server?

Character or String Functions are built-in SQL Server functions used to **manipulate, extract, search, format, replace, and transform string data**.

Examples:

```sql
UPPER()
LOWER()
LEN()
LEFT()
RIGHT()
SUBSTRING()
CHARINDEX()
REPLICATE()
REPLACE()
TRANSLATE()
STUFF()
```

---

### 2. What is the use of `UPPER()`?

`UPPER()` converts all alphabetic characters in a string to uppercase.

### Syntax

```sql
UPPER(string)
```

### Example

```sql
SELECT UPPER('subhash');
```

**Output:**

```text
SUBHASH
```

---

### 3. What is the use of `LOWER()`?

`LOWER()` converts all alphabetic characters in a string to lowercase.

```sql
SELECT LOWER('SUBHASH');
```

**Output:**

```text
subhash
```

---

### 4. What is the use of `LEN()`?

`LEN()` returns the number of characters in a string.

```sql
SELECT LEN('Subhash');
```

**Output:**

```text
7
```

**Interview Point:** `LEN()` does not count trailing spaces in SQL Server.

---

### 5. What is the difference between `LEN()` and `DATALENGTH()`?

| `LEN()`                         | `DATALENGTH()`               |
| ------------------------------- | ---------------------------- |
| Returns number of characters    | Returns number of bytes      |
| Ignores trailing spaces         | Includes trailing spaces     |
| Commonly used for string length | Useful for storage/byte size |

---

## ⬅️ LEFT() & RIGHT()

### 6. What is the use of `LEFT()`?

`LEFT()` returns a specified number of characters from the left side of a string.

```sql
SELECT LEFT('Subhash Yadav', 7);
```

**Output:**

```text
Subhash
```

---

### 7. What is the use of `RIGHT()`?

`RIGHT()` returns a specified number of characters from the right side of a string.

```sql
SELECT RIGHT('Subhash Yadav', 5);
```

**Output:**

```text
Yadav
```

---

### 8. How do you find employees whose names start with `S`?

Using `LIKE`:

```sql
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';
```

Using `LEFT()`:

```sql
SELECT *
FROM EMP
WHERE LEFT(ENAME, 1) = 'S';
```

---

### 9. How do you find employees whose names end with `S`?

```sql
SELECT *
FROM EMP
WHERE RIGHT(ENAME, 1) = 'S';
```

---

### 10. How do you find employees whose names start and end with the same character?

```sql
SELECT *
FROM EMP
WHERE LEFT(ENAME, 1) = RIGHT(ENAME, 1);
```

---

## ✂️ SUBSTRING()

### 11. What is the use of `SUBSTRING()`?

`SUBSTRING()` extracts a specified number of characters from a string starting at a particular position.

### Syntax

```sql
SUBSTRING(string, start, length)
```

### Example

```sql
SELECT SUBSTRING('Subhash Yadav', 1, 7);
```

**Output:**

```text
Subhash
```

---

### 12. What is the difference between `LEFT()` and `SUBSTRING()`?

`LEFT()` extracts characters only from the beginning of a string.

`SUBSTRING()` can extract characters starting from **any specified position**.

Example:

```sql
SELECT LEFT('Subhash Yadav', 7);
```

```sql
SELECT SUBSTRING('Subhash Yadav', 9, 5);
```

---

## 🔎 CHARINDEX()

### 13. What is the use of `CHARINDEX()`?

`CHARINDEX()` returns the starting position of a specified character or substring.

### Syntax

```sql
CHARINDEX(search_expression, string_expression [, start_location])
```

### Example

```sql
SELECT CHARINDEX(' ', 'Subhash Yadav');
```

**Output:**

```text
8
```

---

### 14. Can `CHARINDEX()` start searching from a specific position?

Yes.

```sql
SELECT CHARINDEX('a', 'Subhash Yadav', 5);
```

The third argument specifies the position from which SQL Server should start searching.

---

### 15. How can `CHARINDEX()` and `SUBSTRING()` be used together?

They can be combined to separate parts of a string.

For example, extracting the first name:

```sql
SELECT SUBSTRING(
    CNAME,
    1,
    CHARINDEX(' ', CNAME) - 1
) AS FNAME
FROM CUST;
```

---

## 🔁 REPLICATE()

### 16. What is the use of `REPLICATE()`?

`REPLICATE()` repeats a specified string a given number of times.

### Syntax

```sql
REPLICATE(string, number)
```

### Example

```sql
SELECT REPLICATE('*', 5);
```

**Output:**

```text
*****
```

---

### 17. Give a real-world use of `REPLICATE()`.

It can be used for **masking sensitive information**.

```sql
SELECT REPLICATE('X', 4) + RIGHT(ACCNO, 4)
FROM ACCOUNTS;
```

Example:

```text
XXXX9567
```

---

## 🔄 REPLACE()

### 18. What is the use of `REPLACE()`?

`REPLACE()` replaces all occurrences of a specified substring with another substring.

### Syntax

```sql
REPLACE(string, search_string, replacement_string)
```

### Example

```sql
SELECT REPLACE('SQL Server', 'Server', 'Database');
```

**Output:**

```text
SQL Database
```

---

### 19. What is a practical use of `REPLACE()`?

It can be used for:

* Cleaning text data
* Correcting unwanted values
* Standardizing strings
* Replacing specific words or characters

---

## 🔤 TRANSLATE()

### 20. What is the use of `TRANSLATE()`?

`TRANSLATE()` replaces individual characters based on their corresponding positions in two character sets.

### Example

```sql
SELECT TRANSLATE('ABCD', 'ABCD', '1234');
```

**Output:**

```text
1234
```

Mapping:

```text
A → 1
B → 2
C → 3
D → 4
```

---

### 21. What is the difference between `REPLACE()` and `TRANSLATE()`?

| `REPLACE()`                         | `TRANSLATE()`                       |
| ----------------------------------- | ----------------------------------- |
| Replaces a substring                | Maps individual characters          |
| Uses search and replacement strings | Uses character-to-character mapping |
| Suitable for replacing words/text   | Useful for character transformation |

---

## ✂️ STUFF()

### 22. What is the use of `STUFF()`?

`STUFF()` deletes a specified number of characters and inserts another string at a specified position.

### Syntax

```sql
STUFF(string, start, length, replacement)
```

### Example

```sql
SELECT STUFF('9431737280', 4, 4, 'XXXX');
```

**Output:**

```text
943XXXX7280
```

---

### 23. What is the difference between `REPLACE()` and `STUFF()`?

`REPLACE()` searches for matching text and replaces it.

`STUFF()` replaces characters based on their **position and length**.

---

## 🔗 Practical Query Questions

### 24. How do you display employee names in lowercase?

```sql
SELECT EMPNO,
       LOWER(ENAME) AS ENAME,
       SAL
FROM EMP;
```

---

### 25. How do you find employees whose names contain exactly 4 characters?

```sql
SELECT *
FROM EMP
WHERE LEN(ENAME) = 4;
```

---

### 26. How do you extract the first 3 characters of employee names?

```sql
SELECT ENAME,
       LEFT(ENAME, 3) AS SHORT_NAME
FROM EMP;
```

---

### 27. How do you extract the last 3 characters of employee names?

```sql
SELECT ENAME,
       RIGHT(ENAME, 3) AS LAST_CHARS
FROM EMP;
```

---

### 28. How can you generate employee email IDs using string functions?

```sql
SELECT EMPNO,
       ENAME,
       LEFT(ENAME, 3)
       + LEFT(CAST(EMPNO AS VARCHAR(10)), 3)
       + '@tcs.com' AS EMAILID
FROM EMP;
```

Example:

```text
SMITH + 736 → SMI736@tcs.com
```

---

### 29. How can you mask an account number?

```sql
SELECT REPLICATE('X', 4) + RIGHT(ACCNO, 4) AS MASKED_ACCOUNT
FROM ACCOUNTS;
```

Example:

```text
Original : 123456789567
Masked   : XXXX9567
```

---

### 30. How can you find the first name from a full name?

For:

```text
SACHIN TENDULKAR
```

Use:

```sql
SELECT SUBSTRING(
    CNAME,
    1,
    CHARINDEX(' ', CNAME) - 1
) AS FNAME
FROM CUST;
```

---

## 🌐 Real-World Scenario Questions

### 31. How would you generate a professional email ID from employee data?

Use `LEFT()` to extract part of the employee name, convert the employee number to text if necessary, and concatenate the values using `+`.

---

### 32. How would you mask sensitive account numbers?

Use `REPLICATE()` to generate masking characters and `RIGHT()` to display only the required ending digits.

---

### 33. How would you separate first name and last name stored in one column?

Use:

* `CHARINDEX()` to locate the space
* `SUBSTRING()` to extract the required portions

---

### 34. How would you standardize employee names?

Use `UPPER()` or `LOWER()` depending on the required format.

```sql
SELECT UPPER(ENAME)
FROM EMP;
```

---

### 35. How would you remove or replace unwanted characters from text?

Use functions such as `REPLACE()` and `TRANSLATE()` depending on whether you need substring replacement or character mapping.

---

# 🆚 Important Function Comparison

| Function      | Main Purpose                     |
| ------------- | -------------------------------- |
| `UPPER()`     | Convert to uppercase             |
| `LOWER()`     | Convert to lowercase             |
| `LEN()`       | Find string length               |
| `LEFT()`      | Extract from left                |
| `RIGHT()`     | Extract from right               |
| `SUBSTRING()` | Extract from a specific position |
| `CHARINDEX()` | Find position                    |
| `REPLICATE()` | Repeat characters                |
| `REPLACE()`   | Replace matching text            |
| `TRANSLATE()` | Character mapping                |
| `STUFF()`     | Replace by position              |

---

# 🧠 Interview Quick Revision

```text
UPPER()       → Uppercase
LOWER()       → Lowercase
LEN()         → String length
LEFT()        → Extract from left
RIGHT()       → Extract from right
SUBSTRING()   → Extract by position
CHARINDEX()   → Find position
REPLICATE()   → Repeat characters
REPLACE()     → Replace matching text
TRANSLATE()   → Character mapping
STUFF()       → Replace by position
```

### ⭐ Remember

**LEFT / RIGHT** → Extract from sides
**SUBSTRING** → Extract from a position
**CHARINDEX** → Find position
**REPLACE** → Replace matching text
**STUFF** → Replace using position + length
**REPLICATE** → Repeat characters

---

<div align="center">

### 🚀 Day 15 Interview Preparation Complete!

**Learn → Practice → Revise → Improve**

</div>
