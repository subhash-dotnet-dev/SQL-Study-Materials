# SQL Server — Day 50 Interview Questions

## Topic: Normalization & Temporary Tables

---

## 1. What is Normalization?

**Answer:**

Normalization is the process of decomposing tables with redundancy into multiple well-structured tables to reduce data redundancy and improve data integrity.

---

## 2. Why is Normalization used?

**Answer:**

Normalization is used to:

1. Reduce data redundancy
2. Avoid duplicate data
3. Improve data integrity
4. Organize data into well-structured tables
5. Make database maintenance easier

---

## 3. What are the different Normal Forms?

**Answer:**

The commonly discussed Normal Forms are:

```text
1NF  → First Normal Form
2NF  → Second Normal Form
3NF  → Third Normal Form
BCNF → Boyce-Codd Normal Form
4NF  → Fourth Normal Form
5NF  → Fifth Normal Form
```

---

## 4. What is 1NF?

**Answer:**

A table is in **1NF (First Normal Form)** when:

* All attributes contain atomic values.
* There are no multi-valued attributes.
* Each column contains a single value.

### Memory Trick:

```text
1NF → ATOMIC VALUES
```

---

## 5. What is 2NF?

**Answer:**

A table is in **2NF (Second Normal Form)** when:

1. It is already in 1NF.
2. There are no partial dependencies.

### Memory Trick:

```text
2NF → 1NF + NO PARTIAL DEPENDENCY
```

---

## 6. What is Partial Dependency?

**Answer:**

Partial dependency occurs when a non-key attribute depends on only a part of a composite primary key instead of the complete primary key.

Example:

```text
Primary Key = (A, B)

A, B → C     Full Dependency

A → D        Partial Dependency
```

---

## 7. What is 3NF?

**Answer:**

A table is in **3NF (Third Normal Form)** when:

1. It is already in 2NF.
2. There are no transitive dependencies.

### Memory Trick:

```text
3NF → 2NF + NO TRANSITIVE DEPENDENCY
```

---

## 8. What is Transitive Dependency?

**Answer:**

Transitive dependency occurs when a non-key attribute depends on another non-key attribute instead of directly depending on the primary key.

Example:

```text
A → B
B → C

Therefore:
A → C
```

Here, the dependency of `C` on `A` through `B` is called transitive dependency.

---

## 9. What is a Temporary Table?

**Answer:**

A Temporary Table is a table used to store data temporarily, usually for intermediate results.

Example:

```sql
CREATE TABLE #TEMP
(
    empno INT,
    ename VARCHAR(10),
    sal MONEY
);
```

---

## 10. What is the scope of a Temporary Table?

**Answer:**

A local temporary table such as `#TEMP` exists for the current session and is automatically removed when the session ends.

```text
#TEMP → SESSION SCOPE
```

---

## 11. How do you insert data into a Temporary Table?

**Answer:**

```sql
INSERT INTO #TEMP
SELECT EMPNO, ENAME, SAL
FROM EMP;
```

---

## 12. How can you create a Temporary Table using SELECT INTO?

**Answer:**

```sql
SELECT
    EMPNO,
    ENAME,
    SAL,
    DENSE_RANK() OVER (ORDER BY SAL DESC) AS RNK
INTO #TEMP
FROM EMP;
```

`SELECT INTO` creates the temporary table and inserts the selected data into it.

---

## 13. How do you display data from a Temporary Table?

**Answer:**

```sql
SELECT *
FROM #TEMP;
```

---

## 14. How do you find the Top 5 employees using a Temporary Table?

**Answer:**

```sql
SELECT *
FROM #TEMP
WHERE RNK <= 5;
```

---

## 15. What is a CTE?

**Answer:**

CTE stands for **Common Table Expression**.

It is a temporary named result set that exists only for the query immediately following the CTE definition.

Example:

```sql
WITH EMP_CTE AS
(
    SELECT EMPNO, ENAME, SAL
    FROM EMP
)
SELECT *
FROM EMP_CTE;
```

