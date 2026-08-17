<div align="center">

# 🗄️ Day 15 — SQL Server Character / String Functions

### UPPER(), LOWER(), LEN(), LEFT(), RIGHT(), SUBSTRING(), CHARINDEX(), REPLICATE(), REPLACE(), TRANSLATE() & STUFF()

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts**  •  **🧠 Interview Preparation**  •  **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 15 focuses on **SQL Server Character / String Functions** used to manipulate, search, extract, transform, format, and mask textual data.

The session covers `UPPER()`, `LOWER()`, `LEN()`, `LEFT()`, `RIGHT()`, `SUBSTRING()`, `CHARINDEX()`, `REPLICATE()`, `REPLACE()`, `TRANSLATE()`, and `STUFF()` with practical employee, customer, email-generation, and data-masking scenarios.

---

## 🎯 Learning Objectives

By the end of Day 15, the focus was on understanding:

* `UPPER()` for converting text to uppercase
* `LOWER()` for converting text to lowercase
* `LEN()` for finding string length
* `LEFT()` for extracting characters from the left
* `RIGHT()` for extracting characters from the right
* `SUBSTRING()` for extracting characters from a specific position
* `CHARINDEX()` for finding the position of a character or string
* `REPLICATE()` for repeating characters
* `REPLACE()` for replacing matching text
* `TRANSLATE()` for character-to-character translation
* `STUFF()` for replacing text based on position and length
* String concatenation using `+`
* Employee name formatting
* Employee email ID generation
* First name and last name extraction
* Account and card number masking
* Practical text transformation scenarios

---

## 📚 Concepts Covered

|  # | Function      | Purpose                                      |
| -: | ------------- | -------------------------------------------- |
| 01 | `UPPER()`     | Convert text to uppercase                    |
| 02 | `LOWER()`     | Convert text to lowercase                    |
| 03 | `LEN()`       | Return the number of characters              |
| 04 | `LEFT()`      | Extract characters from the left             |
| 05 | `RIGHT()`     | Extract characters from the right            |
| 06 | `SUBSTRING()` | Extract characters from a specific position  |
| 07 | `CHARINDEX()` | Find the position of a character/string      |
| 08 | `REPLICATE()` | Repeat a character/string                    |
| 09 | `REPLACE()`   | Replace matching text                        |
| 10 | `TRANSLATE()` | Translate characters                         |
| 11 | `STUFF()`     | Replace characters using position and length |

---

# 🔤 UPPER()

`UPPER()` converts a string or column value into **uppercase**.

### Syntax

```sql
UPPER(string / column)
```

### Example

```sql
SELECT UPPER('subhash');
```

**Output:**

```text
SUBHASH
```

### Practical Example

```sql
SELECT EMPNO, UPPER(ENAME) AS ENAME, SAL
FROM EMP;
```

---

# 🔡 LOWER()

`LOWER()` converts a string or column value into **lowercase**.

### Syntax

```sql
LOWER(string / column)
```

### Example

```sql
SELECT LOWER('SUBHASH');
```

**Output:**

```text
subhash
```

### Practical Example

```sql
SELECT EMPNO, LOWER(ENAME) AS ENAME, SAL
FROM EMP;
```

---

# 📏 LEN()

`LEN()` returns the number of characters in a string.

### Syntax

```sql
LEN(string / column)
```

### Examples

```sql
SELECT LEN('Subhash');
SELECT LEN('Subhash Yadav');
```

**Output:**

```text
7
12
```

> **Note:** In SQL Server, `LEN()` does not count trailing spaces.

### Practical Example

```sql
SELECT *
FROM EMP
WHERE LEN(ENAME) = 4;
```

---

# ⬅️ LEFT()

`LEFT()` returns a specified number of characters from the **left side** of a string.

### Syntax

```sql
LEFT(string, length)
```

### Example

```sql
SELECT LEFT('Subhash Yadav', 7);
```

**Output:**

```text
Subhash
```

### Practical Example

Find employees whose names start with `S`:

```sql
SELECT *
FROM EMP
WHERE LEFT(ENAME, 1) = 'S';
```

---

# ➡️ RIGHT()

`RIGHT()` returns a specified number of characters from the **right side** of a string.

### Syntax

```sql
RIGHT(string, length)
```

### Example

```sql
SELECT RIGHT('Subhash Yadav', 5);
```

**Output:**

```text
Yadav
```

### Practical Example

Find employees whose names end with `S`:

```sql
SELECT *
FROM EMP
WHERE RIGHT(ENAME, 1) = 'S';
```

---

# ✂️ SUBSTRING()

`SUBSTRING()` extracts a specified number of characters starting from a particular position.

### Syntax

```sql
SUBSTRING(string, start, length)
```

### Examples

```sql
SELECT SUBSTRING('Subhash Yadav', 1, 7);
```

**Output:**

```text
Subhash
```

```sql
SELECT SUBSTRING('Subhash Yadav', 9, 5);
```

**Output:**

```text
Yadav
```

---

# 🔎 CHARINDEX()

`CHARINDEX()` returns the starting position of a specified character or substring.

### Syntax

```sql
CHARINDEX(search_expression, string_expression [, start_location])
```

### Examples

```sql
SELECT CHARINDEX(' ', 'Subhash Yadav');
```

**Output:**

```text
8
```

The optional `start_location` can be used to begin searching from a specific position.

```sql
SELECT CHARINDEX('a', 'Subhash Yadav', 5);
```

