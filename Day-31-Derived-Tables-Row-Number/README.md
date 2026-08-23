<div align="center">

# 🗄️ Day 31 — SQL Server

### DERIVED TABLES • DENSE_RANK() • ROW_NUMBER()

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 31 focuses on **Derived Tables**, **DENSE_RANK()**, and **ROW_NUMBER()** in SQL Server.

The main goal is to understand how a sub-query inside the `FROM` clause can be treated like a table and how ranking functions can be used to filter and analyze query results.

---

## 🎯 Learning Objectives

By the end of Day 31, the focus was on understanding:

- Derived Tables
- Sub-query inside `FROM`
- Query Execution Order
- `DENSE_RANK()`
- Top 5 Employees
- Top 5 Distinct Salaries
- 5th Highest Salary
- `ROW_NUMBER()`
- Row Filtering
- Last 3 Rows
- Derived Table Use Cases
- Difference between `DENSE_RANK()` and `ROW_NUMBER()`

---

# 📦 DERIVED TABLE

A sub-query written inside the `FROM` clause is called a **Derived Table**.

The output of the sub-query acts like a table for the outer query.

### Syntax

```sql
SELECT columns
FROM
(
    SELECT statement
) AS E
WHERE condition;
