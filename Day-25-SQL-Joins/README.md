<div align="center">

# 🗄️ Day 25 — SQL Server Types of Joins

### INNER JOIN • LEFT JOIN • RIGHT JOIN • FULL JOIN • CROSS JOIN

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts**  •  **🧠 Interview Preparation**  •  **📝 Revision Notes**  •  **💻 SQL Practice**

</div>

---

## 📌 Overview

Day 25 focuses on **JOIN operations** used in SQL Server to combine related data from multiple tables.

The session covers how SQL JOINs work with **common fields, Primary Keys, Foreign Keys, and related tables** to produce meaningful result sets.

The major JOIN types studied are:

* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* `FULL JOIN`
* `CROSS JOIN`
* `SELF JOIN`
* `EQUI JOIN`
* `NON-EQUI JOIN`

---

## 🎯 Learning Objectives

By the end of Day 25, the focus was on understanding:

* JOIN operations
* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN
* CROSS JOIN
* SELF JOIN
* EQUI JOIN
* NON-EQUI JOIN
* Primary Key and Foreign Key relationships
* JOIN conditions
* `ON` clause
* `WHERE` clause with JOINs
* Joining multiple tables
* Table aliases
* Result sets
* Real-world JOIN scenarios
* `N TABLES → N − 1 JOIN CONDITIONS`

---

# 🔗 SQL JOINs

A **JOIN** is used to combine rows from two or more tables based on a related column or condition.

JOINs are one of the most important concepts in **relational databases** because related information is usually stored across multiple tables.

### Basic JOIN Structure

```sql
SELECT columns
FROM table1
JOIN table2
    ON table1.column = table2.column;
```

---

# 1️⃣ INNER JOIN

`INNER JOIN` returns **only the matching records from both tables**.

### Example

```sql
SELECT e.ename,
       d.dname,
       d.loc
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Result Concept

```text
EMP              DEPT
 │                 │
 │   MATCHING      │
 └──── RECORDS ────┘
          │
          ▼
     RESULT SET
```

Only records satisfying the JOIN condition are returned.

---

# 2️⃣ LEFT JOIN

`LEFT JOIN` returns:

* All records from the **left table**
* Matching records from the **right table**
* `NULL` when no matching record exists

### Example

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
LEFT JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Key Point

```text
LEFT TABLE
   +
MATCHING RIGHT TABLE RECORDS
```

---

# 3️⃣ RIGHT JOIN

`RIGHT JOIN` returns:

* All records from the **right table**
* Matching records from the **left table**
* `NULL` when no matching record exists

### Example

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
RIGHT JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Key Point

```text
MATCHING LEFT TABLE RECORDS
   +
RIGHT TABLE
```

---

# 4️⃣ FULL JOIN

`FULL JOIN` returns:

* Matching records
* Non-matching records from the left table
* Non-matching records from the right table

### Example

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
FULL JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Key Point

```text
LEFT RECORDS
     +
MATCHING RECORDS
     +
RIGHT RECORDS
```

---

# 5️⃣ CROSS JOIN

`CROSS JOIN` returns **every possible combination of rows** from both tables.

It produces a **Cartesian Product**.

### Example

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
CROSS JOIN dept AS d;
```

If the first table contains `M` rows and the second table contains `N` rows:

```text
TOTAL RESULT ROWS = M × N
```

---

# 6️⃣ SELF JOIN

A **SELF JOIN** joins a table with itself.

It is commonly used for hierarchical relationships such as:

* Employee → Manager
* Employee → Supervisor

### Example

```sql
SELECT e.ename AS Employee,
       m.ename AS Manager
FROM emp AS e
LEFT JOIN emp AS m
    ON e.mgr = m.empno;
```

---

# 7️⃣ EQUI JOIN

An **EQUI JOIN** uses the equality operator `=` to match related columns.

### Example

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno;
```

### Key Point

```text
JOIN CONDITION
      =
