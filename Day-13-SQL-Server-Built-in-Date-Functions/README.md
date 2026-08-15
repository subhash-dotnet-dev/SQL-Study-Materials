<div align="center">

# 🗄️ Day 13 — SQL Server Built-in Functions

### Understanding Functions, GETDATE(), DATEPART(), DATENAME() & String Concatenation

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 13 focuses on understanding **Built-in Functions in SQL Server**, especially Date Functions used to work with dates and times.

This session covers `GETDATE()`, `DATEPART()`, `DATENAME()`, date intervals, quarters, practical date filtering, and string concatenation using the `+` operator.

---

## 🎯 Learning Objectives

By the end of Day 13, the focus was on understanding:

- Built-in Functions
- Types of SQL Server Functions
- Date Functions
- `GETDATE()`
- `DATEPART()`
- Date Intervals
- Quarters
- `DATENAME()`
- Difference between `DATEPART()` and `DATENAME()`
- Date-based filtering
- Leap year filtering
- String Concatenation using `+`

---

## 📚 Types of Functions

SQL Server provides different types of built-in functions.

| # | Function Type |
|---:|---|
| 01 | Date Functions |
| 02 | Character / String Functions |
| 03 | Numeric / Mathematical Functions |
| 04 | Conversion Functions |
| 05 | Special Functions |
| 06 | Analytical Functions |
| 07 | Aggregate Functions |

---

## 📅 Date Functions

Date functions are used to work with date and time values.

---

## 🔹 GETDATE()

`GETDATE()` returns the current date and time of the SQL Server system.

### Syntax

```sql
SELECT GETDATE();