### Practical Example

For a customer name such as:

```text
SACHIN TENDULKAR
```

`CHARINDEX()` can be combined with `SUBSTRING()` to separate the first name and last name.

---

# 🔁 REPLICATE()

`REPLICATE()` repeats a character or string a specified number of times.

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

### Practical Example

Display a masked salary representation:

```sql
SELECT ENAME,
       REPLICATE('*', LEN(SAL)) AS SAL
FROM EMP;
```

---

# 🔄 REPLACE()

`REPLACE()` replaces all occurrences of a specified substring with another substring.

### Syntax

```sql
REPLACE(string_expression, string_pattern, string_replacement)
```

### Example

```sql
SELECT REPLACE('SQL Server', 'Server', 'Database');
```

**Output:**

```text
SQL Database
```

### Practical Use

Useful for cleaning or standardizing text stored in database columns.

---

# 🔤 TRANSLATE()

`TRANSLATE()` replaces individual characters based on corresponding character positions.

### Syntax

```sql
TRANSLATE(inputString, characters, translations)
```

### Example

```sql
SELECT TRANSLATE('ABCD', 'ABCD', '1234');
```

**Output:**

```text
1234
```

### Practical Use

`TRANSLATE()` can be useful for character transformation and certain text-cleaning or data-mapping scenarios.

---

# ✂️ STUFF()

`STUFF()` deletes a specified number of characters and inserts another string at the specified position.

### Syntax

```sql
STUFF(character_expression, start, length, replaceWith)
```

### Example

```sql
SELECT STUFF('9431737280', 4, 4, 'XXXX');
```

**Output:**

```text
943XXXX280
```

### Practical Use

Useful for replacing or masking a specific portion of sensitive data.

---

# 📧 Practical Scenario — Employee Email ID Generation

Employee information can be transformed into an email ID using string functions and concatenation.

Example:

```sql
SELECT EMPNO,
       ENAME,
       LEFT(ENAME, 3) + LEFT(CAST(EMPNO AS VARCHAR(10)), 3) + '@tcs.com' AS EMAILID
FROM EMP;
```

Example format:

```text
SMITH + 736 → SMI736@tcs.com
```

---

# 👤 Practical Scenario — First Name & Last Name

For a customer table:

```text
CID | CNAME
----|------------------
10  | SACHIN TENDULKAR
11  | VIRAT KOHLI
```

First and last names can be extracted using `SUBSTRING()`, `CHARINDEX()`, and `LEN()`.

```sql
SELECT CID,
       SUBSTRING(CNAME, 1, CHARINDEX(' ', CNAME) - 1) AS FNAME,
       SUBSTRING(CNAME, CHARINDEX(' ', CNAME) + 1, LEN(CNAME)) AS LNAME
FROM CUST;
```

---

# 🔐 Practical Scenario — Data Masking

Sensitive account numbers can be partially hidden using `REPLICATE()` and `RIGHT()`.

```sql
SELECT REPLICATE('X', 4) + RIGHT(ACCNO, 4) AS MASKED_ACCOUNT
FROM ACCOUNTS;
```

Example:

```text
Original: 123456789567
Masked:   XXXX9567
```

Another example for a card number:

```sql
SELECT LEFT(CREDIT_CARD_NO, 2)
       + REPLICATE('X', 3)
       + RIGHT(CREDIT_CARD_NO, 3)
FROM CUSTOMER;
```

---

# 🔗 String Concatenation

The `+` operator can be used to combine string values in SQL Server.

### Example

```sql
SELECT 'Subhash' + ' ' + 'Yadav' AS FULL_NAME;
```

**Output:**

```text
Subhash Yadav
```

It can also be combined with string functions:

```sql
SELECT LEFT(ENAME, 3)
       + LEFT(CAST(EMPNO AS VARCHAR(10)), 3)
       + '@tcs.com' AS EMAILID
FROM EMP;
```

---

# 💡 Quick Memory

| Function      | Remember              |
| ------------- | --------------------- |
| `UPPER()`     | Uppercase             |
| `LOWER()`     | Lowercase             |
| `LEN()`       | String length         |
| `LEFT()`      | Extract from left     |
| `RIGHT()`     | Extract from right    |
| `SUBSTRING()` | Extract by position   |
| `CHARINDEX()` | Find position         |
| `REPLICATE()` | Repeat characters     |
| `REPLACE()`   | Replace matching text |
| `TRANSLATE()` | Character mapping     |
| `STUFF()`     | Replace by position   |

---

# 🧠 Key Takeaway

SQL Server Character / String Functions are essential for working with textual data.

They help developers:

* Format names and text
* Convert character case
* Measure string length
* Extract specific portions of text
* Search within strings
* Generate formatted values
* Clean and transform text
* Create email IDs
* Mask sensitive information

Understanding these functions is important for **SQL development, data processing, backend development, and real-world application development**.

---

# 📈 Learning Progress

**SQL Learning Journey**

```text
Day 15
  ↓
Character / String Functions
  ↓
Learn → Practice → Document → Improve
```

### Current Day

**✅ Day 15 — SQL Server Character / String Functions**

---

# 🏁 Day Completion

<div align="center">

## 🎉 DAY 15 COMPLETE! 🚀

### LEARN → PRACTICE → DOCUMENT → IMPROVE

**Subhash Yadav**
**.NET Full Stack Developer | Backend Development / SQL**

</div>