COLUMN = COLUMN
```

---

# 8️⃣ NON-EQUI JOIN

A **NON-EQUI JOIN** uses operators other than `=`.

Common operators include:

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

---

# 🔗 Joining Multiple Tables

Multiple tables can be joined together using multiple JOIN conditions.

### Example

```sql
SELECT e.ename,
       d.dname,
       l.city,
       l.state,
       c.country_name AS country
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
 │ deptno
 ▼
DEPT
 │
 │ locid
 ▼
LOCATIONS
 │
 │ country_id
 ▼
COUNTRIES
```

For a connected JOIN involving **N tables**, typically:

```text
N TABLES → N − 1 JOIN CONDITIONS
```

---

# 🔑 JOIN Condition

The `ON` clause defines how the tables are related.

```sql
ON e.deptno = d.deptno
```

The columns used in a JOIN do not necessarily need to have the same name.

The important requirement is that the columns contain a meaningful relationship for the query.

---

# 🔍 JOIN vs WHERE

The `ON` clause defines the relationship between tables.

The `WHERE` clause filters the result.

### Example

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
INNER JOIN dept AS d
    ON e.deptno = d.deptno
WHERE e.sal > 3000;
```

### Query Flow

```text
TABLES
   ↓
JOIN
   ↓
MATCHING DATA
   ↓
WHERE FILTER
   ↓
RESULT SET
```

---

# 📊 JOIN Comparison

| JOIN Type       | Result                         |
| --------------- | ------------------------------ |
| `INNER JOIN`    | Matching records               |
| `LEFT JOIN`     | All left + matching right      |
| `RIGHT JOIN`    | All right + matching left      |
| `FULL JOIN`     | All records from both tables   |
| `CROSS JOIN`    | Cartesian combinations         |
| `SELF JOIN`     | Table joined with itself       |
| `EQUI JOIN`     | Matching using `=`             |
| `NON-EQUI JOIN` | Matching using other operators |

---

# 🧠 Key Takeaways

* `INNER JOIN` returns matching records.
* `LEFT JOIN` keeps all records from the left table.
* `RIGHT JOIN` keeps all records from the right table.
* `FULL JOIN` returns records from both sides.
* `CROSS JOIN` produces a Cartesian product.
* `SELF JOIN` joins a table with itself.
* `EQUI JOIN` uses the `=` operator.
* `NON-EQUI JOIN` uses comparison operators.
* `ON` defines the JOIN relationship.
* `WHERE` filters the joined result.
* Table aliases make complex JOIN queries easier to read.
* A PK-FK relationship is common but not mandatory for every JOIN.
* Multiple tables can be connected using multiple JOIN conditions.

---

# 🌍 Real-World Applications

JOINs are frequently used in real-world applications such as:

* 👨‍💼 Employees + Departments
* 🛒 Orders + Customers
* 💳 Customers + Accounts
* 📦 Products + Categories
* 🏢 Departments + Locations
* 🎓 Students + Courses

---

# 💡 Important Concept

> **Joins bring related data together to create meaningful results.**

Understanding JOINs is essential for:

* Database Development
* Backend Development
* ASP.NET Applications
* Web APIs
* Reporting Systems
* Business Applications
* Data Analysis

---

# 🎯 Technical Takeaway

```text
RELATIONSHIPS
      ↓
    JOIN
      ↓
 COMBINE DATA
      ↓
 FILTER RESULTS
      ↓
 RESULT SET
```

### ⭐ Remember

```text
N TABLES → N − 1 JOIN CONDITIONS
```

---

## 📁 Day 25 Files

```text
Day-25-SQL-Joins/
│
├── README.md
│
├── Quick-Notes.md
│
├── Interview-Questions.md
│
└── SQL-Queries.sql
```

---

<div align="center">

### 🚀 SQL Learning Journey

**Day 25 Completed — Types of Joins in SQL Server**

**Learn → Practice → Understand → Build**

<br>

**Subhash Yadav**
**.NET Full Stack Developer**
**Learning in Public**

</div>
