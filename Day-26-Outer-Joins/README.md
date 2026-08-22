<div align="center">

# 🗄️ Day 26 — SQL Server OUTER JOINs

### LEFT JOIN • RIGHT JOIN • FULL JOIN • UNMATCHED RECORDS

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes** &nbsp;•&nbsp; **💻 Practical SQL**

</div>

---

## 📌 Overview

Day 26 focuses on **OUTER JOINs** in SQL Server.

An `INNER JOIN` returns only matching records from both tables. When we need to display **unmatched records** along with matching records, we use **OUTER JOINs**.

The three types of OUTER JOIN studied are:

- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL JOIN`

This session also covers how to identify **unmatched records using `IS NULL`** and practical JOIN scenarios using **EMP, DEPT, and PROJECTS** tables.

---

## 🎯 Learning Objectives

By the end of Day 26, the focus was on understanding:

- INNER JOIN vs OUTER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN
- Matching records
- Unmatched records
- `IS NULL`
- Finding unmatched records from the left table
- Finding unmatched records from the right table
- Finding unmatched records from both tables
- Employee and Department relationships
- Employee and Project relationships
- JOIN row-count scenarios

---

# 🔗 OUTER JOIN

An **OUTER JOIN** returns matching records along with unmatched records from one or both tables.

### Types of OUTER JOIN

| JOIN Type | Description |
|---|---|
| `LEFT JOIN` | All rows from left + matching rows from right |
| `RIGHT JOIN` | All rows from right + matching rows from left |
| `FULL JOIN` | All rows from both tables |

---

# 1️⃣ LEFT JOIN

A `LEFT JOIN` returns **all rows from the left-side table** and matching rows from the right-side table.

If there is no matching record in the right table, the right-side columns contain `NULL`.

### Syntax

```sql
SELECT e.ename,
       d.dname
FROM emp AS e
LEFT JOIN dept AS d
    ON e.deptno = d.deptno;
