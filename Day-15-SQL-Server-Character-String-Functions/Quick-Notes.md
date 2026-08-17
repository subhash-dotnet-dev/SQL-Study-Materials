# 📝 Day 15 — SQL Server Character / String Functions

## 📌 Overview

SQL Server provides several **Character / String Functions** to convert, extract, search, repeat, replace, and transform string data.

---

# 🔤 1. UPPER()

### Definition

Converts a string to **uppercase**.

### Syntax

```sql
UPPER(string / column)
```

### Example

```sql
SELECT UPPER('subhash');
```

**Output:** `SUBHASH`

### Important Point

Useful for standardizing text into uppercase.

---

# 🔡 2. LOWER()

### Definition

Converts a string to **lowercase**.

### Syntax

```sql
LOWER(string / column)
```

### Example

```sql
SELECT LOWER('SUBHASH');
```

**Output:** `subhash`

### Practical Use

```sql
SELECT EMPNO, LOWER(ENAME) AS ENAME, SAL
FROM EMP;
```

---

# 📏 3. LEN()

### Definition

Returns the number of characters in a string.

### Syntax

```sql
LEN(string / column)
```

### Example

```sql
SELECT LEN('Subhash');
```

**Output:** `7`

### Practical Use

```sql
SELECT *
FROM EMP
WHERE LEN(ENAME) = 4;
```

### Important Point

`LEN()` does **not count trailing spaces**.

---

# ⬅️ 4. LEFT()

### Definition

Returns a specified number of characters from the **left side**.

### Syntax

```sql
LEFT(string, length)
```

### Example

```sql
SELECT LEFT('Subhash Yadav', 7);
```

**Output:** `Subhash`

### Practical Use

Find names starting with `S`:

```sql
SELECT *
FROM EMP
WHERE LEFT(ENAME, 1) = 'S';
```

---

# ➡️ 5. RIGHT()

### Definition

Returns a specified number of characters from the **right side**.

### Syntax

```sql
RIGHT(string, length)
```

### Example

```sql
SELECT RIGHT('Subhash Yadav', 5);
```

**Output:** `Yadav`

### Practical Use

Find names ending with `S`:

```sql
SELECT *
FROM EMP
WHERE RIGHT(ENAME, 1) = 'S';
```

---

# ✂️ 6. SUBSTRING()

### Definition

Returns characters starting from a specified position.

### Syntax

```sql
SUBSTRING(string, start, length)
```

### Example

```sql
SELECT SUBSTRING('Subhash Yadav', 1, 7);
```

**Output:** `Subhash`

### Important Point

`SUBSTRING()` allows extraction from a **specific position**, unlike `LEFT()` and `RIGHT()`.

---

# 🔎 7. CHARINDEX()

### Definition

Returns the starting position of a character or substring.

### Syntax

```sql
CHARINDEX(search_expression, string_expression [, start_location])
```

### Example

```sql
SELECT CHARINDEX(' ', 'Subhash Yadav');
```

**Output:** `8`

### Important Point

The optional third parameter specifies where the search should begin.

### Practical Use

`CHARINDEX()` can be combined with `SUBSTRING()` to separate first and last names.

---

# 🔁 8. REPLICATE()

### Definition

Repeats a string or character a specified number of times.

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

### Practical Use

Mask sensitive information:

```sql
SELECT REPLICATE('X', 4) + RIGHT(ACCNO, 4)
FROM ACCOUNTS;
```

Example:

```text
XXXX9567
```

---

# 🔄 9. REPLACE()

### Definition

Replaces all occurrences of a specified substring with another substring.

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

### Practical Use

* Text cleaning
* Correcting values
* Standardizing text
* Replacing unwanted strings

---

# 🔤 10. TRANSLATE()

### Definition

Maps individual characters from one character set to another.

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

### Mapping

```text
A → 1
B → 2
C → 3
D → 4
```

### Important Point

