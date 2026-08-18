<div align="center">

# 🗄️ Day 20 — SQL Server ROLLUP(), CUBE() & GROUPING_ID()

### ROLLUP() • CUBE() • GROUPING_ID() • Range Grouping • Duplicate Detection

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 20 focuses on **ROLLUP(), CUBE(), and GROUPING_ID()** in SQL Server.

The session covers how to generate **subtotals and grand totals**, perform multidimensional grouping analysis, identify grouping levels using `GROUPING_ID()`, create salary ranges using `CASE + GROUP BY`, and detect duplicate records using `GROUP BY + HAVING`.

It also includes practical examples for **state-wise/gender-wise analysis** and **year-wise/quarter-wise sales analysis**.

---

## 🎯 Learning Objectives

By the end of Day 20, the focus was on understanding:

- `ROLLUP()`
- `CUBE()`
- `GROUPING_ID()`
- Subtotals
- Grand Total
- Hierarchical grouping
- Combination-based grouping
- State-wise analysis
- Gender-wise analysis
- State-wise and gender-wise grouping
- Year-wise analysis
- Quarter-wise analysis
- Year-wise and quarter-wise grouping
- Range grouping using `CASE`
- Salary range analysis
- Duplicate record detection
- `GROUP BY + HAVING`
- Practical reporting scenarios

---

# 🧠 ROLLUP() & CUBE()

Both `ROLLUP()` and `CUBE()` are used with `GROUP BY` to generate **subtotals and grand totals**.

### ROLLUP()

Generates hierarchical subtotals and a grand total.

### CUBE()

Generates subtotals for different combinations of grouping columns along with the grand total.

---

# 1️⃣ ROLLUP()

`ROLLUP()` generates **subtotals for hierarchical groups** and also calculates the **grand total**.

### Syntax

```sql
GROUP BY ROLLUP(column1, column2)


