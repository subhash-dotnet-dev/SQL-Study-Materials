# SQL Server — Day 50 Quick Notes

## 📌 Topic: Normalization & Temporary Tables

---

# 🔹 Normalization

**Normalization** is the process of decomposing tables with redundancy into multiple well-structured tables.

### Main Goals

* Reduce data redundancy
* Avoid duplicate data
* Improve data integrity
* Organize data properly

### Normal Forms

```text
1NF  → First Normal Form
2NF  → Second Normal Form
3NF  → Third Normal Form
BCNF → Boyce-Codd Normal Form
4NF  → Fourth Normal Form
5NF  → Fifth Normal Form
```

---

# 🔹 1NF — First Normal Form

A table is in **1NF** when:

* All attributes contain atomic values.
* No multi-valued attributes exist.
* Each field contains a single value.

```text
1NF → ATOMIC VALUES
```

### Example

```text
❌ Not 1NF

Phone
----------------
9876, 8765

✅ 1NF

Phone
----------------
9876
8765
```

---

# 🔹 2NF — Second Normal Form

A table is in **2NF** when:

1. It is already in 1NF.
2. It has no partial dependency.

```text
2NF → 1NF + NO PARTIAL DEPENDENCY
```

### Partial Dependency

When a non-key attribute depends on only a part of a composite primary key.

```text
Primary Key = (A, B)

A,B → C    Full Dependency

A → D      Partial Dependency
```

---

# 🔹 3NF — Third Normal Form

A table is in **3NF** when:

1. It is already in 2NF.
2. It has no transitive dependency.

```text
3NF → 2NF + NO TRANSITIVE DEPENDENCY
```

### Transitive Dependency

```text
A → B
B → C

Therefore:
A → C
```

A non-key attribute should not depend on another non-key attribute.

---

# 🔹 Normalization Flow

```text
REDUNDANT TABLE
      ↓
     1NF
      ↓
Remove Partial Dependency
      ↓
     2NF
      ↓
Remove Transitive Dependency
      ↓
     3NF
      ↓
WELL-STRUCTURED TABLES
```

---

# 🔹 Derived Attributes

A **derived attribute** is a value that can be calculated from other attributes.

Example:

```text
QTY × RATE = VALUE
```

If `VALUE` can be calculated when required, it may not need to be permanently stored.

### Memory

```text
Derived Attribute
→ Calculated Value
→ Can reduce redundancy
```

---

# 🔹 Temporary Tables

Temporary tables are used to store data temporarily, especially intermediate results.

### Local Temporary Table

```sql
CREATE TABLE #TEMP
(
    empno INT,
    ename VARCHAR(10),
    sal MONEY,
    rnk INT
);
```

### Important Point

```text
#TEMP
→ Session Scope
→ Automatically removed when session ends
```

---

# 🔹 Insert Data into Temporary Table

```sql
INSERT INTO #TEMP
SELECT
    EMPNO,
    ENAME,
    SAL,
    DENSE_RANK() OVER (ORDER BY SAL DESC)
FROM EMP;
```

Display:

```sql
SELECT *
FROM #TEMP;
```

---

# 🔹 SELECT INTO

A temporary table can also be created using `SELECT INTO`.

```sql
SELECT
    EMPNO,
    ENAME,
    SAL,
    DENSE_RANK() OVER (ORDER BY SAL DESC) AS RNK
INTO #TEMP
FROM EMP;
```

### Flow

```text
SELECT
  ↓
SELECT INTO
  ↓
#TEMP Created
  ↓
Data Inserted
```

---

# 🔹 Top 5 Employees Using Temporary Table

```sql
SELECT *
FROM #TEMP
WHERE RNK <= 5;
```

---

# 🔹 CTE

CTE stands for **Common Table Expression**.

A CTE provides a temporary named result set for the query immediately following it.

```sql
WITH EMP_CTE AS
(
    SELECT
        EMPNO,
        ENAME,
        SAL,
        DENSE_RANK() OVER (ORDER BY SAL DESC) AS RNK
    FROM EMP
)
SELECT *
FROM EMP_CTE
WHERE RNK <= 5;
```

---

# 🔹 CTE vs Temporary Table

| CTE                                 | Temporary Table                                  |
| ----------------------------------- | ------------------------------------------------ |
| Query scope                         | Session scope                                    |
| Used by the following query         | Can be reused by multiple queries in the session |
| Useful for temporary query results  | Useful for intermediate data storage             |
| Does not persist as a session table | Stored as a temporary table                      |

### Quick Memory

```text
CTE   → QUERY SCOPE

#TEMP → SESSION SCOPE
```

---

# 🔹 Temporary Data Storage Methods

```text
1. CTE
   → Query Scope

2. Temporary Table
   → Session Scope

3. Cursor
   → Row-by-Row Processing
```

---

# 🧠 Interview Quick Memory

```text
1NF
→ ATOMIC VALUES

2NF
→ NO PARTIAL DEPENDENCY

3NF
→ NO TRANSITIVE DEPENDENCY

CTE
→ QUERY SCOPE

#TEMP
→ SESSION SCOPE

CURSOR
→ ROW-BY-ROW PROCESSING

NORMALIZATION
→ REDUCES REDUNDANCY

DERIVED ATTRIBUTE
→ CALCULATED VALUE
```

---

# 🎯 Most Important Commands

```sql
-- Create Temporary Table
CREATE TABLE #TEMP
(
    empno INT,
    ename VARCHAR(10),
    sal MONEY
);

-- Insert Data
INSERT INTO #TEMP
SELECT EMPNO, ENAME, SAL
FROM EMP;

-- Display Data
SELECT *
FROM #TEMP;

-- Drop Temporary Table
DROP TABLE #TEMP;
```

---

# 🏆 SQL LEARNING JOURNEY — FINAL DAY

```text
SQL BASICS
    ↓
QUERIES
    ↓
JOINS
    ↓
SUBQUERIES
    ↓
CTE
    ↓
TRANSACTIONS
    ↓
VIEWS
    ↓
INDEXES
    ↓
CURSORS
    ↓
FUNCTIONS
    ↓
PROCEDURES
    ↓
TRIGGERS
    ↓
DYNAMIC SQL
    ↓
BACKUP & RESTORE
    ↓
NORMALIZATION
    ↓
TEMPORARY TABLES
    ↓
🏆 SQL COMPLETE
```

## 🚀 Day 50 Complete!

**LEARN → PRACTICE → DOCUMENT → REVISE → IMPROVE → BUILD**
