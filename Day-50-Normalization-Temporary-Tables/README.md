<div align="center">

# 🗄️ Day 50 — SQL Server: Normalization & Temporary Tables

### NORMALIZATION • 1NF • 2NF • 3NF • TEMPORARY TABLES • CTE

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts**  •  **🧠 Interview Preparation**  •  **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 50 focuses on **Normalization** and **Temporary Tables** in SQL Server.

This is the **final day of my SQL Server Learning Journey**.

The major concepts covered are:

* Normalization
* 1NF
* 2NF
* 3NF
* Partial Dependency
* Transitive Dependency
* Derived Attributes
* Temporary Tables
* `SELECT INTO`
* CTE
* CTE vs Temporary Tables
* Temporary Data Storage

---

## 🎯 Learning Objectives

By the end of Day 50, I focused on understanding:

* What is Normalization?
* Why Normalization is required?
* What are Normal Forms?
* What is 1NF?
* What is 2NF?
* What is 3NF?
* What is Partial Dependency?
* What is Transitive Dependency?
* What are Derived Attributes?
* What are Temporary Tables?
* How to create a Temporary Table?
* How to insert data into a Temporary Table?
* How to use `SELECT INTO`?
* What is the scope of a Temporary Table?
* What is a CTE?
* Difference between CTE and Temporary Table

---

# 🧩 Normalization

**Normalization** is the process of decomposing tables with redundancy into multiple well-structured tables.

### Main Objectives

```text
REDUNDANCY ↓
DUPLICATION ↓
DATA INTEGRITY ↑
STRUCTURE ↑
```

Normalization helps organize data and reduce unnecessary duplication.

---

# 🔹 Normal Forms

SQL database normalization commonly includes:

```text
1NF
2NF
3NF
BCNF
4NF
5NF
```

This day focuses mainly on **1NF, 2NF and 3NF**.

---

# 1️⃣ 1NF — First Normal Form

A table is in **1NF** when:

* All attributes contain atomic values.
* There are no multi-valued attributes.
* Each field contains a single value.

### Memory Trick

```text
1NF → ATOMIC VALUES
```

### Example

```text
❌ Not 1NF

PHONE
9876, 8765

✅ 1NF

PHONE
9876
8765
```

---

# 2️⃣ 2NF — Second Normal Form

A table is in **2NF** when:

1. It is already in 1NF.
2. There are no partial dependencies.

### Partial Dependency

Partial dependency occurs when a non-key attribute depends on only a part of a composite primary key.

```text
Primary Key = (A, B)

A,B → C
Full Dependency

A → D
Partial Dependency
```

### Memory Trick

```text
2NF → 1NF + NO PARTIAL DEPENDENCY
```

---

# 3️⃣ 3NF — Third Normal Form

A table is in **3NF** when:

1. It is already in 2NF.
2. There are no transitive dependencies.

### Transitive Dependency

```text
A → B
B → C

Therefore:

A → C
```

A non-key attribute should not depend on another non-key attribute.

### Memory Trick

```text
3NF → 2NF + NO TRANSITIVE DEPENDENCY
```

---

# 🔄 Normalization Flow

```text
REDUNDANT TABLE
      ↓
     1NF
      ↓
REMOVE PARTIAL DEPENDENCY
      ↓
     2NF
      ↓
REMOVE TRANSITIVE DEPENDENCY
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

If `VALUE` can be calculated when required, storing it permanently may create unnecessary redundancy.

### Memory

```text
DERIVED ATTRIBUTE
       ↓
CALCULATED VALUE
```

---

# 🗃️ Temporary Tables

Temporary Tables are used to store data temporarily, especially intermediate results.

### Local Temporary Table

A local temporary table is created using `#`.

```sql
CREATE TABLE #TEMP
(
    empno INT,
    ename VARCHAR(10),
    sal MONEY,
    rnk INT
);
```

### Scope

```text
#TEMP
  ↓
CURRENT SESSION
  ↓
SESSION ENDS
  ↓
TEMP TABLE REMOVED
```

---

# 🔹 Insert Data into Temporary Table

```sql
INSERT INTO #TEMP
SELECT
    EMPNO,
    ENAME,
    SAL,
    DENSE_RANK() OVER (ORDER BY SAL DESC) AS RNK
FROM EMP;
```

Display data:

```sql
SELECT *
FROM #TEMP;
```

---

# 🔹 SELECT INTO

A Temporary Table can also be created using `SELECT INTO`.

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
#TEMP CREATED
   ↓
DATA INSERTED
```

---

# 🔹 Top 5 Employees

After creating the Temporary Table:

```sql
SELECT *
FROM #TEMP
WHERE RNK <= 5;
```

---

# 🔹 CTE

CTE stands for **Common Table Expression**.

A CTE provides a temporary named result set that can be referenced by the query immediately following its definition.

Example:

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

# ⚖️ CTE vs Temporary Table

| CTE                                                      | Temporary Table                                  |
| -------------------------------------------------------- | ------------------------------------------------ |
| Query scope                                              | Session scope                                    |
| Used by the following query                              | Can be reused by multiple queries in the session |
| Useful for temporary query results                       | Useful for intermediate data storage             |
| Does not create a temporary table object in the same way | Creates a temporary table                        |

### Quick Memory

```text
CTE
→ QUERY SCOPE

#TEMP
→ SESSION SCOPE
```

---

# 🔹 Temporary Data Storage Methods

The methods studied for temporary/intermediate data handling are:

```text
1. CTE
   → Query Scope

2. Temporary Table
   → Session Scope

3. Cursor
   → Row-by-Row Processing
```

---

# 🧠 Quick Revision

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

# 📚 Important SQL Commands

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

# 📂 Day 50 Files

```text
Day-50-Normalization-Temporary-Tables/
│
├── README.md
├── Quick-Notes.md
├── Interview-Questions.md
└── SQL-Queries.sql
```

---

# 🏆 SQL Learning Journey — Final Day

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
🏆 SQL SERVER COMPLETE
```

---

## 🎯 Final Takeaway

Day 50 completes my **SQL Server Learning Journey** with a strong focus on database design concepts such as Normalization and practical techniques such as Temporary Tables and CTEs.

The journey covered SQL from fundamentals to advanced SQL Server concepts and strengthened my foundation for **.NET Full Stack Development and technical interviews**.

---

<div align="center">

# 🏆 SQL SERVER LEARNING JOURNEY COMPLETE!

### 50 DAYS • SQL SERVER • COMPLETED ✅

**LEARN → PRACTICE → DOCUMENT → REVISE → IMPROVE → BUILD 🚀**

**SUBHASH YADAV**

**.NET FULL STACK DEVELOPER**

**LEARNING IN PUBLIC**

</div>
