<div align="center">

# 🗄️ Day 10 — SQL Server LIKE & IS Operators

### Pattern Matching, Wildcards, ESCAPE & NULL Comparison

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 10 focuses on **LIKE and IS operators** in SQL Server.

The session covers pattern comparison using LIKE, wildcard characters, ESCAPE, NULL comparison using IS, and student absence filtering.

---

## 🎯 Learning Objectives

By the end of Day 10, the focus was on understanding:

- LIKE Operator
- Pattern Comparison
- Wildcard Characters
- `%` Wildcard
- `_` Wildcard
- Character Pattern Matching
- ESCAPE
- IS Operator
- IS NULL
- IS NOT NULL
- Student Absence Filtering

---

## 📚 Concepts Covered

| # | Concept | Purpose |
|---:|---|---|
| 01 | LIKE | Pattern comparison |
| 02 | `%` | 0 or many characters |
| 03 | `_` | Exactly 1 character |
| 04 | Character Pattern | `[a-p]`, `[aeiou]`, `[akv]` |
| 05 | ESCAPE | Search `%` or `_` as actual characters |
| 06 | IS NULL | Check NULL values |
| 07 | IS NOT NULL | Check non-NULL values |

---

## 🧠 Key Takeaways

### LIKE Operator

LIKE is used for **pattern comparison**.

```sql
WHERE COLNAME LIKE 'PATTERN'
