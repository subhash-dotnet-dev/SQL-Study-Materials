<div align="center">

# 🗄️ Day 08 — SQL Server Operators & Filtering

### Understanding Operators, SELECT & WHERE in SQL Server

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 08 focuses on understanding **SQL Server operators**, displaying data using `SELECT`, and filtering specific rows using the `WHERE` clause.

The session also covers compound conditions using `AND` and `OR`, operator priority, and basic student filtering scenarios.

---

## 🎯 Learning Objectives

By the end of Day 08, the focus was on understanding:

- Arithmetic Operators
- Relational Operators
- Logical Operators
- Special Operators
- Set Operators
- SELECT Command
- WHERE Clause
- Compound Conditions
- AND / OR
- Operator Priority
- Student Pass/Fail Conditions

---

## 📚 Concepts Covered

| # | Concept | Examples |
|---:|---|---|
| 01 | Arithmetic | +, -, *, /, % |
| 02 | Relational | <, >, <=, >=, =, <>, != |
| 03 | Logical | AND, OR, NOT |
| 04 | Special | BETWEEN, IN, LIKE, IS, ANY, ALL, EXISTS, PIVOT |
| 05 | Set | UNION, UNION ALL, INTERSECT, EXCEPT |
| 06 | SELECT | Display data |
| 07 | WHERE | Filter rows |
| 08 | Compound Condition | AND / OR |
| 09 | Operator Priority | AND > OR |

---

## 🧠 Key Takeaways

### Operators

SQL Server operators are used to perform calculations, comparisons, logical operations, filtering, and set operations.

### SELECT

`SELECT` is used to display data from a table.

```sql
SELECT ENAME, SAL
FROM EMP;
