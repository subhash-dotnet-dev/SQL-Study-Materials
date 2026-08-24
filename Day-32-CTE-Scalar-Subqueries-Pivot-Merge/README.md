<div align="center">

# 🗄️ Day 32 — SQL Server

### CTE • SCALAR SUBQUERIES • STRING_SPLIT() • PIVOT • SELECT INTO • MERGE

<img src="../assets/sql-logo.svg" width="90" alt="SQL Learning Logo">

<br><br>

**📚 Concepts** &nbsp;•&nbsp; **🧠 Interview Preparation** &nbsp;•&nbsp; **📝 Revision Notes**

</div>

---

## 📌 Overview

Day 32 focuses on **Common Table Expressions (CTEs)**, **Scalar Subqueries**, **STRING_SPLIT()**, **PIVOT**, **SELECT INTO**, **INSERT INTO SELECT**, and **MERGE** in SQL Server.

The main goal is to understand how CTEs provide named query results, how scalar subqueries can act like columns, how strings can be converted into rows, how rows can be transformed into columns using `PIVOT`, and how tables can be created, copied, and synchronized.

---

## 🎯 Learning Objectives

By the end of Day 32, the focus was on understanding:

- Common Table Expressions (CTEs)
- CTE Syntax
- CTE vs Derived Table
- CTE with `SELECT`
- CTE with `INSERT`
- CTE with `UPDATE`
- CTE with `DELETE`
- Multiple CTEs
- Delete first N rows using CTE
- Delete duplicate rows using CTE
- `ROW_NUMBER()` with `PARTITION BY`
- Scalar Subqueries
- Scalar Subquery inside `SELECT`
- Department-wise salary and total salary
- Salary percentage calculation
- `STRING_SPLIT()`
- Table-Valued Functions
- String to Rows transformation
- `STRING_SPLIT()` with `SUM()` and `AVG()`
- `PIVOT` Operator
- Rows to Columns transformation
- Matrix / Cross-Tabulation
- `SELECT INTO`
- Creating a new table from an existing table
- Copying selected rows and columns
- Creating structure without data
- `INSERT INTO SELECT`
- Copying data between existing tables
- `MERGE` Command
- Source and Target Synchronization
- `INSERT + UPDATE + DELETE`

---

# 📦 COMMON TABLE EXPRESSION (CTE)

**CTE** stands for **Common Table Expression**.

A CTE is a temporary named result set that can be referenced by the main query.

### Syntax

```sql
WITH CTE_NAME AS
(
    SELECT statement
)
SELECT / INSERT / UPDATE / DELETE
FROM CTE_NAME;
