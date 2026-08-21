<div align="center">

# 📝 Day 25 — SQL Server JOINs Quick Notes

### INNER JOIN • LEFT JOIN • RIGHT JOIN • FULL JOIN • CROSS JOIN • SELF JOIN

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Quick Revision**  •  **💡 Key Concepts**  •  **💻 SQL Syntax**  •  **🎯 Interview Ready**

</div>

---

## 📌 What is a JOIN?

A **JOIN** is used to combine rows from two or more tables based on a related column or condition.

### Basic Syntax

```sql
SELECT columns
FROM table1
JOIN table2
    ON table1.column = table2.column;
```

---

# 🔗 Types of JOINs

| JOIN            | Returns                                   |
| --------------- | ----------------------------------------- |
| `INNER JOIN`    | Matching records from both tables         |
| `LEFT JOIN`     | All left records + matching right records |
| `RIGHT JOIN`    | All right records + matching left records |
| `FULL JOIN`     | All records from both tables              |
| `CROSS JOIN`    | Every possible row combination            |
| `SELF JOIN`     | A table joined with itself                |
| `EQUI JOIN`     | JOIN using `=`                            |
| `NON-EQUI JOIN` | JOIN using comparison operators           |

---

# 1️⃣ INNER JOIN

Returns only records that have a match in both tables.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Remember

```text
INNER JOIN
→ Matching Records Only
```

---

# 2️⃣ LEFT JOIN

Returns **all records from the left table** and matching records from the right table.

If there is no match, right-side columns contain `NULL`.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
LEFT JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Remember

```text
LEFT JOIN
→ All Left + Matching Right
```

---

# 3️⃣ RIGHT JOIN

Returns **all records from the right table** and matching records from the left table.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
RIGHT JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Remember

```text
RIGHT JOIN
→ All Right + Matching Left
```

---

# 4️⃣ FULL JOIN

Returns matching and non-matching records from both tables.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
FULL JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Remember

```text
FULL JOIN
→ All Left + All Right
```

---

# 5️⃣ CROSS JOIN

Returns every possible combination of rows from two tables.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
CROSS JOIN dept AS d;
```

### Formula

```text
Rows in A × Rows in B = Result Rows
```

Example:

```text
5 × 4 = 20 rows
```

### Remember

```text
CROSS JOIN
→ Cartesian Product
```

---

# 6️⃣ SELF JOIN

A table is joined with itself.

Commonly used for hierarchical data such as:

```text
Employee → Manager
Employee → Supervisor
```

### Example

```sql
SELECT e.ename AS Employee,
       m.ename AS Manager
FROM emp AS e
LEFT JOIN emp AS m
    ON e.mgr = m.empno;
```

### Remember

```text
SELF JOIN
→ Same Table + Different Aliases
```

---

# 7️⃣ EQUI JOIN

An EQUI JOIN uses the equality operator `=`.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Remember

```text
EQUI JOIN
→ Uses =
```

---

# 8️⃣ NON-EQUI JOIN

A NON-EQUI JOIN uses operators other than `=`.

Common operators:

```text
<
>
<=
>=
<>
BETWEEN
```

### Example

```sql
SELECT e.ename,
       e.sal,
       s.grade
FROM emp AS e
INNER JOIN salgrade AS s
    ON e.sal BETWEEN s.losal AND s.hisal;
```

### Remember

```text
NON-EQUI JOIN
→ Uses comparison operators
```

---

# 🔑 ON Clause

The `ON` clause defines the relationship between the tables.

```sql
ON e.deptno = d.deptno
```

### Remember

```text
ON
→ Defines JOIN Condition
```

---

# 🔍 ON vs WHERE

### ON

Used to define how tables are joined.

### WHERE

Used to filter the resulting records.

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno
WHERE e.sal > 3000;
```

### Quick Rule

```text
ON
→ JOIN

WHERE
→ FILTER
```

---

# 🔗 Multiple Table JOIN

Multiple tables can be joined in one query.

Example:

```sql
SELECT e.ename,
       d.dname,
       l.city,
       l.state,
       c.country_name
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno
INNER JOIN locations AS l
    ON d.locid = l.locid
INNER JOIN countries AS c
    ON l.country_id = c.country_id;
```

### Relationship

```text
EMP
 │
 ▼
DEPT
 │
 ▼
LOCATIONS
 │
 ▼
COUNTRIES
```

---

# 🔢 N Tables → N − 1 JOIN Conditions

For a simple connected JOIN structure:

```text
2 Tables → 1 JOIN Condition
3 Tables → 2 JOIN Conditions
4 Tables → 3 JOIN Conditions
5 Tables → 4 JOIN Conditions
```

### Formula

```text
N TABLES → N − 1 JOIN CONDITIONS
```

---

# 🗝️ PK-FK and JOINs

JOINs commonly use relationships between:

```text
Primary Key
      ↓
Foreign Key
```

Example:

```text
DEPT
deptno (PK)
    ↑
    │
    │
EMP
deptno (FK)
```

A formal PK-FK constraint is **not mandatory** for every JOIN.

---

# 📊 JOIN Quick Comparison

| JOIN Type       | Quick Meaning        |
| --------------- | -------------------- |
| `INNER JOIN`    | Matching only        |
| `LEFT JOIN`     | All left + match     |
| `RIGHT JOIN`    | All right + match    |
| `FULL JOIN`     | Everything from both |
| `CROSS JOIN`    | Every combination    |
| `SELF JOIN`     | Same table           |
| `EQUI JOIN`     | Uses `=`             |
| `NON-EQUI JOIN` | Uses other operators |

---

# 🧠 Must Remember

```text
INNER JOIN
→ Matching Records

LEFT JOIN
→ All Left Records

RIGHT JOIN
→ All Right Records

FULL JOIN
→ All Records From Both

CROSS JOIN
→ Cartesian Product

SELF JOIN
→ Table Joined With Itself

EQUI JOIN
→ Equality Operator (=)

NON-EQUI JOIN
→ Comparison Operators

ON
→ JOIN Condition

WHERE
→ Filter

N TABLES
→ N − 1 JOIN CONDITIONS
```

---

# 💻 Common JOIN Query

```sql
SELECT e.ename,
       d.dname,
       d.loc
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Query Flow

```text
TABLE A
   +
TABLE B
   ↓
  JOIN
   ↓
MATCH RELATED DATA
   ↓
RESULT SET
```

---

# 🎯 Interview One-Liners

**INNER JOIN:** Matching records from both tables.

**LEFT JOIN:** All left records plus matching right records.

**RIGHT JOIN:** All right records plus matching left records.

**FULL JOIN:** Matching and non-matching records from both tables.

**CROSS JOIN:** Cartesian product of two tables.

**SELF JOIN:** A table joined with itself.

**EQUI JOIN:** JOIN based on `=`.

**NON-EQUI JOIN:** JOIN based on comparison operators.

**ON:** Defines the JOIN condition.

**WHERE:** Filters the result.

**PK-FK:** Common relationship used for connecting relational tables.

**N Tables:** Generally require `N − 1` JOIN conditions for a connected JOIN structure.

---

<div align="center">

### 🚀 SQL Learning Journey

**Day 25 — Types of Joins**

**Learn → Practice → Revise → Build**

<br>

**Subhash Yadav**
**.NET Full Stack Developer**
**Learning in Public**

</div>
