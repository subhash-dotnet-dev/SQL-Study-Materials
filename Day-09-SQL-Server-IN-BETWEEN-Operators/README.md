<div align="center">

# 🗄️ Day 09 — SQL Server IN & BETWEEN Operators

### Filtering Data Using IN, NOT IN, BETWEEN & NOT BETWEEN

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **💻 SQL Practice**

</div>

---

## 📌 Overview

Day 09 focuses on **IN and BETWEEN operators** in SQL Server.

These operators make filtering easier when working with multiple values and ranges.

---

## 🎯 Learning Objectives

By the end of Day 09, the focus was on understanding:

- IN Operator
- NOT IN Operator
- BETWEEN Operator
- NOT BETWEEN Operator
- List Comparison
- Range Comparison
- Multiple Conditions
- Employee Filtering
- Product Filtering
- Customer Filtering

---

## 📚 Concepts Covered

| # | Concept | Purpose |
|---:|---|---|
| 01 | IN | Compare with multiple values |
| 02 | NOT IN | Exclude multiple values |
| 03 | BETWEEN | Compare values within a range |
| 04 | NOT BETWEEN | Exclude a range |
| 05 | AND | Combine conditions |
| 06 | Filtering | Get required rows |

---

## 🧠 Key Takeaways

### IN Operator

`IN` is used for comparison with multiple values.

```sql
WHERE COLNAME IN (V1, V2, V3)
