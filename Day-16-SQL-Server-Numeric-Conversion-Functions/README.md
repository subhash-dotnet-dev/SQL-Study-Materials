<div align="center">

# 🗄️ Day 16 — SQL Server Numeric & Conversion Functions

### ROUND(), FLOOR(), CEILING(), CAST() & CONVERT()

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes** &nbsp;•&nbsp; **💻 SQL Practice**

</div>

---

## 📌 Overview

Day 16 focuses on **Numeric/Mathematical Functions** and **Conversion Functions** in SQL Server.

The session covers functions used for rounding numeric values, converting data types, formatting dates, and displaying numeric values in readable formats.

The main functions studied are:

- `ROUND()`
- `FLOOR()`
- `CEILING()`
- `CAST()`
- `CONVERT()`

---

## 🎯 Learning Objectives

By the end of Day 16, the focus was on understanding:

- Numeric and mathematical functions
- Rounding numbers using `ROUND()`
- Rounding down using `FLOOR()`
- Rounding up using `CEILING()`
- Explicit data type conversion using `CAST()`
- Data type conversion using `CONVERT()`
- Date formatting using `CONVERT()`
- SQL Server date style numbers
- Formatting numeric/money values
- Difference between `CAST()` and `CONVERT()`
- Practical employee salary and reporting scenarios

---

# 📚 Functions Covered

| # | Function | Purpose |
|---:|---|---|
| 01 | `ROUND()` | Rounds a number to specified decimal places |
| 02 | `FLOOR()` | Always rounds down |
| 03 | `CEILING()` | Always rounds up |
| 04 | `CAST()` | Explicit data type conversion |
| 05 | `CONVERT()` | Data type conversion with formatting styles |

---

# 🔢 ROUND()

`ROUND()` is used to round a numeric value to a specified number of decimal places.

### Syntax

```sql
ROUND(number, decimal_places)
