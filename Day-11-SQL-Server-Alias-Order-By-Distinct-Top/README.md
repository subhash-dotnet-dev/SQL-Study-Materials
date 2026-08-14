<div align="center">

# 🗄️ Day 11 — SQL Server ALIAS, ORDER BY, DISTINCT & TOP

### Understanding Column Aliases, Sorting, Duplicate Removal & Top Records in SQL Server

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts**  •  **🧠 Interview Preparation**  •  **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 11 focuses on understanding **ALIAS**, sorting data using the `ORDER BY` clause, eliminating duplicate values using `DISTINCT`, and retrieving a specific number of records using the `TOP` clause in SQL Server.

The session also covers **ascending and descending sorting**, multiple-column sorting, using column numbers with `ORDER BY`, and practical queries for retrieving highest salaries and experienced employees.

---

## 🎯 Learning Objectives

By the end of Day 11, the focus was on understanding:

* ALIAS
* Column and Expression Aliases
* ORDER BY Clause
* ASC and DESC
* Multiple Column Sorting
* ORDER BY with Column Numbers
* DISTINCT Clause
* TOP Clause
* TOP with ORDER BY
* DISTINCT with TOP
* Practical SQL Filtering and Sorting

---

## 📚 Concepts Covered

|  # | Concept          | Examples                 |
| -: | ---------------- | ------------------------ |
| 01 | ALIAS            | `AS`, Column Heading     |
| 02 | ORDER BY         | Sort Table Data          |
| 03 | ASC              | Ascending Order          |
| 04 | DESC             | Descending Order         |
| 05 | Multiple Sorting | `DEPTNO ASC, SAL DESC`   |
| 06 | Column Number    | `ORDER BY 3 DESC`        |
| 07 | DISTINCT         | Eliminate Duplicates     |
| 08 | TOP              | Select Top N Rows        |
| 09 | TOP + ORDER BY   | Highest / Lowest Records |
| 10 | DISTINCT + TOP   | Top Unique Values        |

---

## 🧠 Key Takeaways

### ALIAS

An **ALIAS** means another name or alternative name given to a column or expression.

It is mainly used to change column headings and make query output more meaningful and readable.

```sql
SELECT ENAME, SAL * 12 AS ANNSAL
FROM EMP;
```

We can also use an alias for a custom column heading:

```sql
SELECT ENAME, SAL * 12 AS [ANNUAL SAL]
FROM EMP;
```

---

### ORDER BY

`ORDER BY` is used to **sort table data**.

SQL Server supports:

* `ASC` → Ascending order
* `DESC` → Descending order
* Default order → `ASC`

Example:

```sql
SELECT *
FROM EMP
ORDER BY ENAME ASC;
```

Salary-wise descending order:

```sql
SELECT *
FROM EMP
ORDER BY SAL DESC;
```

Hire-date-wise ascending order:

```sql
SELECT *
FROM EMP
ORDER BY HIREDATE ASC;
```

---

### Multiple Column Sorting

`ORDER BY` can be used with more than one column.

```sql
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;
```

Here, employees are first arranged **department-wise in ascending order** and then **salary-wise in descending order within each department**.

---

### ORDER BY with Column Number

We can use either a column name or a column number in the `ORDER BY` clause.

The column number is based on the **SELECT list**, not the table structure.

```sql
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY 3 DESC;
```

Here, `3` represents `SAL`, because `SAL` is the third column in the SELECT list.

```text
1 → EMPNO
2 → ENAME
3 → SAL
4 → DEPTNO
```

---

### DISTINCT

`DISTINCT` is used to **eliminate duplicate values** from the SELECT statement output.

Example:

```sql
SELECT DISTINCT JOB
FROM EMP;
```

Another example:

```sql
SELECT DISTINCT DEPTNO
FROM EMP;
```

---

### TOP

`TOP` is used to **display the top N rows** from a table.

Example:

```sql
SELECT TOP 5 *
FROM EMP;
```

Top 5 highest-paid employees:

```sql
SELECT TOP 5 *
FROM EMP
ORDER BY SAL DESC;
```

Top 5 employees based on experience:

```sql
SELECT TOP 5 *
FROM EMP
ORDER BY HIREDATE ASC;
```

Top 3 distinct salaries:

```sql
SELECT DISTINCT TOP 3 SAL
FROM EMP
ORDER BY SAL DESC;
```

---

## 💡 Practical Examples

### Employees Working as CLERK or MANAGER

```sql
SELECT *
FROM EMP
WHERE JOB IN ('CLERK', 'MANAGER')
ORDER BY SAL DESC;
```

### Employees Joined in 1981

```sql
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE LIKE '1981%'
ORDER BY ENAME ASC;
```

---

## 📝 Quick Summary

| Clause     | Purpose                    |
| ---------- | -------------------------- |
| `ALIAS`    | Change column heading      |
| `WHERE`    | Select specific rows       |
| `ORDER BY` | Sort table data            |
| `DISTINCT` | Eliminate duplicate values |
| `TOP`      | Select top N rows          |

---

## 🎯 Key Takeaway

Day 11 helped strengthen the understanding of how SQL Server can control and present query results.

By using **ALIAS**, column headings can be made more meaningful. `ORDER BY` helps sort data, `DISTINCT` removes duplicate values, and `TOP` helps retrieve the required number of records.

These concepts are important for writing clean, readable, and practical SQL queries.

---

## 🚀 Learning Progress

| Day | Topic                                      |
| --: | ------------------------------------------ |
|  01 | SQL Fundamentals                           |
|  02 | SQL Server Fundamentals                    |
|  03 | SQL Sublanguages                           |
|  04 | SQL Server Database Basics                 |
|  05 | SQL Server Data Types                      |
|  06 | SQL Server Data Types — Part 2             |
|  07 | Creating Tables & Inserting Data           |
|  08 | SQL Server Operators & Filtering           |
|  09 | SQL Server IN & BETWEEN Operators          |
|  10 | SQL Server LIKE & IS Operators             |
|  11 | SQL Server ALIAS, ORDER BY, DISTINCT & TOP |

---

<div align="center">

### 🚀 Learn → Practice → Document → Improve

</div>
