<div align="center">

# 🗄️ Day 18 — SQL Server Aggregate Functions

### MAX(), MIN(), SUM(), AVG(), COUNT() & COUNT(*)

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 18 focuses on **SQL Server Aggregate Functions** used to process multiple rows and return a single summarized value.

The session covers `MAX()`, `MIN()`, `SUM()`, `AVG()`, `COUNT()`, and `COUNT(*)` with practical employee salary, commission, and reporting scenarios.

---

## 🎯 Learning Objectives

By the end of Day 18, the focus was on understanding:

- `MAX()`
- `MIN()`
- `SUM()`
- `AVG()`
- `COUNT()`
- `COUNT(*)`
- NULL handling with aggregate functions
- Salary analysis
- Employee counting
- Conditional aggregate queries
- Difference between `COUNT(column)` and `COUNT(*)`
- Important restrictions on aggregate functions

---

## 📚 Concepts Covered

| # | Function | Purpose |
|---:|---|---|
| 01 | `MAX()` | Returns the maximum value |
| 02 | `MIN()` | Returns the minimum value |
| 03 | `SUM()` | Returns the total |
| 04 | `AVG()` | Returns the average |
| 05 | `COUNT()` | Counts non-NULL values |
| 06 | `COUNT(*)` | Counts all rows |

---

# 🔝 MAX()

`MAX()` returns the **maximum value** from a column.

### Syntax

```sql
MAX(column)