`TRANSLATE()` is useful for **character-to-character transformation**.

---

# ✂️ 11. STUFF()

### Definition

Deletes a specified number of characters and inserts another string at a specified position.

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

### Practical Use

Useful for replacing or masking a specific portion of data.

---

# 🔗 String Concatenation

The `+` operator can be used to combine strings.

### Example

```sql
SELECT 'Subhash' + ' ' + 'Yadav';
```

**Output:**

```text
Subhash Yadav
```

### Practical Example

Generate an employee email ID:

```sql
SELECT LEFT(ENAME, 3)
       + LEFT(CAST(EMPNO AS VARCHAR(10)), 3)
       + '@tcs.com' AS EMAILID
FROM EMP;
```

---

# 👤 First Name & Last Name Extraction

For:

```text
SACHIN TENDULKAR
```

Use `CHARINDEX()` with `SUBSTRING()`.

### First Name

```sql
SUBSTRING(
    CNAME,
    1,
    CHARINDEX(' ', CNAME) - 1
)
```

### Last Name

```sql
SUBSTRING(
    CNAME,
    CHARINDEX(' ', CNAME) + 1,
    LEN(CNAME)
)
```

---

# 🔐 Data Masking

### Account Number

```sql
SELECT REPLICATE('X', 4) + RIGHT(ACCNO, 4)
FROM ACCOUNTS;
```

```text
123456789567 → XXXX9567
```

### Card Number

```sql
SELECT LEFT(CREDIT_CARD_NO, 2)
       + REPLICATE('X', 3)
       + RIGHT(CREDIT_CARD_NO, 3)
FROM CUSTOMER;
```

---

# 🆚 Important Comparisons

## LEFT() vs RIGHT()

```text
LEFT()  → Extracts from beginning
RIGHT() → Extracts from end
```

## LEFT() vs SUBSTRING()

```text
LEFT()      → Starts from the beginning
SUBSTRING() → Starts from a specified position
```

## REPLACE() vs TRANSLATE()

```text
REPLACE()   → Replaces matching text
TRANSLATE() → Maps individual characters
```

## REPLACE() vs STUFF()

```text
REPLACE() → Replaces matching text
STUFF()   → Replaces using position and length
```

---

# 💡 Quick Memory

```text
UPPER()       → Uppercase
LOWER()       → Lowercase
LEN()         → String Length
LEFT()        → Extract Left
RIGHT()       → Extract Right
SUBSTRING()   → Extract by Position
CHARINDEX()   → Find Position
REPLICATE()   → Repeat
REPLACE()     → Replace Text
TRANSLATE()   → Transform Characters
STUFF()       → Replace by Position
```

---

# 🎯 Practical Uses

| Function      | Practical Use              |
| ------------- | -------------------------- |
| `UPPER()`     | Standardize uppercase text |
| `LOWER()`     | Standardize lowercase text |
| `LEN()`       | Validate string length     |
| `LEFT()`      | Extract prefixes           |
| `RIGHT()`     | Extract suffixes           |
| `SUBSTRING()` | Extract specific portions  |
| `CHARINDEX()` | Find delimiters/positions  |
| `REPLICATE()` | Mask or repeat characters  |
| `REPLACE()`   | Clean and replace text     |
| `TRANSLATE()` | Character transformation   |
| `STUFF()`     | Position-based replacement |

---

# 🧠 Final Revision

```text
CASE
UPPER() / LOWER()
      ↓
LENGTH
LEN()
      ↓
EXTRACTION
LEFT() / RIGHT() / SUBSTRING()
      ↓
SEARCH
CHARINDEX()
      ↓
TRANSFORMATION
REPLACE() / TRANSLATE()
      ↓
REPETITION
REPLICATE()
      ↓
POSITION-BASED REPLACEMENT
STUFF()
```

---

## ✅ Day 15 Quick Revision Complete

**Character / String Functions**

**LEARN → PRACTICE → REVISE → IMPROVE**
