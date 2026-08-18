<div align="center">

# 🗄️ Day 19 — SQL Server CASE Statement & GROUP BY

### CASE Statement • GROUP BY • HAVING • WHERE vs HAVING

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 19 focuses on the **CASE Statement** and **GROUP BY** in SQL Server.

The session covers how to implement conditional logic using **Simple CASE** and **Searched CASE**, group rows for summary analysis using `GROUP BY`, and filter grouped results using `HAVING`.

It also covers the difference between **WHERE and HAVING**, multiple-column grouping, and year/month/day/quarter-wise analysis.

---

## 🎯 Learning Objectives

By the end of Day 19, the focus was on understanding:

- Simple CASE statement
- Searched CASE statement
- Conditional value generation
- Salary classification using CASE
- Student result and grade calculation
- `GROUP BY`
- Grouping by one or more columns
- Aggregate functions with `GROUP BY`
- `HAVING`
- `WHERE` vs `HAVING`
- Department-wise analysis
- Job-wise analysis
- Year-wise analysis
- Month-wise analysis
- Day-wise analysis
- Quarter-wise analysis
- `GROUP BY` and column alias behavior
- `ORDER BY` and column alias behavior

---

# 🧠 CASE STATEMENT

The `CASE` statement is used to implement **IF-THEN-ELSE logic** in SQL Server.

It can return different values based on specified conditions.

SQL Server supports two types of CASE statements:

1. **Simple CASE**
2. **Searched CASE**

---

# 1️⃣ SIMPLE CASE

Simple CASE is used when conditions are based on **equality (`=`)**.

### Syntax

```sql
CASE column_name
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ELSE result
END