---

## 16. What is the difference between CTE and Temporary Table?

**Answer:**

| CTE                                                          | Temporary Table                       |
| ------------------------------------------------------------ | ------------------------------------- |
| Scope is the following query                                 | Scope is the current session          |
| Cannot be referenced by a separate later query               | Can be referenced by multiple queries |
| Does not create a physical temporary table in the same sense | Creates a temporary table             |
| Useful for temporary query results                           | Useful for intermediate data storage  |

### Memory Trick:

```text
CTE       → QUERY SCOPE
#TEMP     → SESSION SCOPE
```

---

## 17. What are the different ways of storing data temporarily?

**Answer:**

The three methods studied are:

```text
1. CTE
2. Temporary Table
3. Cursor
```

Their purposes are different:

```text
CTE        → Temporary Query Result
#TEMP      → Temporary Data Storage
CURSOR     → Row-by-Row Processing
```

---

## 18. What is a Derived Attribute?

**Answer:**

A derived attribute is an attribute whose value can be calculated from other stored attributes.

For example:

```text
QTY × RATE = VALUE
```

If `VALUE` can always be calculated from `QTY` and `RATE`, it may not need to be permanently stored.

---

## 19. Why can derived attributes be removed after normalization?

**Answer:**

Derived attributes can be calculated from other attributes, so storing them permanently may introduce unnecessary redundancy and the possibility of inconsistent values.

Example:

```text
QTY × RATE = VALUE
```

Instead of storing `VALUE`, it can be calculated when required.

---

## 20. What is the main purpose of 1NF, 2NF and 3NF?

**Answer:**

```text
1NF
→ Remove Multi-Valued Attributes
→ Keep Values Atomic

2NF
→ Remove Partial Dependencies

3NF
→ Remove Transitive Dependencies
```

---

## 21. What is the Normalization flow?

**Answer:**

```text
UNSTRUCTURED / REDUNDANT TABLE
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

## 22. What is the difference between a Temporary Table and a Permanent Table?

**Answer:**

| Temporary Table                                     | Permanent Table                    |
| --------------------------------------------------- | ---------------------------------- |
| Used for temporary data                             | Used for permanent data            |
| Usually session-based                               | Exists until explicitly dropped    |
| Name commonly starts with `#` for local temp tables | Normal table name                  |
| Useful for intermediate results                     | Used for application/database data |

---

## 23. How do you remove a Temporary Table manually?

**Answer:**

```sql
DROP TABLE #TEMP;
```

---

## 24. Interview Scenario: When would you use a Temporary Table?

**Answer:**

A Temporary Table is useful when intermediate query results need to be stored and reused by multiple queries during the same session.

Example:

```text
Complex Query
     ↓
#TEMP
     ↓
Multiple Queries
     ↓
Final Result
```

---

## 25. Quick Interview Memory

```text
NORMALIZATION
→ Reduces Data Redundancy

1NF
→ Atomic Values

2NF
→ No Partial Dependency

3NF
→ No Transitive Dependency

CTE
→ Query Scope

#TEMP
→ Session Scope

CURSOR
→ Row-by-Row Processing

DERIVED ATTRIBUTE
→ Calculated Value
```

---

## 🎯 Final SQL Interview Revision

```text
1NF → ATOMIC
2NF → NO PARTIAL DEPENDENCY
3NF → NO TRANSITIVE DEPENDENCY

CTE → QUERY LEVEL
TEMP TABLE → SESSION LEVEL
CURSOR → ROW LEVEL

NORMALIZATION → REDUCE REDUNDANCY
TEMP TABLE → STORE INTERMEDIATE RESULTS
```

---

# 🏆 SQL LEARNING JOURNEY — DAY 50 COMPLETE!

**LEARN → PRACTICE → DOCUMENT → REVISE → IMPROVE → BUILD 🚀**
