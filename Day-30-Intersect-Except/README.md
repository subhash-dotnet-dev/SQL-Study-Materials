<div align="center">

# 🗄️ Day 30 — SQL Server INTERSECT & EXCEPT

### INTERSECT • EXCEPT • SET OPERATORS • QUERY COMPARISON

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 30 focuses on **INTERSECT** and **EXCEPT** in SQL Server.

These SET OPERATORS are used to **compare the result of two queries** and identify common or different records.

The main topics covered are:

- `INTERSECT`
- `EXCEPT`
- Difference between `INTERSECT` and `EXCEPT`
- Finding common records
- Finding records available only in the first query
- Finding new customer records
- `EXCEPT` with `LEFT JOIN`
- Copying new data from one table to another
- JOIN result practice
- SET OPERATOR rules

---

## 🎯 Learning Objectives

By the end of Day 30, the focus was on understanding:

- `INTERSECT`
- `EXCEPT`
- Common values between query results
- Difference between two query results
- Finding new customers
- `EXCEPT` vs `LEFT JOIN`
- `LEFT JOIN` with `IS NULL`
- Copying new records using `INSERT INTO`
- JOIN result calculations
- `UNION`
- `UNION ALL`
- `INTERSECT`
- `EXCEPT`
- SET OPERATOR rules

---

# 🔗 SET OPERATORS

SET OPERATORS are used to perform operations between the **result of two queries**.

### Available SET OPERATORS

| Operator | Purpose |
|---|---|
| `UNION` | Combines rows and removes duplicates |
| `UNION ALL` | Combines rows and keeps duplicates |
| `INTERSECT` | Returns common rows |
| `EXCEPT` | Returns rows from first query not present in second |

---

## 📌 SET OPERATOR RULES

### Rule 1 — Same Number of Columns

Both queries must return the **same number of columns**.

### Rule 2 — Compatible Datatypes

Corresponding columns must have the **same / compatible datatype**.

### Basic Syntax

```sql
SELECT statement1

UNION / UNION ALL / INTERSECT / EXCEPT

SELECT statement2;
