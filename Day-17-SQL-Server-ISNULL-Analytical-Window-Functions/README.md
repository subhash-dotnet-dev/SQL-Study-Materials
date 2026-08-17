<div align="center">

# 🗄️ Day 17 — SQL Server ISNULL() & Analytical / Window Functions

### ISNULL(), RANK(), DENSE_RANK(), PARTITION BY, ROW_NUMBER(), LAG() & LEAD()

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 17 focuses on **SQL Server Special Functions and Analytical / Window Functions** used for handling `NULL` values, ranking records, group-wise analysis, sequential numbering, and comparing values between rows.

The session covers `ISNULL()`, `RANK()`, `DENSE_RANK()`, `PARTITION BY`, `ROW_NUMBER()`, `LAG()`, and `LEAD()` with practical employee, department, sales, and population analysis scenarios.

---

## 🎯 Learning Objectives

By the end of Day 17, the focus was on understanding:

- `ISNULL()`
- Handling `NULL` values
- `RANK()`
- `DENSE_RANK()`
- Difference between `RANK()` and `DENSE_RANK()`
- `PARTITION BY`
- Department-wise ranking
- `ROW_NUMBER()`
- Difference between ranking and row numbering
- `LAG()`
- `LEAD()`
- Previous and next row analysis
- Sales growth analysis
- Population growth analysis
- Analytical / Window Functions

---

## 📚 Concepts Covered

| # | Function / Concept | Purpose |
|---:|---|---|
| 01 | `ISNULL()` | Replace `NULL` values |
| 02 | `RANK()` | Rank records with possible gaps |
| 03 | `DENSE_RANK()` | Rank records without gaps |
| 04 | `PARTITION BY` | Perform analysis within groups |
| 05 | `ROW_NUMBER()` | Assign unique row numbers |
| 06 | `LAG()` | Access previous row value |
| 07 | `LEAD()` | Access next row value |

---

# 🔹 ISNULL()

`ISNULL()` is used to replace a `NULL` value with a specified replacement value.

### Syntax

```sql
ISNULL(expression, replacement_value)

