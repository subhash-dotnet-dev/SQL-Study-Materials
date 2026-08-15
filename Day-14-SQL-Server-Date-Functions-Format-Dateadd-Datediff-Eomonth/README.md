<div align="center">

# 🗄️ Day 14 — SQL Server Date Functions

### FORMAT(), DATEADD(), DATEDIFF() & EOMONTH()

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 14 focuses on advanced **SQL Server Date Functions** used to format dates, add or subtract time intervals, calculate differences between dates, and find the last day of a month.

The session covers `FORMAT()`, `DATEADD()`, `DATEDIFF()`, and `EOMONTH()` with practical employee, transaction, and gold-rate scenarios.

---

## 🎯 Learning Objectives

By the end of Day 14, the focus was on understanding:

- `FORMAT()`
- Date formatting patterns
- `DATEADD()`
- Adding and subtracting date intervals
- `DATEDIFF()`
- Calculating experience
- Years and months calculation
- `EOMONTH()`
- First day of current month
- First day of next month
- First day of current year
- First day of next year
- Date-based filtering scenarios

---

## 📚 Concepts Covered

| # | Function | Purpose |
|---:|---|---|
| 01 | `FORMAT()` | Display date in different formats |
| 02 | `DATEADD()` | Add / subtract date intervals |
| 03 | `DATEDIFF()` | Find difference between dates |
| 04 | `EOMONTH()` | Return last day of a month |

---

# 📅 FORMAT()

`FORMAT()` is used to display dates in different formats.

### Syntax

```sql
FORMAT(date, 'format')
